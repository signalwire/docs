#!/usr/bin/env python3
"""Fix Devon's SWML 'n' rows by probing the live Fern site.

For each row:
  1. Try cur_full_url on the Fern site
  2. If 404, try replacing hyphens with underscores in various combinations
  3. Update cur_full_url + cur_page_slug + prop columns with the working URL
  4. Mark valid_match = 'y' if a working URL is found

Only touches: assign=Devon, cur_product_slug=swml, valid_match=n
"""

import csv
import itertools
import time
import urllib.request
import urllib.error
from pathlib import Path

REPORT = Path(__file__).resolve().parent / "slug-final-report.csv"
FERN_DOMAIN = "https://signalwire.docs.buildwithfern.com"

# Rate-limit: seconds between requests
DELAY = 0.3


def probe(url):
    """Return True if the URL returns 200."""
    try:
        req = urllib.request.Request(url, method="HEAD")
        req.add_header("User-Agent", "slug-audit/1.0")
        resp = urllib.request.urlopen(req, timeout=10)
        return resp.status == 200
    except urllib.error.HTTPError:
        return False
    except Exception as e:
        print(f"    [warn] {e}")
        return False


def hyphen_to_underscore_variants(path):
    """Generate candidate URLs by replacing hyphens with underscores.

    Strategy: split path into segments, for each segment that contains a
    hyphen, try the underscore version. Yield all 2^n combinations, fewest
    changes first.
    """
    parts = path.strip("/").split("/")
    # Find segments that have hyphens (candidates for underscore swap)
    hyphen_indices = [i for i, p in enumerate(parts) if "-" in p]

    if not hyphen_indices:
        return

    # Try from 1 replacement up to all replacements, fewest changes first
    for count in range(1, len(hyphen_indices) + 1):
        for combo in itertools.combinations(hyphen_indices, count):
            candidate = list(parts)
            for idx in combo:
                candidate[idx] = candidate[idx].replace("-", "_")
            yield "/" + "/".join(candidate)


def find_working_url(cur_full_url):
    """Try the current URL, then underscore variants. Return working path or None."""
    # Try as-is first
    full = FERN_DOMAIN + cur_full_url
    if probe(full):
        time.sleep(DELAY)
        return cur_full_url

    time.sleep(DELAY)

    # Try underscore variants
    for variant in hyphen_to_underscore_variants(cur_full_url):
        full = FERN_DOMAIN + variant
        if probe(full):
            time.sleep(DELAY)
            return variant
        time.sleep(DELAY)

    return None


def extract_page_slug(full_url, product_slug):
    """Extract page_slug from full_url by stripping the product prefix."""
    prefix = f"/{product_slug}"
    if full_url.startswith(prefix):
        remainder = full_url[len(prefix):]
        return remainder if remainder else "/"
    return full_url


def main():
    # Load CSV
    with open(REPORT, newline="", encoding="utf-8") as f:
        reader = csv.DictReader(f)
        fieldnames = list(reader.fieldnames)
        rows = list(reader)

    # Find qualifying rows
    targets = []
    for i, row in enumerate(rows):
        if (row.get("assign", "").strip() == "Devon"
                and row.get("cur_product_slug", "").strip() == "swml"
                and row.get("valid_match", "").strip() == "n"):
            targets.append((i, row))

    print(f"Found {len(targets)} Devon/SWML/n rows to check.\n")

    fixed = 0
    failed = 0
    already_ok = 0

    for seq, (idx, row) in enumerate(targets, 1):
        old_url = row["old_url"]
        cur_url = row.get("cur_full_url", "")

        print(f"[{seq}/{len(targets)}] {old_url}")
        print(f"  cur: {cur_url}")

        result = find_working_url(cur_url)

        if result and result == cur_url:
            print(f"  [OK] Already works as-is")
            rows[idx]["valid_match"] = "y"
            already_ok += 1
            fixed += 1
        elif result:
            print(f"  [FIXED] {result}")
            # Update current columns
            rows[idx]["cur_full_url"] = result
            rows[idx]["cur_page_slug"] = extract_page_slug(result, "swml")
            # Update proposed columns to match (preserve underscores)
            rows[idx]["prop_full_url"] = result
            rows[idx]["prop_page_slug"] = extract_page_slug(result, "swml")
            rows[idx]["valid_match"] = "y"
            fixed += 1
        else:
            print(f"  [MISS] No working URL found")
            failed += 1

    # Save
    with open(REPORT, "w", newline="", encoding="utf-8") as f:
        writer = csv.DictWriter(f, fieldnames=fieldnames, restval="")
        writer.writeheader()
        writer.writerows(rows)

    print(f"\n{'=' * 50}")
    print(f"Done. {fixed} fixed ({already_ok} already OK), {failed} failed.")
    print(f"{'=' * 50}")


if __name__ == "__main__":
    main()
