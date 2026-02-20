#!/usr/bin/env python3
"""Fetch the old Docusaurus site's sitemap and extract all doc slugs.

Fetches https://developer.signalwire.com/sitemap.xml, parses XML,
strips the domain to get path slugs, and saves to old-sitemap-slugs.json.
"""

import json
import sys
from pathlib import Path

from utils import fetch_sitemap_paths

SITEMAP_URL = "https://developer.signalwire.com/sitemap.xml"
SCRIPT_DIR = Path(__file__).resolve().parent
REPORTS_DIR = SCRIPT_DIR / "reports"
OUTPUT_FILE = str(REPORTS_DIR / "old-sitemap-slugs.json")

# Sections to exclude from reconciliation (non-doc pages)
EXCLUDE_PREFIXES = [
    "/blog",
    "/tags",
    "/search",
]


def main():
    output_file = sys.argv[1] if len(sys.argv) > 1 else OUTPUT_FILE

    print(f"Fetching sitemap from {SITEMAP_URL}...")
    all_paths = fetch_sitemap_paths(SITEMAP_URL, exclude_prefixes=EXCLUDE_PREFIXES)
    # Also exclude the bare root "/"
    all_paths.discard("/")

    print(f"  Found {len(all_paths)} doc slugs (after exclusions)")

    # Sort for deterministic output
    slugs = sorted(all_paths)

    with open(output_file, "w") as f:
        json.dump(slugs, f, indent=2)

    # Group slugs by top-level prefix
    by_prefix = {}
    for s in slugs:
        parts = s.strip("/").split("/")
        prefix = "/" + parts[0] if parts and parts[0] else "/"
        by_prefix.setdefault(prefix, []).append(s)

    # Write report
    report_file = output_file.replace(".json", "-report.md")
    with open(report_file, "w") as f:
        f.write("# Old Sitemap Fetch Report\n\n")
        f.write(f"Source: {SITEMAP_URL}\n\n")
        f.write("## Summary\n\n")
        f.write(f"| Metric | Count |\n")
        f.write(f"|--------|-------|\n")
        f.write(f"| **Unique doc slugs** | **{len(slugs)}** |\n\n")
        f.write("## Slugs by section\n\n")
        for prefix in sorted(by_prefix, key=lambda p: -len(by_prefix[p])):
            f.write(f"- `{prefix}` -- {len(by_prefix[prefix])} pages\n")
        f.write(f"\n## Output\n\n")
        f.write(f"- `{output_file}` -- JSON array of {len(slugs)} slug strings\n")

    print(f"\nResults saved to {output_file}")
    print(f"Report saved to {report_file}")
    print(f"  Unique doc slugs:   {len(slugs)}")

    # Show sample
    print("\nSample slugs:")
    for s in slugs[:10]:
        print(f"  {s}")
    if len(slugs) > 10:
        print(f"  ... and {len(slugs) - 10} more")


if __name__ == "__main__":
    main()
