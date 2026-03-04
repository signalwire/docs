#!/usr/bin/env python3
"""Replace slug: frontmatter in MDX files based on the manually audited report.

Matches report rows to MDX files by doc_id (UUID in frontmatter `id:` field),
then replaces or inserts the `slug:` line with the proposed slug from the report.

Dry-run by default. Pass --apply to write changes.

Output:
  reports/slug-replacement-results.csv  — all processed rows with status
  reports/missing-ids-report.csv        — IDs not found in any MDX file
"""

import argparse
import csv
import re
import sys
from pathlib import Path

import frontmatter

SCRIPT_DIR = Path(__file__).resolve().parent
PROJECT_ROOT = SCRIPT_DIR.parent.parent
PRODUCTS_DIR = PROJECT_ROOT / "fern" / "products"
REPORTS_DIR = SCRIPT_DIR / "reports"
INPUT_CSV = SCRIPT_DIR / "manually_edited_reports" / "final-manual-report.csv"

# Regex to match the slug: line in frontmatter (between --- delimiters)
SLUG_LINE_RE = re.compile(r"^(slug:\s*)(.+)$", re.MULTILINE)
TITLE_LINE_RE = re.compile(r"^(title:.+)$", re.MULTILINE)


def parse_args():
    parser = argparse.ArgumentParser(description="Replace slugs in MDX frontmatter from audit report.")
    parser.add_argument("--apply", action="store_true", help="Write changes to files (default is dry-run)")
    parser.add_argument("--input", type=str, default=str(INPUT_CSV), help="Path to input CSV")
    return parser.parse_args()


def load_and_filter_csv(csv_path):
    """Load the CSV and filter to actionable rows.

    Returns (actionable_rows, total_count).
    Each row is a dict from csv.DictReader.
    """
    rows = []
    total = 0

    with open(csv_path, newline="", encoding="utf-8-sig") as f:
        reader = csv.DictReader(f)
        for row in reader:
            total += 1
            doc_id = (row.get("doc_id") or "").strip()
            prop_slug = (row.get("prop_page_slug") or "").strip()
            approved = (row.get("approved OR updated") or "").strip().upper()

            if doc_id and prop_slug and approved == "TRUE":
                rows.append(row)

    return rows, total


def deduplicate_by_id(rows):
    """Deduplicate rows by doc_id, keeping the first occurrence.

    Returns (deduped_list, duplicate_count).
    """
    seen = {}
    deduped = []
    dup_count = 0

    for row in rows:
        doc_id = row["doc_id"].strip()
        if doc_id in seen:
            dup_count += 1
        else:
            seen[doc_id] = True
            deduped.append(row)

    return deduped, dup_count


def build_id_to_file_map():
    """Scan all MDX files and build a map from frontmatter id to file path.

    Returns (id_map, total_files, files_with_ids).
    """
    id_map = {}
    total_files = 0
    files_with_ids = 0

    for mdx_path in sorted(PRODUCTS_DIR.rglob("*.mdx")):
        total_files += 1
        raw = mdx_path.read_bytes()

        # Strip UTF-8 BOM if present
        if raw.startswith(b"\xef\xbb\xbf"):
            raw = raw[3:]

        text = raw.decode("utf-8")

        if not text.startswith("---"):
            continue

        try:
            post = frontmatter.loads(text)
        except Exception:
            continue

        doc_id = str(post.metadata.get("id", "")).strip()
        if doc_id:
            files_with_ids += 1
            id_map[doc_id] = mdx_path

    return id_map, total_files, files_with_ids


def extract_frontmatter_block(text):
    """Extract the frontmatter section (between --- delimiters) and body.

    Returns (frontmatter_str, body_str, start_idx, end_idx) or None if no frontmatter.
    The indices are for the frontmatter content between the --- markers.
    """
    if not text.startswith("---"):
        return None

    # Find the closing ---
    end = text.find("\n---", 3)
    if end == -1:
        return None

    # frontmatter is between the first --- and the closing ---
    fm_start = text.index("\n", 0) + 1  # skip first ---\n
    fm_end = end
    fm_content = text[fm_start:fm_end]
    body = text[fm_end + 4:]  # skip \n---

    return fm_content, body, fm_start, fm_end


def replace_slug_in_file(file_path, new_slug, apply):
    """Replace or insert the slug: line in a file's frontmatter.

    Returns (old_slug, status) where status is 'replaced', 'already_correct', or 'error'.
    """
    raw = file_path.read_bytes()
    if raw.startswith(b"\xef\xbb\xbf"):
        raw = raw[3:]
    text = raw.decode("utf-8")

    result = extract_frontmatter_block(text)
    if result is None:
        return "", "error"

    fm_content, _body, fm_start, fm_end = result

    # Check for existing slug: line in frontmatter
    slug_match = SLUG_LINE_RE.search(fm_content)

    if slug_match:
        old_slug = slug_match.group(2).strip()
        # Strip quotes if present
        old_slug_clean = old_slug.strip("'\"")

        if old_slug_clean == new_slug:
            return old_slug_clean, "already_correct"

        # Replace the slug line
        new_fm = fm_content[:slug_match.start()] + f"slug: {new_slug}" + fm_content[slug_match.end():]
        new_text = text[:fm_start] + new_fm + text[fm_end:]

        if apply:
            file_path.write_bytes(new_text.encode("utf-8"))

        return old_slug_clean, "replaced"
    else:
        # No slug: line — insert after title: line
        old_slug = ""
        title_match = TITLE_LINE_RE.search(fm_content)
        if title_match:
            insert_pos = title_match.end()
            new_fm = fm_content[:insert_pos] + f"\nslug: {new_slug}" + fm_content[insert_pos:]
        else:
            # No title either — prepend to frontmatter
            new_fm = f"slug: {new_slug}\n" + fm_content

        new_text = text[:fm_start] + new_fm + text[fm_end:]

        if apply:
            file_path.write_bytes(new_text.encode("utf-8"))

        return old_slug, "replaced"


def main():
    args = parse_args()
    mode = "APPLY" if args.apply else "DRY-RUN"

    # Step 1 — Load & filter CSV
    print(f"Loading CSV: {args.input}")
    actionable, total_loaded = load_and_filter_csv(args.input)
    print(f"  {total_loaded} total rows -> {len(actionable)} actionable")

    # Step 2 — Deduplicate by doc_id
    deduped, dup_count = deduplicate_by_id(actionable)
    print(f"  {len(deduped)} unique doc_ids ({dup_count} duplicates)")

    # Step 3 — Build ID→file map
    print("Scanning MDX files...")
    id_map, total_files, files_with_ids = build_id_to_file_map()
    print(f"  {total_files} MDX files ({files_with_ids} with IDs)")

    # Step 4 — Process each row
    results = []
    missing = []
    counts = {"replaced": 0, "already_correct": 0, "not_found": 0, "error": 0}

    for row in deduped:
        doc_id = row["doc_id"].strip()
        new_slug = row["prop_page_slug"].strip()

        if doc_id not in id_map:
            counts["not_found"] += 1
            results.append({
                "doc_id": doc_id,
                "file_path": "",
                "old_slug": "",
                "new_slug": new_slug,
                "status": "not_found",
            })
            missing.append({
                "doc_id": doc_id,
                "old_url": (row.get("old_url") or "").strip(),
                "cur_full_url": (row.get("cur_full_url") or "").strip(),
                "cur_page_slug": (row.get("cur_page_slug") or "").strip(),
                "prop_page_slug": new_slug,
                "action": (row.get("action") or "").strip(),
            })
            continue

        file_path = id_map[doc_id]
        try:
            rel_path = file_path.relative_to(PROJECT_ROOT).as_posix()
        except ValueError:
            rel_path = str(file_path)

        try:
            old_slug, status = replace_slug_in_file(file_path, new_slug, args.apply)
        except Exception as e:
            old_slug, status = "", "error"
            print(f"  ERROR processing {rel_path}: {e}", file=sys.stderr)

        counts[status] += 1
        results.append({
            "doc_id": doc_id,
            "file_path": rel_path,
            "old_slug": old_slug,
            "new_slug": new_slug,
            "status": status,
        })

    # Step 5 — Write output reports
    REPORTS_DIR.mkdir(parents=True, exist_ok=True)

    results_csv = REPORTS_DIR / "slug-replacement-results.csv"
    with open(results_csv, "w", newline="", encoding="utf-8") as f:
        w = csv.DictWriter(f, fieldnames=["doc_id", "file_path", "old_slug", "new_slug", "status"])
        w.writeheader()
        w.writerows(results)

    missing_csv = REPORTS_DIR / "missing-ids-report.csv"
    with open(missing_csv, "w", newline="", encoding="utf-8") as f:
        w = csv.DictWriter(f, fieldnames=["doc_id", "old_url", "cur_full_url", "cur_page_slug", "prop_page_slug", "action"])
        w.writeheader()
        w.writerows(missing)

    # Step 6 — Print summary
    print()
    print(f"=== Slug Replacement ({mode}) ===")
    print()
    print(f"Loaded: {total_loaded} rows -> {len(actionable)} actionable -> {len(deduped)} unique doc_ids")
    print(f"Scanned: {total_files} MDX files ({files_with_ids} with IDs)")
    print()
    print("Results:")
    print(f"  Replaced:          {counts['replaced']}")
    print(f"  Already correct:   {counts['already_correct']}")
    print(f"  Not found:         {counts['not_found']}")
    print(f"  Errors:            {counts['error']}")
    print(f"  Duplicates skipped: {dup_count}")
    print()
    print(f"Reports: {results_csv.relative_to(SCRIPT_DIR)}, {missing_csv.relative_to(SCRIPT_DIR)}")

    if not args.apply:
        print()
        print(f"{mode}: No files modified. Run with --apply to write changes.")


if __name__ == "__main__":
    main()
