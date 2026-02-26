#!/usr/bin/env python3
"""Validate cur_full_url entries from the final report against the live site.

Two-phase validation:
  1. Compare cur_full_url against the live sitemap (fast, bulk check)
  2. For URLs not in sitemap, do HTTP HEAD requests to check if they're
     actually accessible (catches pages Fern serves but doesn't index)

Usage:
  python scripts/slug-reconciliation/validate-current-urls.py
  python scripts/slug-reconciliation/validate-current-urls.py --sitemap-only  # skip HTTP checks
"""

import csv
import sys
import time
from pathlib import Path
from urllib.error import HTTPError, URLError
from urllib.parse import urlparse
from urllib.request import urlopen, Request

from utils import fetch_sitemap_paths

SCRIPT_DIR = Path(__file__).resolve().parent
REPORTS_DIR = SCRIPT_DIR / "reports"

SITEMAP_URL = "https://signalwire.docs.buildwithfern.com/sitemap.xml"
BASE_URL = "https://signalwire.docs.buildwithfern.com"
REPORT_CSV = REPORTS_DIR / "slug-final-report.csv"
OUTPUT_FILE = REPORTS_DIR / "url-validation-report.md"


def check_url_accessible(url_path, base_url=BASE_URL):
    """HTTP HEAD check — returns (status_code, final_url_path_or_None).

    Returns (200, path) if accessible, (301/302, redirect_path) if redirected,
    (404, None) if not found, (-1, None) on error.
    """
    full_url = base_url + url_path
    req = Request(full_url, method="HEAD", headers={"User-Agent": "slug-validator/1.0"})
    try:
        with urlopen(req, timeout=10) as resp:
            return resp.status, urlparse(resp.url).path.rstrip("/") or "/"
    except HTTPError as e:
        return e.code, None
    except (URLError, TimeoutError, OSError):
        return -1, None


def load_report_urls(csv_path):
    """Load rows from the final report that have a non-empty cur_full_url."""
    rows = []
    with open(csv_path, newline="") as f:
        for r in csv.DictReader(f):
            cur = r.get("cur_full_url", "").strip()
            if cur:
                rows.append({
                    "old_url": r.get("old_url", ""),
                    "cur_full_url": cur,
                    "action": r.get("action", ""),
                    "category": r.get("category", ""),
                    "fern_file": r.get("fern_file", ""),
                    "cur_page_slug": r.get("cur_page_slug", ""),
                    "cur_tab_slug": r.get("cur_tab_slug", ""),
                    "cur_product_slug": r.get("cur_product_slug", ""),
                })
    return rows


def main():
    sitemap_only = "--sitemap-only" in sys.argv

    # Fetch sitemap
    print(f"Fetching sitemap from {SITEMAP_URL} ...")
    sitemap_paths = fetch_sitemap_paths(SITEMAP_URL)
    print(f"  Found {len(sitemap_paths)} URLs in sitemap")

    # Load report
    report_rows = load_report_urls(REPORT_CSV)
    print(f"Loaded {len(report_rows)} rows with cur_full_url from report")

    # Deduplicate cur_full_url values
    unique_urls = {}
    for r in report_rows:
        key = r["cur_full_url"].rstrip("/").lower() or "/"
        if key not in unique_urls:
            unique_urls[key] = r

    print(f"Unique cur_full_url values to validate: {len(unique_urls)}")

    # Phase 1: Sitemap comparison
    in_sitemap = []
    not_in_sitemap = []
    for url_key, row in sorted(unique_urls.items()):
        if url_key in sitemap_paths:
            in_sitemap.append(row)
        else:
            not_in_sitemap.append(row)

    total = len(unique_urls)
    n_found = len(in_sitemap)
    pct = (n_found / total * 100) if total else 0

    print(f"\nPhase 1: Sitemap comparison")
    print(f"  Found in sitemap:      {n_found} ({pct:.1f}%)")
    print(f"  NOT in sitemap:        {len(not_in_sitemap)}")

    # Phase 2: HTTP HEAD checks for missing URLs
    accessible = []       # 200 OK — page exists, just not in sitemap
    redirected = []       # 301/302 — page redirects somewhere
    not_found = []        # 404 — page genuinely doesn't exist
    errors = []           # connection/timeout errors

    if not_in_sitemap and not sitemap_only:
        print(f"\nPhase 2: HTTP HEAD checks for {len(not_in_sitemap)} missing URLs...")
        for i, row in enumerate(not_in_sitemap):
            url_path = row["cur_full_url"].rstrip("/") or "/"
            status, final_path = check_url_accessible(url_path)

            row["http_status"] = status
            row["http_final_path"] = final_path or ""

            if status == 200:
                accessible.append(row)
            elif status in (301, 302, 307, 308):
                redirected.append(row)
            elif status == 404:
                not_found.append(row)
            else:
                errors.append(row)

            # Rate limit
            if (i + 1) % 10 == 0:
                print(f"  Checked {i + 1}/{len(not_in_sitemap)}...", flush=True)
                time.sleep(0.2)

        print(f"\n  Accessible (200):    {len(accessible)}")
        print(f"  Redirected (3xx):    {len(redirected)}")
        print(f"  Not found (404):     {len(not_found)}")
        print(f"  Errors:              {len(errors)}")
    elif sitemap_only:
        print("\n  Skipping HTTP checks (--sitemap-only)")
        not_found = not_in_sitemap  # treat all as "missing" when no HTTP check

    # Console summary
    print(f"\n{'=' * 60}")
    print(f"Validation Results")
    print(f"{'=' * 60}")
    print(f"  Sitemap URLs:          {len(sitemap_paths)}")
    print(f"  Report cur_full_urls:  {total} (unique)")
    print(f"  In sitemap:            {n_found} ({pct:.1f}%)")
    if not sitemap_only:
        print(f"  Accessible (not indexed): {len(accessible)}")
        print(f"  Redirected:            {len(redirected)}")
        print(f"  NOT FOUND (404):       {len(not_found)}")
        if errors:
            print(f"  Errors:                {len(errors)}")
    else:
        print(f"  NOT in sitemap:        {len(not_in_sitemap)}")
    print(f"{'=' * 60}")

    # Write markdown report
    with open(OUTPUT_FILE, "w", encoding="utf-8") as f:
        f.write("# URL Validation Report\n\n")
        f.write(f"Validated `cur_full_url` from `slug-final-report.csv` against the live site.\n\n")
        f.write(f"**Sitemap:** `{SITEMAP_URL}`\n\n")

        f.write("## Summary\n\n")
        f.write("| Metric | Count |\n")
        f.write("|--------|-------|\n")
        f.write(f"| Sitemap URLs | {len(sitemap_paths)} |\n")
        f.write(f"| Unique `cur_full_url` in report | {total} |\n")
        f.write(f"| **In sitemap** | **{n_found}** ({pct:.1f}%) |\n")
        if not sitemap_only:
            f.write(f"| **Accessible (not indexed)** | **{len(accessible)}** |\n")
            f.write(f"| **Redirected** | **{len(redirected)}** |\n")
            f.write(f"| **Not found (404)** | **{len(not_found)}** |\n")
            if errors:
                f.write(f"| Errors | {len(errors)} |\n")
            verified_total = n_found + len(accessible)
            verified_pct = (verified_total / total * 100) if total else 0
            f.write(f"| **Total verified** | **{verified_total}** ({verified_pct:.1f}%) |\n")
        else:
            f.write(f"| **Not in sitemap** | **{len(not_in_sitemap)}** |\n")
        f.write("\n")

        # Not found section — these are genuine pipeline bugs
        if not_found and not sitemap_only:
            f.write("## Not Found (404) — Pipeline bugs\n\n")
            f.write("These URLs return 404 — the computed `cur_full_url` does not match the live site.\n\n")

            nf_by_product = {}
            for r in not_found:
                prod = r.get("cur_product_slug", "") or "(empty)"
                nf_by_product.setdefault(prod, []).append(r)

            for prod in sorted(nf_by_product, key=lambda p: -len(nf_by_product[p])):
                items = nf_by_product[prod]
                f.write(f"### {prod} ({len(items)})\n\n")
                f.write("| cur_full_url | Status | Category | Page slug | Fern file |\n")
                f.write("|-------------|--------|----------|-----------|----------|\n")
                for r in items:
                    f.write(
                        f"| `{r['cur_full_url']}` "
                        f"| {r.get('http_status', '')} "
                        f"| {r['category']} "
                        f"| `{r.get('cur_page_slug', '')}` "
                        f"| `{r['fern_file']}` |\n"
                    )
                f.write("\n")

        # Redirected section
        if redirected and not sitemap_only:
            f.write("## Redirected URLs\n\n")
            f.write("These URLs redirect — the page exists but at a different URL.\n\n")
            f.write("| cur_full_url | Status | Redirects to | Category | Fern file |\n")
            f.write("|-------------|--------|--------------|----------|----------|\n")
            for r in redirected:
                f.write(
                    f"| `{r['cur_full_url']}` "
                    f"| {r.get('http_status', '')} "
                    f"| `{r.get('http_final_path', '')}` "
                    f"| {r['category']} "
                    f"| `{r['fern_file']}` |\n"
                )
            f.write("\n")

        # Accessible but not indexed
        if accessible and not sitemap_only:
            f.write("## Accessible but not in sitemap\n\n")
            f.write("These pages respond with 200 OK but are not in the sitemap XML.\n"
                    "This is expected for section index pages and some navigation-only pages.\n\n")

            acc_by_product = {}
            for r in accessible:
                prod = r.get("cur_product_slug", "") or "(empty)"
                acc_by_product.setdefault(prod, []).append(r)

            for prod in sorted(acc_by_product, key=lambda p: -len(acc_by_product[p])):
                items = acc_by_product[prod]
                f.write(f"### {prod} ({len(items)})\n\n")
                f.write("| cur_full_url | Category | Page slug | Fern file |\n")
                f.write("|-------------|----------|-----------|----------|\n")
                for r in items:
                    f.write(
                        f"| `{r['cur_full_url']}` "
                        f"| {r['category']} "
                        f"| `{r.get('cur_page_slug', '')}` "
                        f"| `{r['fern_file']}` |\n"
                    )
                f.write("\n")

        # Sitemap-only mode — show all missing
        if not_in_sitemap and sitemap_only:
            f.write("## Missing URLs (sitemap-only mode)\n\n")
            missing_by_product = {}
            for r in not_in_sitemap:
                prod = r.get("cur_product_slug", "") or "(empty)"
                missing_by_product.setdefault(prod, []).append(r)

            for prod in sorted(missing_by_product, key=lambda p: -len(missing_by_product[p])):
                items = missing_by_product[prod]
                f.write(f"### {prod} ({len(items)})\n\n")
                f.write("| cur_full_url | Category | Tab | Page slug | Fern file |\n")
                f.write("|-------------|----------|-----|-----------|----------|\n")
                for r in items:
                    f.write(
                        f"| `{r['cur_full_url']}` "
                        f"| {r['category']} "
                        f"| {r.get('cur_tab_slug', '')} "
                        f"| `{r.get('cur_page_slug', '')}` "
                        f"| `{r['fern_file']}` |\n"
                    )
                f.write("\n")

        # Verified URLs
        f.write("## Verified URLs\n\n")
        if not sitemap_only:
            verified = n_found + len(accessible)
            f.write(f"{verified} URLs verified ({n_found} in sitemap + {len(accessible)} accessible via HTTP).\n")
        else:
            f.write(f"{n_found} unique `cur_full_url` values were found in the sitemap.\n")

        if in_sitemap:
            f.write(f"\nSample (first 15):\n\n")
            for r in in_sitemap[:15]:
                f.write(f"- `{r['cur_full_url']}`\n")
            if n_found > 15:
                f.write(f"- ... and {n_found - 15} more\n")

    print(f"\nReport written to: {OUTPUT_FILE}")


if __name__ == "__main__":
    main()
