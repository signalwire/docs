#!/usr/bin/env python3
"""Reconcile old sitemap slugs against slug-proposals.csv.

Compares slugs from the old Docusaurus site (old-sitemap-slugs.json) against
the current Fern page inventory (slug-proposals.csv and frontmatter-export.csv)
to find which old pages are accounted for and which are missing.

Old Docusaurus routing:
  - Main plugin (routeBasePath '/'): docs/main/ → swml, compatibility-api,
    call-flow-builder, home, rest, events, cantina
  - agents-sdk plugin: routeBasePath '/sdks/agents-sdk'
  - browser-sdk plugin: routeBasePath '/sdks/browser-sdk'
  - realtime-sdk plugin: routeBasePath '/sdks/realtime-sdk'

The propose-new-slugs.py script strips redundant product prefixes from slugs
(e.g., /swml/methods/ai → /methods/ai for product 'swml'). This script
reconstructs the original old URLs to match against the sitemap.
"""

import csv
import json
import re
import sys
from collections import defaultdict
from pathlib import Path

SCRIPT_DIR = Path(__file__).resolve().parent
REPORTS_DIR = SCRIPT_DIR / "reports"

# Map Fern product -> old URL prefix to prepend to the CSV slug.
#
# For SDK products, the old routeBasePath was /sdks/<product>.
# For main-plugin products where propose-new-slugs.py stripped the product
# prefix, we need to re-add it.
# For products where the raw frontmatter slug didn't start with /<product>/,
# no stripping happened, so the CSV slug IS the old URL slug.
PRODUCT_TO_OLD_PREFIX = {
    # SDK plugins (routeBasePath = /sdks/<product>)
    "agents-sdk": "/sdks/agents-sdk",
    "browser-sdk": "/sdks/browser-sdk",
    "realtime-sdk": "/sdks/realtime-sdk",
    # Main plugin products where propose script stripped /<product>/ prefix
    "swml": "/swml",
    "call-flow-builder": "/call-flow-builder",
    # Products where slugs don't start with /<product>/ -- no stripping happened
    "platform": "",
    "compatibility-api": "",
    "/": "",       # home
    "home": "",
    "apis": "",
}

# Regex to capture version + remainder from Fern SDK file paths
# e.g. browser-sdk/pages/v2/guides/video/foo.mdx -> version="v2", remainder="guides/video/foo.mdx"
_VERSION_PATH_RE = re.compile(r"^[^/]+/pages/(latest|v\d+)/(.*)")
# For non-versioned products
_PLAIN_PATH_RE = re.compile(r"^[^/]+/pages/(.*)")


def normalize_slug(s):
    """Normalize a slug for comparison: lowercase, strip trailing slash."""
    s = s.strip().lower()
    if not s.startswith("/"):
        s = "/" + s
    if s != "/" and s.endswith("/"):
        s = s.rstrip("/")
    return s


def filepath_to_old_url(product, file_path):
    """Derive old Docusaurus URL from Fern file path.

    For pages without an explicit slug, Docusaurus derived the URL from:
      routeBasePath + [version/] + file-path-relative-to-plugin-docs-dir

    Fern file paths: <product>/pages/[version/]<path>.mdx
    Old docs paths:  docs/<plugin-dir>/<path>.mdx (latest)
                     <plugin>_versioned_docs/version-<v>/<path>.mdx (older)

    For non-latest versions, the version slug is part of the old URL:
      /sdks/realtime-sdk/v2/language/dotnet/calling/call-collect
    """
    # Try versioned path first (captures version separately)
    version = None
    m = _VERSION_PATH_RE.match(file_path)
    if m:
        version = m.group(1)  # "latest", "v2", "v3", etc.
        rel_path = m.group(2)
    else:
        m = _PLAIN_PATH_RE.match(file_path)
        if not m:
            return []
        rel_path = m.group(1)

    # Strip extension
    rel_path = re.sub(r"\.(mdx?|md)$", "", rel_path)
    # index -> parent directory
    if rel_path.endswith("/index"):
        rel_path = rel_path[:-6]
    elif rel_path == "index":
        rel_path = ""

    prefix = PRODUCT_TO_OLD_PREFIX.get(product, "")

    # For non-latest versions, insert version slug after the product prefix
    # e.g. /sdks/realtime-sdk + /v2 + /language/dotnet/calling/call-collect
    version_segment = ""
    if version and version != "latest":
        version_segment = f"/{version}"

    candidates = []

    if rel_path:
        # Full path: prefix + version + file-derived slug
        full = f"{prefix}{version_segment}/{rel_path}" if prefix else f"{version_segment}/{rel_path}"
        candidates.append(normalize_slug(full))

        # Also try without deepest subdirectory grouping
        # (Docusaurus sidebar grouping dirs may differ from Fern's pages/ layout)
        parts = rel_path.split("/")
        if len(parts) >= 2:
            # Try with just first + last segment
            short = f"{parts[0]}/{parts[-1]}"
            full_short = f"{prefix}{version_segment}/{short}" if prefix else f"{version_segment}/{short}"
            candidates.append(normalize_slug(full_short))
    else:
        base = f"{prefix}{version_segment}" if prefix else version_segment
        candidates.append(normalize_slug(base) if base else "/")

    return candidates


def _extract_version(file_path):
    """Extract version from Fern file path, e.g. 'realtime-sdk/pages/v2/...' -> 'v2'."""
    m = _VERSION_PATH_RE.match(file_path)
    if m and m.group(1) != "latest":
        return m.group(1)
    return None


def build_old_url_candidates(product, csv_slug, raw_slug="", file_path=""):
    """Build candidate old URLs for a CSV row.

    Returns a list of possible old URLs (most likely first).
    """
    candidates = []
    prefix = PRODUCT_TO_OLD_PREFIX.get(product, "")
    version = _extract_version(file_path) if file_path else None

    # Primary candidate: prefix + [version/] + csv_slug
    # For non-latest versions, the old URL included the version after the product prefix
    if prefix and csv_slug and csv_slug != "/":
        if version:
            candidates.append(normalize_slug(f"{prefix}/{version}{csv_slug}"))
        candidates.append(normalize_slug(prefix + csv_slug))
    elif csv_slug:
        if version:
            candidates.append(normalize_slug(f"/{version}{csv_slug}"))
        candidates.append(normalize_slug(csv_slug))

    # If raw frontmatter slug differs from processed csv_slug, also try it
    if raw_slug and raw_slug != csv_slug:
        if prefix and raw_slug != "/":
            candidates.append(normalize_slug(prefix + raw_slug))
        if raw_slug != "/":
            candidates.append(normalize_slug(raw_slug))

    # For products in the main plugin, the raw slug might already be the full
    # old URL (routeBasePath is '/'), so also try csv_slug directly
    if prefix and csv_slug and csv_slug != "/":
        candidates.append(normalize_slug(csv_slug))

    # For SDK products, the raw slug might have been used as-is in the old site
    # (unlikely but covers edge cases)
    if product in ("agents-sdk", "browser-sdk", "realtime-sdk") and csv_slug and csv_slug != "/":
        candidates.append(normalize_slug(csv_slug))

    # For root pages
    if csv_slug == "/":
        if prefix:
            candidates.append(normalize_slug(prefix))
        candidates.append("/")

    # For pages with no explicit slug or where slug-based candidates might
    # miss, also derive candidates from the file path
    if file_path:
        fp_candidates = filepath_to_old_url(product, file_path)
        candidates.extend(fp_candidates)

    # Deduplicate while preserving order
    seen = set()
    unique = []
    for c in candidates:
        if c not in seen:
            seen.add(c)
            unique.append(c)
    return unique


def load_raw_slugs(frontmatter_csv):
    """Load raw frontmatter slugs keyed by (product, file_path)."""
    raw = {}
    try:
        with open(frontmatter_csv, newline="") as f:
            for row in csv.DictReader(f):
                key = (row["product"], row["file_path"])
                raw[key] = normalize_slug(row["slug"]) if row["slug"] else ""
    except FileNotFoundError:
        print(f"Warning: {frontmatter_csv} not found, proceeding without raw slugs",
              file=sys.stderr)
    return raw


def main():
    sitemap_file = sys.argv[1] if len(sys.argv) > 1 else str(REPORTS_DIR / "old-sitemap-slugs.json")
    proposals_csv = sys.argv[2] if len(sys.argv) > 2 else str(REPORTS_DIR / "slug-proposals.csv")
    frontmatter_csv = sys.argv[3] if len(sys.argv) > 3 else str(REPORTS_DIR / "frontmatter-export.csv")
    output_csv = sys.argv[4] if len(sys.argv) > 4 else str(REPORTS_DIR / "slug-reconciliation.csv")

    # Load old sitemap slugs
    with open(sitemap_file) as f:
        old_slugs = json.load(f)
    old_slug_set = {normalize_slug(s) for s in old_slugs}
    print(f"Loaded {len(old_slug_set)} old sitemap slugs")

    # Load raw frontmatter slugs for cross-reference
    raw_slugs = load_raw_slugs(frontmatter_csv)

    # Load CSV rows and build lookup: old_url → csv_row
    old_url_to_csv = {}  # old_url → list of matching CSV rows
    csv_rows = []
    with open(proposals_csv, newline="") as f:
        for row in csv.DictReader(f):
            csv_rows.append(row)

            product = row["product"]
            csv_slug = normalize_slug(row["slug"]) if row["slug"] else ""
            raw_key = (product, row["file_path"])
            raw_slug = raw_slugs.get(raw_key, "")

            candidates = build_old_url_candidates(product, csv_slug, raw_slug,
                                                  row["file_path"])
            for c in candidates:
                if c not in old_url_to_csv:
                    old_url_to_csv[c] = []
                old_url_to_csv[c].append(row)

    print(f"Loaded {len(csv_rows)} CSV rows, generated {len(old_url_to_csv)} candidate old URLs")

    # Reconcile: for each old sitemap slug, check if we have a match
    results = []
    matched_count = 0
    unmatched_count = 0

    for old_slug in sorted(old_slug_set):
        if old_slug in old_url_to_csv:
            matches = old_url_to_csv[old_slug]
            # Pick the best match (first one; they're ordered by likelihood)
            best = matches[0]
            results.append({
                "old_url": old_slug,
                "status": "matched",
                "matched_product": best["product"],
                "matched_slug": best["slug"],
                "matched_new_slug": best.get("new_slug", ""),
                "matched_file_path": best["file_path"],
                "matched_title": best.get("title", ""),
            })
            matched_count += 1
        else:
            results.append({
                "old_url": old_slug,
                "status": "unmatched",
                "matched_product": "",
                "matched_slug": "",
                "matched_new_slug": "",
                "matched_file_path": "",
                "matched_title": "",
            })
            unmatched_count += 1

    # Write output
    fields = ["old_url", "status", "matched_product", "matched_slug",
              "matched_new_slug", "matched_file_path", "matched_title"]
    with open(output_csv, "w", newline="") as f:
        w = csv.DictWriter(f, fieldnames=fields)
        w.writeheader()
        w.writerows(results)

    # Also write unmatched slugs to a separate file for Script 3
    unmatched_file = output_csv.replace(".csv", "-unmatched.csv")
    with open(unmatched_file, "w", newline="") as f:
        w = csv.DictWriter(f, fieldnames=fields)
        w.writeheader()
        for r in results:
            if r["status"] == "unmatched":
                w.writerow(r)

    # Show unmatched breakdown by path prefix
    unmatched_by_prefix = defaultdict(int)
    for r in results:
        if r["status"] == "unmatched":
            parts = r["old_url"].strip("/").split("/")
            prefix = "/" + parts[0] if parts and parts[0] else "/"
            unmatched_by_prefix[prefix] += 1

    # Summary to stdout
    print(f"\nReconciliation results -> {output_csv}")
    print(f"  Total old URLs:  {len(old_slug_set)}")
    print(f"  Matched:         {matched_count}")
    print(f"  Unmatched:       {unmatched_count}")
    print(f"  Match rate:      {matched_count/len(old_slug_set)*100:.1f}%")

    if unmatched_by_prefix:
        print(f"\n  Unmatched by prefix:")
        for prefix, count in sorted(unmatched_by_prefix.items(), key=lambda x: -x[1]):
            print(f"    {prefix:30s} {count}")

    print(f"\n  Unmatched slugs written to: {unmatched_file}")

    # Write report
    report_file = output_csv.replace(".csv", "-report.md")
    with open(report_file, "w") as f:
        f.write("# Slug Reconciliation Report\n\n")
        f.write("## Summary\n\n")
        f.write(f"| Metric | Count |\n")
        f.write(f"|--------|-------|\n")
        f.write(f"| Old sitemap URLs | {len(old_slug_set)} |\n")
        f.write(f"| Current Fern pages (CSV) | {len(csv_rows)} |\n")
        f.write(f"| **Matched** | **{matched_count}** |\n")
        f.write(f"| **Unmatched** | **{unmatched_count}** |\n")
        f.write(f"| Match rate | {matched_count/len(old_slug_set)*100:.1f}% |\n\n")

        f.write("## Unmatched by section\n\n")
        f.write("| Prefix | Count |\n")
        f.write("|--------|-------|\n")
        for prefix, count in sorted(unmatched_by_prefix.items(), key=lambda x: -x[1]):
            f.write(f"| `{prefix}` | {count} |\n")

        f.write("\n## Matched samples\n\n")
        matched_results = [r for r in results if r["status"] == "matched"]
        for r in matched_results[:20]:
            slug_change = ""
            if r["matched_new_slug"] and r["matched_new_slug"] != r["matched_slug"]:
                slug_change = f" -> `{r['matched_new_slug']}`"
            f.write(f"- `{r['old_url']}` -> [{r['matched_product']}] "
                    f"`{r['matched_slug']}`{slug_change}\n")
        if len(matched_results) > 20:
            f.write(f"- ... and {len(matched_results) - 20} more\n")

        f.write(f"\n## Unmatched samples\n\n")
        unmatched_results = [r for r in results if r["status"] == "unmatched"]
        for r in unmatched_results[:30]:
            f.write(f"- `{r['old_url']}`\n")
        if len(unmatched_results) > 30:
            f.write(f"- ... and {len(unmatched_results) - 30} more\n")

        f.write(f"\n## Output files\n\n")
        f.write(f"- `{output_csv}` -- full reconciliation ({len(results)} rows)\n")
        f.write(f"- `{unmatched_file}` -- unmatched only ({unmatched_count} rows)\n")

    print(f"  Report written to: {report_file}")


if __name__ == "__main__":
    main()
