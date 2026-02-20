#!/usr/bin/env python3
"""Build a unified redirect report from reconciliation + matching results.

Merges slug-reconciliation.csv (matched pages) and slug-matches.csv
(classified unmatched pages) into a single actionable report with full
old→new URL mapping and recommended action per URL.

This is the final step in the slug reconciliation pipeline.
"""

import csv
import re
import sys
from pathlib import Path

SCRIPT_DIR = Path(__file__).resolve().parent
PROJECT_ROOT = SCRIPT_DIR.parent.parent
REPORTS_DIR = SCRIPT_DIR / "reports"
DOCS_YML = PROJECT_ROOT / "fern" / "docs.yml"

# Fern product directory name → product URL slug (parsed from docs.yml at runtime)
_product_slug_cache = None


def parse_product_slugs():
    """Parse docs.yml to build product directory → URL base slug mapping.

    Extracts lines like:
      path: products/<dir>/...
      slug: <slug>
    and maps directory name to slug.
    """
    global _product_slug_cache
    if _product_slug_cache is not None:
        return _product_slug_cache

    mapping = {}
    current_slug = None

    for line in DOCS_YML.read_text(encoding="utf-8").splitlines():
        slug_m = re.match(r"^\s+slug:\s+(.+)", line)
        if slug_m:
            current_slug = slug_m.group(1).strip()

        path_m = re.match(r"^\s+path:\s+products/([^/.]+)", line)
        if path_m and current_slug is not None:
            dirname = path_m.group(1)
            if dirname not in mapping:
                mapping[dirname] = current_slug

    # Normalize: strip leading slashes, handle root
    normalized = {}
    for dirname, slug in mapping.items():
        slug = slug.strip("/")
        normalized[dirname] = slug

    _product_slug_cache = normalized
    return normalized


_VERSION_RE = re.compile(r"/pages/(v\d+|latest)/")


def _extract_version(fern_file):
    """Extract version from a Fern file path like 'realtime-sdk/pages/v2/...'.

    Returns the version string (e.g., "v2") or None for latest/unversioned.
    """
    if not fern_file:
        return None
    path = fern_file.replace("\\", "/")
    m = _VERSION_RE.search(path)
    if m and m.group(1) != "latest":
        return m.group(1)
    return None


def build_new_url(product, page_slug, fern_file=""):
    """Reconstruct the full new Fern URL from product + page slug + file path.

    Fern prepends the product slug to every page URL automatically.
    For versioned products (realtime-sdk, browser-sdk), Fern also inserts
    the version segment (e.g., /v2/) between product and page slug for
    non-latest versions.

    E.g., product "compatibility-api" + slug "sdks/methods/calls/delete"
    -> "/compatibility-api/sdks/methods/calls/delete"

    E.g., product "realtime-sdk" + slug "/guides" + file "realtime-sdk/pages/v2/..."
    -> "/realtime-sdk/v2/guides"
    """
    product_slugs = parse_product_slugs()
    base = product_slugs.get(product, product)
    version = _extract_version(fern_file)

    if not page_slug or page_slug == "/":
        if version:
            return f"/{base}/{version}" if base else f"/{version}"
        return f"/{base}" if base else "/"

    page_slug = page_slug.lstrip("/")

    # Avoid double-prefixing if page_slug already starts with the product slug
    if base and page_slug.lower().startswith(base.lower() + "/"):
        page_slug = page_slug[len(base) + 1:]

    # Build: /<product>[/<version>]/<page_slug>
    parts = []
    if base:
        parts.append(base)
    if version:
        parts.append(version)
    parts.append(page_slug)
    return "/" + "/".join(parts)


def product_from_fern_path(fern_file):
    """Extract product name from a Fern file path like 'compatibility-api/pages/...'."""
    if not fern_file:
        return ""
    parts = fern_file.replace("\\", "/").split("/")
    return parts[0] if parts else ""


def classify_action(category):
    """Map match category to recommended action."""
    if category in ("matched_same", "already_mapped"):
        return "no_action"
    if category in ("matched_changed", "slug_changed"):
        return "redirect"
    if category == "uncertain":
        return "review"
    if category in ("known_deleted", "likely_deleted"):
        return "gone"
    if category == "autogen":
        return "gone"
    if category == "no_source":
        return "gone"
    return "review"


def main():
    reconciliation_csv = sys.argv[1] if len(sys.argv) > 1 else str(REPORTS_DIR / "slug-reconciliation.csv")
    matches_csv = sys.argv[2] if len(sys.argv) > 2 else str(REPORTS_DIR / "slug-matches.csv")
    output_csv = sys.argv[3] if len(sys.argv) > 3 else str(REPORTS_DIR / "slug-final-report.csv")

    # Parse product slug mapping
    product_slugs = parse_product_slugs()
    print(f"Product slug mapping: {len(product_slugs)} products")
    for d, s in sorted(product_slugs.items()):
        print(f"  {d} -> /{s}")

    rows = []

    # ── Process reconciliation CSV (matched + unmatched) ──
    matched_urls = set()
    with open(reconciliation_csv, newline="") as f:
        for r in csv.DictReader(f):
            if r["status"] != "matched":
                continue  # unmatched rows are handled via slug-matches.csv

            old_url = r["old_url"]
            matched_urls.add(old_url)
            product = r["matched_product"]
            page_slug = r.get("matched_new_slug") or r["matched_slug"]
            fern_file = r.get("matched_file_path", "")
            new_url = build_new_url(product, page_slug, fern_file)

            if old_url.rstrip("/").lower() == new_url.rstrip("/").lower():
                category = "matched_same"
            else:
                category = "matched_changed"

            rows.append({
                "old_url": old_url,
                "new_url": new_url,
                "action": classify_action(category),
                "category": category,
                "confidence": "1.000",
                "fern_file": fern_file,
                "notes": "",
            })

    print(f"Loaded {len(rows)} matched pages from reconciliation")

    # ── Process matches CSV (classified unmatched pages) ──
    match_count = 0
    with open(matches_csv, newline="") as f:
        for r in csv.DictReader(f):
            old_url = r["old_url"]
            if old_url in matched_urls:
                continue  # already handled

            match_type = r["match_type"]
            fern_file = r.get("matched_fern_file", "")
            confidence = r.get("confidence", "")
            notes = r.get("notes", "")
            match_method = r.get("match_method", "")

            if match_type in ("slug_changed", "uncertain"):
                product = product_from_fern_path(fern_file)
                page_slug = r.get("new_slug") or r.get("matched_slug", "")
                new_url = build_new_url(product, page_slug, fern_file)
                if match_method:
                    notes = match_method + (f"; {notes}" if notes else "")
            else:
                new_url = ""

            rows.append({
                "old_url": old_url,
                "new_url": new_url,
                "action": classify_action(match_type),
                "category": match_type,
                "confidence": confidence,
                "fern_file": fern_file,
                "notes": notes,
            })
            match_count += 1

    print(f"Loaded {match_count} classified pages from matches")

    # Sort by action priority, then old_url
    action_order = {"redirect": 0, "review": 1, "gone": 2, "no_action": 3}
    rows.sort(key=lambda r: (action_order.get(r["action"], 9), r["old_url"]))

    # ── Write CSV ──
    fields = ["old_url", "new_url", "action", "category", "confidence", "fern_file", "notes"]
    with open(output_csv, "w", newline="") as f:
        w = csv.DictWriter(f, fieldnames=fields)
        w.writeheader()
        w.writerows(rows)

    # ── Stats ──
    by_action = {}
    by_category = {}
    for r in rows:
        by_action[r["action"]] = by_action.get(r["action"], 0) + 1
        by_category[r["category"]] = by_category.get(r["category"], 0) + 1

    redirects = [r for r in rows if r["action"] == "redirect"]
    reviews = [r for r in rows if r["action"] == "review"]
    gone = [r for r in rows if r["action"] == "gone"]
    no_action = [r for r in rows if r["action"] == "no_action"]

    print(f"\nFinal report -> {output_csv}")
    print(f"  Total URLs:   {len(rows)}")
    print(f"  redirect:     {by_action.get('redirect', 0)}")
    print(f"  review:       {by_action.get('review', 0)}")
    print(f"  gone:         {by_action.get('gone', 0)}")
    print(f"  no_action:    {by_action.get('no_action', 0)}")

    # ── Write markdown report ──
    report_file = output_csv.replace(".csv", ".md")
    with open(report_file, "w", encoding="utf-8") as f:
        f.write("# Slug Redirect Report\n\n")
        f.write("Unified report merging reconciliation and content-matching results.\n\n")

        f.write("## Summary\n\n")
        f.write("| Action | Count | Description |\n")
        f.write("|--------|-------|-------------|\n")
        f.write(f"| **redirect** | {by_action.get('redirect', 0)} | Old URL -> new Fern URL (needs 301 redirect) |\n")
        f.write(f"| **review** | {by_action.get('review', 0)} | Possible match, needs manual verification |\n")
        f.write(f"| **gone** | {by_action.get('gone', 0)} | Content removed or auto-generated (410/404) |\n")
        f.write(f"| **no_action** | {by_action.get('no_action', 0)} | URL unchanged or already covered |\n")
        f.write(f"| **Total** | **{len(rows)}** | |\n\n")

        f.write("### By category\n\n")
        f.write("| Category | Count |\n")
        f.write("|----------|-------|\n")
        for cat in sorted(by_category, key=lambda c: -by_category[c]):
            f.write(f"| {cat} | {by_category[cat]} |\n")
        f.write("\n")

        # Redirects section
        if redirects:
            f.write(f"## Redirects ({len(redirects)})\n\n")
            f.write("These old URLs need 301 redirects to their new locations.\n\n")
            f.write("| Old URL | New URL | Category | Confidence |\n")
            f.write("|---------|---------|----------|------------|\n")
            for r in redirects:
                conf = r["confidence"] if r["confidence"] else "--"
                f.write(f"| `{r['old_url']}` | `{r['new_url']}` | {r['category']} | {conf} |\n")

        # Review section
        if reviews:
            f.write(f"\n## Needs review ({len(reviews)})\n\n")
            f.write("Possible matches with low confidence. Verify manually before redirecting.\n\n")
            f.write("| Old URL | Suggested new URL | Confidence | Notes |\n")
            f.write("|---------|-------------------|------------|-------|\n")
            for r in reviews:
                conf = r["confidence"] if r["confidence"] else "--"
                notes = r["notes"][:60] if r["notes"] else "--"
                f.write(f"| `{r['old_url']}` | `{r['new_url']}` | {conf} | {notes} |\n")

        # Gone section
        if gone:
            f.write(f"\n## Gone ({len(gone)})\n\n")
            f.write("Content removed, auto-generated, or not migrated. Return 410 or let 404.\n\n")

            # Group by category
            gone_by_cat = {}
            for r in gone:
                gone_by_cat.setdefault(r["category"], []).append(r)

            for cat in sorted(gone_by_cat, key=lambda c: -len(gone_by_cat[c])):
                items = gone_by_cat[cat]
                f.write(f"### {cat} ({len(items)})\n\n")
                for r in items[:30]:
                    note = f" -- {r['notes']}" if r["notes"] else ""
                    f.write(f"- `{r['old_url']}`{note}\n")
                if len(items) > 30:
                    f.write(f"- ... and {len(items) - 30} more\n")
                f.write("\n")

        # No action section
        if no_action:
            f.write(f"\n## No action needed ({len(no_action)})\n\n")
            f.write("URLs that haven't changed or are already covered.\n\n")
            for r in no_action[:30]:
                f.write(f"- `{r['old_url']}` → `{r['new_url']}`\n")
            if len(no_action) > 30:
                f.write(f"- ... and {len(no_action) - 30} more\n")

        f.write(f"\n## Output files\n\n")
        f.write(f"- `{output_csv}` -- full report ({len(rows)} rows)\n")
        f.write(f"- `{report_file}` -- this report\n")

    print(f"  Report written to: {report_file}")


if __name__ == "__main__":
    main()
