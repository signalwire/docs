#!/usr/bin/env python3
"""Fix slug and moved_to_slug columns in new_known_deleted.csv.

Looks up each row's id and moved_to_id in the final report to pull the
actual cur_full_url. Falls back to computing from path using decompose_url()
when IDs aren't found (e.g., files already deleted from disk).
"""

import csv
from pathlib import Path

from utils import decompose_url, normalize_path, slug_from_filepath

SCRIPT_DIR = Path(__file__).resolve().parent
FINAL_REPORT = SCRIPT_DIR / "reports" / "slug-final-report.csv"
DELETED_CSV = SCRIPT_DIR / "deletions" / "new_known_deleted.csv"


def build_id_to_url(report_path):
    """Build doc_id -> cur_full_url lookup from the final report."""
    lookup = {}
    with open(report_path, newline="", encoding="utf-8") as f:
        for row in csv.DictReader(f):
            doc_id = row.get("doc_id", "").strip()
            url = row.get("cur_full_url", "").strip()
            if doc_id and url:
                lookup[doc_id] = url
    return lookup


def slug_from_path(fern_path):
    """Compute full URL from a fern file path like
    fern/products/platform/pages/platform/basics/general/sip.mdx
    """
    norm = normalize_path(fern_path)
    # Strip leading fern/products/ to get path relative to products/
    prefix = "fern/products/"
    if norm.startswith(prefix):
        rel = norm[len(prefix):]
    else:
        rel = norm

    # Extract product (first segment)
    parts = rel.split("/")
    product = parts[0] if parts else ""

    page_slug = slug_from_filepath(rel)
    result = decompose_url(product, page_slug, rel)
    return result.full_url


def main():
    if not FINAL_REPORT.exists():
        print(f"Error: {FINAL_REPORT} not found. Run run-pipeline.py first.")
        return

    # Build lookup
    id_to_url = build_id_to_url(FINAL_REPORT)
    print(f"Loaded {len(id_to_url)} doc_id -> url mappings from final report")

    # Read the deleted CSV
    with open(DELETED_CSV, newline="", encoding="utf-8") as f:
        reader = csv.DictReader(f)
        fieldnames = reader.fieldnames
        rows = list(reader)

    updated_slug = 0
    updated_moved = 0
    fallback_slug = 0
    fallback_moved = 0

    for row in rows:
        doc_id = row.get("id", "").strip()
        moved_to_id = row.get("moved_to_id", "").strip()

        # Fix slug from id
        if doc_id and doc_id != "N/A" and doc_id in id_to_url:
            row["slug"] = id_to_url[doc_id]
            updated_slug += 1
        elif row.get("path", "").strip() and row["path"].strip() != "N/A":
            row["slug"] = slug_from_path(row["path"])
            fallback_slug += 1

        # Fix moved_to_slug from moved_to_id
        if moved_to_id and moved_to_id != "N/A" and moved_to_id in id_to_url:
            row["moved_to_slug"] = id_to_url[moved_to_id]
            updated_moved += 1
        elif row.get("moved_to_path", "").strip() and row["moved_to_path"].strip() != "N/A":
            row["moved_to_slug"] = slug_from_path(row["moved_to_path"])
            fallback_moved += 1

    # Write back
    with open(DELETED_CSV, "w", newline="", encoding="utf-8") as f:
        writer = csv.DictWriter(f, fieldnames=fieldnames)
        writer.writeheader()
        writer.writerows(rows)

    print(f"\nUpdated {DELETED_CSV}")
    print(f"  slug:         {updated_slug} from report, {fallback_slug} from path fallback")
    print(f"  moved_to_slug: {updated_moved} from report, {fallback_moved} from path fallback")
    print(f"  Total rows:   {len(rows)}")


if __name__ == "__main__":
    main()
