#!/usr/bin/env python3
"""Apply known deletions to the final slug report.

Cross-references new_known_deleted.csv against slug-final-report.csv to:
1. Upgrade slug-matched likely_deleted/no_source rows to known_deleted
2. Annotate doc_id-matched rows (relocations) with a note
3. Add remaining entries as NEW rows (redirect if moved_to, gone if not)

Usage:
    python apply-known-deletions.py
"""

import csv
from pathlib import Path

from utils import (
    decompose_url,
    normalize_path,
    slug_from_filepath,
    clean_slug,
)

SCRIPT_DIR = Path(__file__).resolve().parent
REPORTS_DIR = SCRIPT_DIR / "reports"
DELETIONS_DIR = SCRIPT_DIR / "deletions"

FINAL_REPORT = REPORTS_DIR / "slug-final-report.csv"
KNOWN_DELETED = DELETIONS_DIR / "new_known_deleted.csv"

FINAL_FIELDS = [
    "old_url", "action", "category", "confidence", "doc_id", "fern_file",
    "cur_product_slug", "cur_version_slug", "cur_tab_slug", "cur_page_slug", "cur_full_url",
    "prop_product_slug", "prop_version_slug", "prop_tab_slug", "prop_page_slug", "prop_full_url",
    "notes",
]


def load_final_report():
    """Load final report rows as list of dicts."""
    rows = []
    with open(FINAL_REPORT, newline="", encoding="utf-8") as f:
        for r in csv.DictReader(f):
            rows.append(r)
    return rows


def load_known_deleted():
    """Load known_deleted entries as list of dicts."""
    rows = []
    with open(KNOWN_DELETED, newline="", encoding="utf-8") as f:
        for r in csv.DictReader(f):
            rows.append(r)
    return rows


def build_lookups(final_rows):
    """Build lookup indices from the final report.

    Returns:
        by_doc_id: doc_id -> list of row indices
        by_old_url: old_url (cleaned) -> row index
        doc_id_to_url: doc_id -> cur_full_url (for resolving moved_to destinations)
    """
    by_doc_id = {}
    by_old_url = {}
    doc_id_to_url = {}

    for i, row in enumerate(final_rows):
        doc_id = row.get("doc_id", "").strip()
        old_url = clean_slug(row.get("old_url", ""))

        if doc_id:
            by_doc_id.setdefault(doc_id, []).append(i)
            cur_url = row.get("cur_full_url", "")
            if cur_url:
                doc_id_to_url[doc_id] = cur_url

        if old_url:
            by_old_url[old_url] = i

    return by_doc_id, by_old_url, doc_id_to_url


def resolve_destination(entry, doc_id_to_url):
    """Resolve the destination URL for a moved_to entry.

    Priority:
    1. Look up moved_to_id in doc_id_to_url
    2. Compute from moved_to_path using decompose_url
    3. Fall back to moved_to_slug as-is
    """
    moved_to_id = entry.get("moved_to_id", "").strip()
    moved_to_path = entry.get("moved_to_path", "").strip()
    moved_to_slug = entry.get("moved_to_slug", "").strip()

    # 1. Look up moved_to_id
    if moved_to_id and moved_to_id != "N/A":
        url = doc_id_to_url.get(moved_to_id)
        if url:
            return url

    # 2. Compute from moved_to_path
    if moved_to_path and moved_to_path != "N/A":
        norm_path = normalize_path(moved_to_path)
        if norm_path.startswith("fern/products/"):
            norm_path = norm_path[len("fern/products/"):]
        parts = norm_path.split("/")
        product = parts[0] if parts else ""
        page_slug = slug_from_filepath(norm_path)
        d = decompose_url(product, page_slug, norm_path)
        if d.full_url and d.full_url != "/":
            return d.full_url

    # 3. Fall back to slug
    if moved_to_slug and moved_to_slug != "N/A":
        return clean_slug(moved_to_slug)

    return ""


def has_moved_to(entry):
    """Check if an entry has any moved_to info."""
    for field in ("moved_to_slug", "moved_to_path", "moved_to_id"):
        val = entry.get(field, "").strip()
        if val and val != "N/A":
            return True
    return False


def fern_path_to_relative(path):
    """Convert fern/products/... path to products-relative path for fern_file field."""
    norm = normalize_path(path)
    if norm.startswith("fern/products/"):
        return norm[len("fern/products/"):]
    if norm.startswith("fern/"):
        return norm[len("fern/"):]
    return norm


def make_new_row(entry, doc_id_to_url):
    """Create a new final-report row for an entry not already in the report."""
    entry_id = entry.get("id", "").strip()
    entry_slug = clean_slug(entry.get("slug", ""))
    entry_path = entry.get("path", "")
    fern_file = fern_path_to_relative(entry_path) if entry_path else "N/A"

    row = {field: "N/A" for field in FINAL_FIELDS}
    row["old_url"] = entry_slug
    row["doc_id"] = entry_id
    row["fern_file"] = fern_file
    row["category"] = "known_deleted"
    row["confidence"] = "N/A"

    if has_moved_to(entry):
        dest_url = resolve_destination(entry, doc_id_to_url)
        if dest_url:
            row["action"] = "redirect"
            row["prop_full_url"] = dest_url
            row["notes"] = f"content moved to {dest_url}"
        else:
            row["action"] = "gone"
            row["notes"] = "known deleted (moved_to destination not resolved)"
    else:
        row["action"] = "gone"
        row["notes"] = "known deleted"

    return row


def main():
    final_rows = load_final_report()
    known_entries = load_known_deleted()
    print(f"Loaded final report: {len(final_rows)} rows")
    print(f"Loaded known deletions: {len(known_entries)} entries")

    by_doc_id, by_old_url, doc_id_to_url = build_lookups(final_rows)

    # Counters
    doc_id_matched = 0
    slug_matched = 0
    added_redirect = 0
    added_gone = 0
    upgraded_categories = {}

    for entry in known_entries:
        entry_id = entry.get("id", "").strip()
        entry_slug = clean_slug(entry.get("slug", ""))
        validated = False

        # --- Try doc_id match ---
        if entry_id and entry_id in by_doc_id:
            for idx in by_doc_id[entry_id]:
                row = final_rows[idx]
                old_path = entry.get("path", "")
                existing_notes = row.get("notes", "")
                new_note = f"page relocated from {old_path}; tracked in known_deleted"
                if existing_notes:
                    row["notes"] = f"{existing_notes}; {new_note}"
                else:
                    row["notes"] = new_note
            doc_id_matched += 1
            validated = True

        # --- Try slug match (entry.slug -> final_report.old_url) ---
        if not validated and entry_slug and entry_slug in by_old_url:
            idx = by_old_url[entry_slug]
            row = final_rows[idx]
            category = row.get("category", "")

            if category in ("likely_deleted", "no_source"):
                old_category = category
                row["category"] = "known_deleted"
                row["doc_id"] = entry_id or row.get("doc_id", "")
                upgraded_categories[old_category] = upgraded_categories.get(old_category, 0) + 1

                if has_moved_to(entry):
                    dest_url = resolve_destination(entry, doc_id_to_url)
                    if dest_url:
                        row["action"] = "redirect"
                        row["prop_product_slug"] = ""
                        row["prop_version_slug"] = ""
                        row["prop_tab_slug"] = ""
                        row["prop_page_slug"] = ""
                        row["prop_full_url"] = dest_url
                        row["notes"] = f"content moved to {dest_url}"
                    else:
                        row["action"] = "gone"
                        row["notes"] = "known deleted (moved_to destination not resolved)"
                else:
                    row["action"] = "gone"
                    existing_notes = row.get("notes", "")
                    if existing_notes:
                        row["notes"] = f"known deleted; {existing_notes}"
                    else:
                        row["notes"] = "known deleted"

                slug_matched += 1
                validated = True

        # --- No match: add as new row ---
        if not validated:
            new_row = make_new_row(entry, doc_id_to_url)
            final_rows.append(new_row)
            if new_row["action"] == "redirect":
                added_redirect += 1
            else:
                added_gone += 1

    # --- Sort: action priority, then old_url ---
    action_order = {"redirect": 0, "review": 1, "gone": 2, "no_action": 3}
    final_rows.sort(key=lambda r: (action_order.get(r["action"], 9), r["old_url"]))

    # --- Write updated final report ---
    with open(FINAL_REPORT, "w", newline="", encoding="utf-8") as f:
        w = csv.DictWriter(f, fieldnames=FINAL_FIELDS)
        w.writeheader()
        w.writerows(final_rows)

    # --- Summary ---
    print(f"\nResults:")
    print(f"  doc_id matched (notes added):  {doc_id_matched}")
    print(f"  slug matched (upgraded):       {slug_matched}")
    for cat, count in sorted(upgraded_categories.items()):
        print(f"    from {cat}: {count}")
    print(f"  added as new rows (redirect):  {added_redirect}")
    print(f"  added as new rows (gone):      {added_gone}")
    print(f"  total new rows added:          {added_redirect + added_gone}")

    # Post-update category counts
    by_category = {}
    by_action = {}
    for row in final_rows:
        cat = row.get("category", "")
        act = row.get("action", "")
        by_category[cat] = by_category.get(cat, 0) + 1
        by_action[act] = by_action.get(act, 0) + 1

    print(f"\nUpdated final report:")
    print(f"  Total rows: {len(final_rows)}")
    print(f"\n  By category:")
    for cat in sorted(by_category, key=lambda c: -by_category[c]):
        print(f"    {cat}: {by_category[cat]}")
    print(f"\n  By action:")
    for act in sorted(by_action, key=lambda a: -by_action[a]):
        print(f"    {act}: {by_action[act]}")

    print(f"\nWritten to: {FINAL_REPORT}")


if __name__ == "__main__":
    main()
