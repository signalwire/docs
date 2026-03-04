#!/usr/bin/env python3
"""Diagnose proxy 404s with targeted tests.

Reads failed URLs from proxy-404-report.txt and runs diagnostics:
  1. Cache bypass     - request with no-cache headers
  2. Trailing slash   - /path vs /path/
  3. Rapid burst      - 10 fast requests to detect flapping
  4. Delayed retry    - wait then retry to detect time-based cache expiry
  5. User-Agent swap  - bot vs browser UA
  6. Response body    - what 404 page is being served (nginx, Vercel, Fern)

Usage:
    python scripts/diagnose-404s.py [--sample N] [--parallel N]
"""

import argparse
import asyncio
import re
import sys
from datetime import datetime, timezone

try:
    import aiohttp
except ImportError:
    import subprocess
    subprocess.check_call([sys.executable, "-m", "pip", "install", "aiohttp", "-q"])
    import aiohttp

PROXY_BASE = "https://signalwire.com"
REPORT_IN = "scripts/proxy-404-report.txt"
REPORT_OUT = "scripts/proxy-404-diagnosis.txt"

BROWSER_UA = "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36"
BOT_UA = "Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)"
CURL_UA = "curl/8.7.1"


def load_failed_paths() -> list[str]:
    """Extract failed paths from previous report."""
    paths = []
    with open(REPORT_IN) as f:
        in_table = False
        for line in f:
            line = line.strip()
            if line.startswith("PROXY") and "ORIGIN" in line and "PATH" in line:
                in_table = True
                continue
            if line.startswith("-----"):
                continue
            if in_table:
                if not line or line.startswith("PROXY") or line.startswith("Both"):
                    break
                parts = line.split()
                if len(parts) >= 3:
                    paths.append(parts[2])
    return paths


async def fetch(session: aiohttp.ClientSession, url: str,
                headers: dict = None, allow_redirects: bool = True,
                timeout: int = 10) -> dict:
    """Fetch URL and return status, headers, body snippet."""
    try:
        async with session.get(
            url,
            headers=headers or {},
            allow_redirects=allow_redirects,
            timeout=aiohttp.ClientTimeout(total=timeout),
        ) as resp:
            body = await resp.text()
            # Extract a useful snippet from the body
            title_match = re.search(r"<title[^>]*>(.*?)</title>", body, re.IGNORECASE | re.DOTALL)
            title = title_match.group(1).strip() if title_match else ""
            return {
                "status": resp.status,
                "headers": dict(resp.headers),
                "title": title[:120],
                "body_len": len(body),
                "url": str(resp.url),  # final URL after redirects
            }
    except Exception as e:
        return {"status": 0, "headers": {}, "title": "", "body_len": 0, "url": url, "error": str(e)}


async def test_cache_bypass(session: aiohttp.ClientSession, url: str) -> dict:
    """Request with cache-busting headers."""
    headers = {
        "Cache-Control": "no-cache, no-store, must-revalidate",
        "Pragma": "no-cache",
        "If-None-Match": "",  # prevent 304
    }
    return await fetch(session, url, headers=headers)


async def test_trailing_slash(session: aiohttp.ClientSession, url: str) -> dict:
    """Test with trailing slash toggled, no redirects to see raw response."""
    alt = url.rstrip("/") + "/" if not url.endswith("/") else url.rstrip("/")
    return await fetch(session, alt, allow_redirects=False)


async def test_no_redirect(session: aiohttp.ClientSession, url: str) -> dict:
    """Test the original URL without following redirects."""
    return await fetch(session, url, allow_redirects=False)


async def test_burst(session: aiohttp.ClientSession, url: str, count: int = 10) -> dict:
    """Rapid-fire requests to detect flapping."""
    tasks = [fetch(session, url) for _ in range(count)]
    results = await asyncio.gather(*tasks)
    statuses = [r["status"] for r in results]
    return {
        "statuses": statuses,
        "unique": sorted(set(statuses)),
        "flapping": len(set(statuses)) > 1,
    }


async def test_user_agents(session: aiohttp.ClientSession, url: str) -> dict:
    """Test with different User-Agent strings."""
    results = {}
    for name, ua in [("browser", BROWSER_UA), ("googlebot", BOT_UA), ("curl", CURL_UA)]:
        r = await fetch(session, url, headers={"User-Agent": ua})
        results[name] = {"status": r["status"], "body_len": r["body_len"], "title": r["title"]}
    return results


async def test_delay_retry(session: aiohttp.ClientSession, url: str, delay: float = 3.0) -> dict:
    """Wait, then retry to see if cache refreshes."""
    r1 = await fetch(session, url)
    await asyncio.sleep(delay)
    r2 = await fetch(session, url)
    return {
        "before": {"status": r1["status"], "etag": r1["headers"].get("Etag", ""), "age": r1["headers"].get("Age", "")},
        "after":  {"status": r2["status"], "etag": r2["headers"].get("Etag", ""), "age": r2["headers"].get("Age", "")},
        "changed": r1["headers"].get("Etag") != r2["headers"].get("Etag"),
    }


async def diagnose_url(session: aiohttp.ClientSession, path: str, semaphore: asyncio.Semaphore) -> dict:
    """Run all diagnostics on a single URL."""
    url = PROXY_BASE + path
    async with semaphore:
        baseline, cache_bypass, trailing, no_redir, burst, uas, delay = await asyncio.gather(
            fetch(session, url),
            test_cache_bypass(session, url),
            test_trailing_slash(session, url),
            test_no_redirect(session, url),
            test_burst(session, url),
            test_user_agents(session, url),
            test_delay_retry(session, url),
        )
    return {
        "path": path,
        "baseline": baseline,
        "cache_bypass": cache_bypass,
        "trailing_slash": trailing,
        "no_redirect": no_redir,
        "burst": burst,
        "user_agents": uas,
        "delay_retry": delay,
    }


async def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--sample", type=int, default=10, help="Number of URLs to diagnose (default: 10)")
    parser.add_argument("--parallel", type=int, default=5, help="Concurrent URL diagnostics (default: 5)")
    args = parser.parse_args()

    paths = load_failed_paths()
    if not paths:
        print(f"No failed paths found in {REPORT_IN}")
        return

    # Sample a spread: first, middle, last
    if args.sample < len(paths):
        step = len(paths) / args.sample
        paths = [paths[int(i * step)] for i in range(args.sample)]

    lines: list[str] = []
    def log(msg: str = ""):
        print(msg)
        lines.append(msg)

    log(f"=== Proxy 404 Diagnosis — {datetime.now(timezone.utc).strftime('%Y-%m-%d %H:%M:%S UTC')} ===")
    log(f"Testing {len(paths)} URLs from {REPORT_IN}")
    log()

    semaphore = asyncio.Semaphore(args.parallel)
    connector = aiohttp.TCPConnector(limit=50, limit_per_host=50)
    async with aiohttp.ClientSession(connector=connector) as session:
        tasks = [diagnose_url(session, p, semaphore) for p in paths]
        results = await asyncio.gather(*tasks)

    # Summary table
    log(f"{'PATH':<75} {'BASE':>4} {'NOCACHE':>7} {'TRAIL':>5} {'NOREDIR':>7} {'BURST':>10} {'UA-BOT':>6} {'DELAY':>5}")
    log("-" * 135)
    for r in results:
        path = r["path"][:74]
        base = r["baseline"]["status"]
        nocache = r["cache_bypass"]["status"]
        trail = r["trailing_slash"]["status"]
        noredir = r["no_redirect"]["status"]
        burst_s = ",".join(str(s) for s in r["burst"]["unique"])
        ua_bot = r["user_agents"]["googlebot"]["status"]
        delay_s = r["delay_retry"]["after"]["status"]
        log(f"{path:<75} {base:>4} {nocache:>7} {trail:>5} {noredir:>7} {burst_s:>10} {ua_bot:>6} {delay_s:>5}")

    # Detailed per-URL diagnostics
    log()
    log("=" * 80)
    log("DETAILED DIAGNOSTICS")
    log("=" * 80)

    for r in results:
        log()
        log(f"--- {r['path']} ---")

        b = r["baseline"]
        log(f"  Baseline:       {b['status']}  title=\"{b['title']}\"  body={b['body_len']}b")
        log(f"                  age={b['headers'].get('Age', 'n/a')}  etag={b['headers'].get('Etag', 'n/a')}")
        log(f"                  vercel-cache={b['headers'].get('X-Vercel-Cache', 'n/a')}  vercel-id={b['headers'].get('X-Vercel-Id', 'n/a')}")

        c = r["cache_bypass"]
        log(f"  Cache bypass:   {c['status']}  title=\"{c['title']}\"  body={c['body_len']}b")
        log(f"                  age={c['headers'].get('Age', 'n/a')}  etag={c['headers'].get('Etag', 'n/a')}")

        t = r["trailing_slash"]
        log(f"  Trailing slash: {t['status']}  url={t['url']}  title=\"{t['title']}\"")
        if t["status"] in (301, 302, 307, 308):
            log(f"                  -> {t['headers'].get('Location', 'n/a')}")

        nr = r["no_redirect"]
        log(f"  No redirect:    {nr['status']}  url={nr['url']}")
        if nr["status"] in (301, 302, 307, 308):
            log(f"                  -> {nr['headers'].get('Location', 'n/a')}")

        burst = r["burst"]
        log(f"  Burst (10x):    {burst['unique']}  flapping={burst['flapping']}")
        if burst["flapping"]:
            log(f"                  all: {burst['statuses']}")

        uas = r["user_agents"]
        log(f"  User-Agents:    browser={uas['browser']['status']}  googlebot={uas['googlebot']['status']}  curl={uas['curl']['status']}")
        if len(set(v["status"] for v in uas.values())) > 1:
            log(f"                  *** UA-DEPENDENT BEHAVIOR ***")

        d = r["delay_retry"]
        log(f"  Delay retry:    before={d['before']['status']} (age={d['before']['age']})  after={d['after']['status']} (age={d['after']['age']})  etag_changed={d['changed']}")

    # Analysis
    log()
    log("=" * 80)
    log("ANALYSIS")
    log("=" * 80)

    all_flapping = [r for r in results if r["burst"]["flapping"]]
    all_cache_fix = [r for r in results if r["cache_bypass"]["status"] == 200 and r["baseline"]["status"] != 200]
    all_trail_diff = [r for r in results if r["trailing_slash"]["status"] != r["baseline"]["status"]]
    all_ua_diff = [r for r in results if len(set(v["status"] for v in r["user_agents"].values())) > 1]
    all_delay_fix = [r for r in results if r["delay_retry"]["after"]["status"] == 200 and r["baseline"]["status"] != 200]

    log(f"  Flapping (burst gives mixed results):  {len(all_flapping)}/{len(results)}")
    log(f"  Fixed by cache bypass headers:         {len(all_cache_fix)}/{len(results)}")
    log(f"  Different with trailing slash:          {len(all_trail_diff)}/{len(results)}")
    log(f"  User-Agent dependent:                  {len(all_ua_diff)}/{len(results)}")
    log(f"  Fixed after 3s delay:                  {len(all_delay_fix)}/{len(results)}")

    if all_flapping:
        log("\n  -> FLAPPING suggests load balancer routing to inconsistent backends")
    if all_cache_fix:
        log("\n  -> CACHE BYPASS fixing it confirms stale cache as root cause")
    if all_trail_diff:
        log("\n  -> TRAILING SLASH difference suggests URL normalization issue")
    if all_ua_diff:
        log("\n  -> UA-DEPENDENT responses suggest bot filtering or CDN edge rules")
    if not any([all_flapping, all_cache_fix, all_trail_diff, all_ua_diff, all_delay_fix]):
        log("\n  -> All tests show consistent 404s — likely a deterministic routing/rewrite issue")

    with open(REPORT_OUT, "w", encoding="utf-8") as f:
        f.write("\n".join(lines))
    log(f"\nReport saved to: {REPORT_OUT}")


if __name__ == "__main__":
    asyncio.run(main())
