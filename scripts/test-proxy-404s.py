#!/usr/bin/env python3
"""Test reverse proxy for 404s by comparing against Fern origin.

Usage:
    python scripts/test-proxy-404s.py [--all] [--limit N] [--parallel N]
    python scripts/test-proxy-404s.py --preview --all   # use preview sitemap
"""

import argparse
import asyncio
import sys
import xml.etree.ElementTree as ET
from datetime import datetime, timezone

try:
    import aiohttp
except ImportError:
    print("Installing aiohttp...")
    import subprocess
    subprocess.check_call([sys.executable, "-m", "pip", "install", "aiohttp", "-q"])
    import aiohttp

# Sitemap from direct Fern origin (proxy 404s on sitemap.xml)
PROD_SITEMAP = "https://signalwire.docs.buildwithfern.com/docs/sitemap.xml"
PREVIEW_SITEMAP = "https://signalwire-preview-9652e06b-7f14-4e59-b5d1-990f66a67462.docs.buildwithfern.com/docs/sitemap.xml"

PROD_ORIGIN = "https://signalwire.docs.buildwithfern.com"
PREVIEW_ORIGIN = "https://signalwire-preview-9652e06b-7f14-4e59-b5d1-990f66a67462.docs.buildwithfern.com"
PROXY_BASE = "https://signalwire.com"
REPORT_FILE = "scripts/proxy-404-report.txt"


async def fetch_status(session: aiohttp.ClientSession, url: str, semaphore: asyncio.Semaphore) -> tuple[str, int]:
    async with semaphore:
        try:
            async with session.head(url, timeout=aiohttp.ClientTimeout(total=10), allow_redirects=True) as resp:
                return url, resp.status
        except Exception:
            return url, 0


async def fetch_headers(session: aiohttp.ClientSession, url: str) -> dict:
    try:
        async with session.head(url, timeout=aiohttp.ClientTimeout(total=10), allow_redirects=True) as resp:
            return {"status": resp.status, "headers": dict(resp.headers)}
    except Exception as e:
        return {"status": 0, "headers": {}, "error": str(e)}


async def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--all", action="store_true", help="Check all URLs, don't stop at first 404")
    parser.add_argument("--limit", type=int, default=0, help="Only check first N URLs")
    parser.add_argument("--parallel", type=int, default=50, help="Concurrent requests (default: 50)")
    parser.add_argument("--preview", action="store_true", help="Use preview sitemap (default: production)")
    args = parser.parse_args()

    sitemap_url = PREVIEW_SITEMAP if args.preview else PROD_SITEMAP
    origin_base = PREVIEW_ORIGIN if args.preview else PROD_ORIGIN

    lines: list[str] = []

    def log(msg: str = ""):
        print(msg)
        lines.append(msg)

    mode = "PREVIEW" if args.preview else "PRODUCTION"
    log(f"=== Proxy 404 Report — {datetime.now(timezone.utc).strftime('%Y-%m-%d %H:%M:%S UTC')} ===")
    log(f"Mode: {mode}")
    log(f"Sitemap: {sitemap_url}")
    log(f"Origin:  {origin_base}")
    log(f"Proxy:   {PROXY_BASE}")
    log()

    # Fetch sitemap
    log("=== Fetching sitemap ===")
    connector = aiohttp.TCPConnector(limit=args.parallel, limit_per_host=args.parallel)
    async with aiohttp.ClientSession(connector=connector) as session:
        async with session.get(sitemap_url) as resp:
            sitemap_xml = await resp.text()

    root = ET.fromstring(sitemap_xml)
    ns = {"ns": "http://www.sitemaps.org/schemas/sitemap/0.9"}
    urls = [loc.text for loc in root.findall(".//ns:loc", ns) if loc.text]

    total = len(urls)
    log(f"Found {total} URLs in sitemap")

    if args.limit > 0:
        urls = urls[: args.limit]
        total = len(urls)
        log(f"(Limited to {total})")

    # Build proxy URLs
    proxy_urls = [u.replace(origin_base, PROXY_BASE) for u in urls]

    log()
    log(f"=== Checking {total} URLs ({args.parallel} concurrent) ===")
    log()

    # Phase 1: Check all proxy URLs
    semaphore = asyncio.Semaphore(args.parallel)
    connector = aiohttp.TCPConnector(limit=args.parallel, limit_per_host=args.parallel)
    async with aiohttp.ClientSession(connector=connector) as session:
        tasks = [fetch_status(session, u, semaphore) for u in proxy_urls]
        results = await asyncio.gather(*tasks)

    passes = [(u, s) for u, s in results if s == 200]
    failures = [(u, s) for u, s in results if s != 200]

    log(f"Checked: {total}  |  Pass: {len(passes)}  |  Fail: {len(failures)}")
    log()

    if not failures:
        log("All URLs passed!")
        with open(REPORT_FILE, "w") as f:
            f.write("\n".join(lines))
        log(f"\nReport saved to: {REPORT_FILE}")
        return

    # Phase 2: Check origin for failures only
    log("=== Failures — checking origin ===")
    log()

    origin_urls = [u.replace(PROXY_BASE, origin_base) for u, _ in failures]

    connector = aiohttp.TCPConnector(limit=args.parallel, limit_per_host=args.parallel)
    async with aiohttp.ClientSession(connector=connector) as session:
        origin_tasks = [fetch_status(session, u, semaphore) for u in origin_urls]
        origin_results = await asyncio.gather(*origin_tasks)

    origin_map = {u: s for u, s in origin_results}

    # Print table
    header = f"{'PROXY':<6} {'ORIGIN':<6} PATH"
    sep = f"{'-----':<6} {'------':<6} ----"
    log(header)
    log(sep)

    for proxy_url, proxy_status in failures:
        path = proxy_url.replace(PROXY_BASE, "")
        origin_url = origin_base + path
        origin_status = origin_map.get(origin_url, "???")
        log(f"{proxy_status:<6} {origin_status:<6} {path}")

    log()
    log("PROXY!=200 + ORIGIN=200  ->  reverse proxy issue")
    log("Both!=200                ->  missing from origin")

    # Dump headers for first failure
    first_url = failures[0][0]
    path = first_url.replace(PROXY_BASE, "")
    origin_url = origin_base + path

    log()
    log(f"=== Headers for first failure: {path} ===")

    async with aiohttp.ClientSession() as session:
        proxy_h = await fetch_headers(session, first_url)
        origin_h = await fetch_headers(session, origin_url)

    log("--- Proxy ---")
    log(f"HTTP {proxy_h['status']}")
    for k, v in proxy_h["headers"].items():
        log(f"{k}: {v}")

    log("--- Origin ---")
    log(f"HTTP {origin_h['status']}")
    for k, v in origin_h["headers"].items():
        log(f"{k}: {v}")

    # Write report
    with open(REPORT_FILE, "w") as f:
        f.write("\n".join(lines))
    log(f"\nReport saved to: {REPORT_FILE}")


if __name__ == "__main__":
    asyncio.run(main())
