#!/usr/bin/env python3
"""Build a unified redirect report from reconciliation + matching results.

Merges slug-reconciliation.csv (matched pages) and slug-matches.csv
(classified unmatched pages) into a single actionable report with full
old->new URL mapping and recommended action per URL.

CSV output includes decomposed URL columns:
  product_slug, version_slug, tab_slug, page_slug, full_url
for both current and proposed states.

This is the final step in the slug reconciliation pipeline.
"""

import csv
import sys
from pathlib import Path

from utils import (
    build_product_slug_map,
    decompose_url,
    normalize_path,
    slug_from_filepath,
)

SCRIPT_DIR = Path(__file__).resolve().parent
REPORTS_DIR = SCRIPT_DIR / "reports"


def product_from_fern_path(fern_file):
    """Extract product name from a Fern file path like 'compatibility-api/pages/...'."""
    if not fern_file:
        return ""
    parts = normalize_path(fern_file).split("/")
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


def _decompose(product, page_slug, fern_file):
    """Decompose a URL into its parts. Returns a DecomposedUrl or empty one."""
    if not product and not page_slug:
        return decompose_url("", "", "")
    return decompose_url(product, page_slug, fern_file)


def _empty_decomposed_fields(prefix):
    """Return dict with empty decomposed fields for a given prefix (cur_ or prop_)."""
    return {
        f"{prefix}product_slug": "",
        f"{prefix}version_slug": "",
        f"{prefix}tab_slug": "",
        f"{prefix}page_slug": "",
        f"{prefix}full_url": "",
    }


def _decomposed_fields(prefix, d):
    """Return dict with decomposed fields from a DecomposedUrl."""
    return {
        f"{prefix}product_slug": d.product_slug,
        f"{prefix}version_slug": d.version_slug,
        f"{prefix}tab_slug": d.tab_slug,
        f"{prefix}page_slug": d.page_slug,
        f"{prefix}full_url": d.full_url,
    }


def main():
    reconciliation_csv = sys.argv[1] if len(sys.argv) > 1 else str(REPORTS_DIR / "slug-reconciliation.csv")
    matches_csv = sys.argv[2] if len(sys.argv) > 2 else str(REPORTS_DIR / "slug-matches.csv")
    output_csv = sys.argv[3] if len(sys.argv) > 3 else str(REPORTS_DIR / "slug-final-report.csv")

    proposals_csv = str(REPORTS_DIR / "slug-proposals.csv")

    # Parse product slug mapping
    product_slugs = build_product_slug_map()
    print(f"Product slug mapping: {len(product_slugs)} products")
    for d, s in sorted(product_slugs.items()):
        print(f"  {d} -> /{s}")

    # Build file_path -> id lookup from proposals
    id_by_file = {}
    with open(proposals_csv, newline="") as f:
        for r in csv.DictReader(f):
            fp = normalize_path(r.get("file_path", ""))
            doc_id = r.get("id", "")
            if fp and doc_id:
                id_by_file[fp] = doc_id

    rows = []

    # -- Process reconciliation CSV (matched pages) --
    matched_urls = set()
    with open(reconciliation_csv, newline="") as f:
        for r in csv.DictReader(f):
            if r["status"] != "matched":
                continue

            old_url = r["old_url"]
            matched_urls.add(old_url)
            product = r["matched_product"]
            fern_file = normalize_path(r.get("matched_file_path", ""))
            current_slug = r["matched_slug"] or slug_from_filepath(fern_file)
            proposed_slug = r.get("matched_new_slug", "")

            cur = _decompose(product, current_slug, fern_file)
            prop = _decompose(product, proposed_slug, fern_file) if proposed_slug else cur

            # Compare old URL against the final destination
            final_url = prop.full_url
            if old_url.rstrip("/").lower() == final_url.rstrip("/").lower():
                category = "matched_same"
            else:
                category = "matched_changed"

            row = {
                "old_url": old_url,
                "action": classify_action(category),
                "category": category,
                "confidence": "1.000",
                "doc_id": id_by_file.get(fern_file, ""),
                "fern_file": fern_file,
                **_decomposed_fields("cur_", cur),
                **_decomposed_fields("prop_", prop),
                "notes": "",
            }
            rows.append(row)

    print(f"Loaded {len(rows)} matched pages from reconciliation")

    # -- Process matches CSV (classified unmatched pages) --
    match_count = 0
    with open(matches_csv, newline="") as f:
        for r in csv.DictReader(f):
            old_url = r["old_url"]
            if old_url in matched_urls:
                continue

            match_type = r["match_type"]
            fern_file = normalize_path(r.get("matched_fern_file", ""))
            confidence = r.get("confidence", "")
            notes = r.get("notes", "")
            match_method = r.get("match_method", "")

            cur_fields = _empty_decomposed_fields("cur_")
            prop_fields = _empty_decomposed_fields("prop_")

            if match_type in ("slug_changed", "uncertain"):
                product = product_from_fern_path(fern_file)
                current_slug = r.get("matched_slug", "") or slug_from_filepath(fern_file)
                proposed_slug = r.get("new_slug", "")

                if current_slug:
                    cur = _decompose(product, current_slug, fern_file)
                    cur_fields = _decomposed_fields("cur_", cur)
                if proposed_slug:
                    prop = _decompose(product, proposed_slug, fern_file)
                    prop_fields = _decomposed_fields("prop_", prop)
                elif current_slug:
                    prop_fields = dict(cur_fields)
                    # Rename cur_ keys to prop_
                    prop_fields = {k.replace("cur_", "prop_"): v for k, v in cur_fields.items()}

                if match_method:
                    notes = match_method + (f"; {notes}" if notes else "")

            row = {
                "old_url": old_url,
                "action": classify_action(match_type),
                "category": match_type,
                "confidence": confidence,
                "doc_id": id_by_file.get(fern_file, ""),
                "fern_file": fern_file,
                **cur_fields,
                **prop_fields,
                "notes": notes,
            }
            rows.append(row)
            match_count += 1

    print(f"Loaded {match_count} classified pages from matches")

    # Sort by action priority, then old_url
    action_order = {"redirect": 0, "review": 1, "gone": 2, "no_action": 3}
    rows.sort(key=lambda r: (action_order.get(r["action"], 9), r["old_url"]))

    # -- Write CSV --
    fields = [
        "old_url", "action", "category", "confidence", "doc_id", "fern_file",
        "cur_product_slug", "cur_version_slug", "cur_tab_slug", "cur_page_slug", "cur_full_url",
        "prop_product_slug", "prop_version_slug", "prop_tab_slug", "prop_page_slug", "prop_full_url",
        "notes",
    ]
    with open(output_csv, "w", newline="") as f:
        w = csv.DictWriter(f, fieldnames=fields)
        w.writeheader()
        w.writerows(rows)

    # -- Stats --
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

    # -- Write markdown report --
    report_file = output_csv.replace(".csv", ".md")
    with open(report_file, "w", encoding="utf-8") as f:
        f.write("# Slug Redirect Report\n\n")
        f.write("Unified report merging reconciliation and content-matching results.\n\n")

        f.write("## Summary\n\n")
        f.write("**Column definitions:**\n")
        f.write("- **Old URL** -- Docusaurus URL from the old sitemap\n")
        f.write("- **Current full URL** -- live Fern URL based on current frontmatter slug\n")
        f.write("- **Proposed full URL** -- Fern URL after slug standardization is applied\n")
        f.write("- **Decomposed columns** (CSV only): product_slug, version_slug, tab_slug, page_slug, full_url\n\n")
        f.write("| Action | Count | Description |\n")
        f.write("|--------|-------|-------------|\n")
        f.write(f"| **redirect** | {by_action.get('redirect', 0)} | Old URL -> proposed Fern URL (needs 301 redirect) |\n")
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
            f.write("These old URLs need 301 redirects to their proposed locations.\n\n")
            f.write("| Old URL | Current full URL | Proposed full URL | Category | Confidence |\n")
            f.write("|---------|------------------|-------------------|----------|------------|\n")
            for r in redirects:
                conf = r["confidence"] if r["confidence"] else "--"
                cur = r["cur_full_url"] if r["cur_full_url"] else "--"
                prop = r["prop_full_url"] if r["prop_full_url"] else "--"
                f.write(f"| `{r['old_url']}` | `{cur}` | `{prop}` | {r['category']} | {conf} |\n")

        # Review section
        if reviews:
            f.write(f"\n## Needs review ({len(reviews)})\n\n")
            f.write("Possible matches with low confidence. Verify manually before redirecting.\n\n")
            f.write("| Old URL | Current full URL | Proposed full URL | Confidence | Notes |\n")
            f.write("|---------|------------------|-------------------|------------|-------|\n")
            for r in reviews:
                conf = r["confidence"] if r["confidence"] else "--"
                cur = r["cur_full_url"] if r["cur_full_url"] else "--"
                prop = r["prop_full_url"] if r["prop_full_url"] else "--"
                notes = r["notes"][:60] if r["notes"] else "--"
                f.write(f"| `{r['old_url']}` | `{cur}` | `{prop}` | {conf} | {notes} |\n")

        # Gone section
        if gone:
            f.write(f"\n## Gone ({len(gone)})\n\n")
            f.write("Content removed, auto-generated, or not migrated. Return 410 or let 404.\n\n")

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
                f.write(f"- `{r['old_url']}` -> `{r['prop_full_url']}`\n")
            if len(no_action) > 30:
                f.write(f"- ... and {len(no_action) - 30} more\n")

        f.write(f"\n## Output files\n\n")
        f.write(f"- `{output_csv}` -- full report ({len(rows)} rows)\n")
        f.write(f"- `{report_file}` -- this report\n")

    print(f"  Report written to: {report_file}")


if __name__ == "__main__":
    main()
