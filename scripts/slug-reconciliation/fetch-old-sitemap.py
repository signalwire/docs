#!/usr/bin/env python3
"""Fetch the old Docusaurus site's sitemap and extract all doc slugs.

Fetches https://developer.signalwire.com/sitemap.xml, parses XML,
strips the domain to get path slugs, and saves to old-sitemap-slugs.json.
"""

import json
import sys
import xml.etree.ElementTree as ET
from pathlib import Path
from urllib.parse import urlparse
from urllib.request import urlopen, Request

SITEMAP_URL = "https://developer.signalwire.com/sitemap.xml"
SITE_HOST = "developer.signalwire.com"
SCRIPT_DIR = Path(__file__).resolve().parent
REPORTS_DIR = SCRIPT_DIR / "reports"
OUTPUT_FILE = str(REPORTS_DIR / "old-sitemap-slugs.json")

# Sections to exclude from reconciliation (non-doc pages)
EXCLUDE_PREFIXES = [
    "/blog",
    "/tags",
    "/search",
]


def fetch_sitemap(url):
    """Fetch sitemap XML, handling both regular sitemaps and sitemap indexes."""
    req = Request(url, headers={"User-Agent": "Mozilla/5.0 (slug-reconciliation)"})
    with urlopen(req, timeout=30) as resp:
        return resp.read()


def parse_sitemap(xml_bytes):
    """Parse sitemap XML and return all <loc> URLs.

    Handles both sitemap indexes (<sitemapindex>) and regular sitemaps (<urlset>).
    """
    root = ET.fromstring(xml_bytes)
    # Strip namespace for easier querying
    ns = ""
    if root.tag.startswith("{"):
        ns = root.tag.split("}")[0] + "}"

    urls = []

    # Check if this is a sitemap index
    sitemap_locs = root.findall(f".//{ns}sitemap/{ns}loc")
    if sitemap_locs:
        # It's a sitemap index — fetch each child sitemap
        print(f"Found sitemap index with {len(sitemap_locs)} child sitemaps")
        for loc_elem in sitemap_locs:
            if loc_elem.text is None:
                continue
            child_url = loc_elem.text.strip()
            print(f"  Fetching {child_url}...")
            try:
                child_xml = fetch_sitemap(child_url)
                child_urls = parse_sitemap(child_xml)
                urls.extend(child_urls)
            except Exception as e:
                print(f"  Warning: failed to fetch {child_url}: {e}", file=sys.stderr)
    else:
        # Regular sitemap
        for loc_elem in root.findall(f".//{ns}url/{ns}loc"):
            if loc_elem.text is not None:
                urls.append(loc_elem.text.strip())

    return urls


def url_to_slug(url):
    """Convert a full URL to a path slug."""
    parsed = urlparse(url)
    path = parsed.path.rstrip("/")
    return path if path else "/"


def should_exclude(slug):
    """Check if a slug should be excluded based on prefix rules."""
    if slug == "/":
        return True
    for prefix in EXCLUDE_PREFIXES:
        if slug == prefix or slug.startswith(prefix + "/"):
            return True
    return False


def main():
    output_file = sys.argv[1] if len(sys.argv) > 1 else OUTPUT_FILE

    print(f"Fetching sitemap from {SITEMAP_URL}...")
    xml_bytes = fetch_sitemap(SITEMAP_URL)

    print("Parsing sitemap...")
    all_urls = parse_sitemap(xml_bytes)
    print(f"  Found {len(all_urls)} total URLs")

    # Filter to same-domain URLs and convert to slugs
    slugs = []
    excluded = 0
    off_domain = 0
    for url in all_urls:
        parsed = urlparse(url)
        if parsed.hostname != SITE_HOST:
            off_domain += 1
            continue

        slug = url_to_slug(url)
        if should_exclude(slug):
            excluded += 1
            continue

        slugs.append(slug)

    # Deduplicate and sort
    slugs = sorted(set(slugs))

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
        f.write(f"| Total URLs parsed | {len(all_urls)} |\n")
        f.write(f"| Off-domain | {off_domain} |\n")
        f.write(f"| Excluded (filters) | {excluded} |\n")
        f.write(f"| **Unique doc slugs** | **{len(slugs)}** |\n\n")
        f.write("## Slugs by section\n\n")
        for prefix in sorted(by_prefix, key=lambda p: -len(by_prefix[p])):
            f.write(f"- `{prefix}` -- {len(by_prefix[prefix])} pages\n")
        f.write(f"\n## Output\n\n")
        f.write(f"- `{output_file}` -- JSON array of {len(slugs)} slug strings\n")

    print(f"\nResults saved to {output_file}")
    print(f"Report saved to {report_file}")
    print(f"  Total URLs parsed:  {len(all_urls)}")
    print(f"  Off-domain:         {off_domain}")
    print(f"  Excluded (filters): {excluded}")
    print(f"  Unique doc slugs:   {len(slugs)}")

    # Show sample
    print("\nSample slugs:")
    for s in slugs[:10]:
        print(f"  {s}")
    if len(slugs) > 10:
        print(f"  ... and {len(slugs) - 10} more")


if __name__ == "__main__":
    main()
