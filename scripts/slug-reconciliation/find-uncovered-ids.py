#!/usr/bin/env python3
"""Find gaps between the slug audit report and the filesystem.

Produces two reports:
  1. uncovered-pages.csv     — Pages with IDs not in the report (never audited)
  2. pages-without-ids.csv   — Pages that have no id: in frontmatter at all

Orphan report IDs (in report but no file on disk) are handled separately by
trace-orphan-ids.py and classify-orphans.py.
"""

import csv
from pathlib import Path

import frontmatter

SCRIPT_DIR = Path(__file__).resolve().parent
PROJECT_ROOT = SCRIPT_DIR.parent.parent
PRODUCTS_DIR = PROJECT_ROOT / "fern" / "products"
REPORTS_DIR = SCRIPT_DIR / "reports"
INPUT_CSV = SCRIPT_DIR / "manually_edited_reports" / "final-manual-report.csv"


def collect_report_ids(csv_path):
    """Collect all non-empty doc_id values from the report CSV.

    Returns (set of doc_ids, total row count).
    """
    ids = set()
    total = 0

    with open(csv_path, newline="", encoding="utf-8-sig") as f:
        reader = csv.DictReader(f)
        for row in reader:
            total += 1
            doc_id = (row.get("doc_id") or "").strip()
            if doc_id:
                ids.add(doc_id)

    return ids, total


def scan_all_pages():
    """Scan MDX files under pages/ directories.

    Returns (pages_with_ids list, pages_without_ids list, total_files).
    Each entry is a dict with page metadata.
    """
    with_ids = []
    without_ids = []
    total_files = 0

    for mdx_path in sorted(PRODUCTS_DIR.rglob("*.mdx")):
        # Skip draft files
        if mdx_path.name.endswith(".mdx.draft") or ".draft" in mdx_path.suffixes:
            continue

        # Only include files under a pages/ directory
        parts = mdx_path.relative_to(PRODUCTS_DIR).parts
        if "pages" not in parts:
            continue

        total_files += 1

        raw = mdx_path.read_bytes()
        if raw.startswith(b"\xef\xbb\xbf"):
            raw = raw[3:]
        text = raw.decode("utf-8")

        # Extract product name
        product = parts[0] if parts else ""

        try:
            rel_path = mdx_path.relative_to(PROJECT_ROOT).as_posix()
        except ValueError:
            rel_path = str(mdx_path)

        has_frontmatter = text.startswith("---")
        post = None
        if has_frontmatter:
            try:
                post = frontmatter.loads(text)
            except Exception:
                pass

        doc_id = ""
        title = ""
        slug = ""
        subtitle = ""

        if post is not None:
            doc_id = str(post.metadata.get("id", "")).strip()
            title = str(post.metadata.get("title", "")).strip()
            slug = str(post.metadata.get("slug", "")).strip()
            subtitle = str(post.metadata.get("subtitle", "")).strip()

        page_info = {
            "doc_id": doc_id,
            "title": title,
            "slug": slug,
            "subtitle": subtitle,
            "file_path": rel_path,
            "product": product,
            "has_frontmatter": has_frontmatter and post is not None,
        }

        if doc_id:
            with_ids.append(page_info)
        else:
            without_ids.append(page_info)

    return with_ids, without_ids, total_files



def write_csv(path, fieldnames, rows):
    with open(path, "w", newline="", encoding="utf-8") as f:
        w = csv.DictWriter(f, fieldnames=fieldnames, extrasaction="ignore")
        w.writeheader()
        w.writerows(rows)


def main():
    # Step 1 — Load report
    print(f"Loading CSV: {INPUT_CSV.relative_to(SCRIPT_DIR)}")
    report_ids, total_rows = collect_report_ids(INPUT_CSV)
    print(f"  {total_rows} rows, {len(report_ids)} unique doc_ids")

    # Step 2 — Scan filesystem
    print("Scanning MDX pages...")
    pages_with_ids, pages_without_ids, total_files = scan_all_pages()
    print(f"  {total_files} MDX pages, {len(pages_with_ids)} with IDs, {len(pages_without_ids)} without IDs")

    # Step 3 — Compute sets
    uncovered = sorted(
        [p for p in pages_with_ids if p["doc_id"] not in report_ids],
        key=lambda r: r["file_path"],
    )

    no_ids = sorted(pages_without_ids, key=lambda r: r["file_path"])

    # Step 4 — Write reports
    REPORTS_DIR.mkdir(parents=True, exist_ok=True)

    uncovered_csv = REPORTS_DIR / "uncovered-pages.csv"
    write_csv(uncovered_csv,
        ["doc_id", "title", "slug", "file_path", "product"],
        uncovered,
    )

    no_ids_csv = REPORTS_DIR / "pages-without-ids.csv"
    write_csv(no_ids_csv,
        ["title", "slug", "file_path", "product", "has_frontmatter"],
        no_ids,
    )

    # Step 5 — Summary
    fs_ids = {p["doc_id"] for p in pages_with_ids}
    orphan_count = len(report_ids - fs_ids)

    print()
    print("=== Coverage Gap Report ===")
    print()
    print(f"Report:     {total_rows} rows, {len(report_ids)} unique doc_ids")
    print(f"Filesystem: {total_files} MDX pages, {len(pages_with_ids)} with IDs, {len(pages_without_ids)} without")
    print()
    print(f"1. Uncovered pages (have ID, not in report): {len(uncovered)}")
    print(f"2. Orphan report IDs (in report, no file):   {orphan_count}  (see classify-orphans.py)")
    print(f"3. Pages without any ID:                     {len(no_ids)}")
    print()

    if uncovered:
        print("Uncovered pages by product:")
        by_product = {}
        for p in uncovered:
            by_product.setdefault(p["product"], []).append(p)
        for product in sorted(by_product):
            print(f"  {product}: {len(by_product[product])}")
        print()

    if no_ids:
        print("Pages without IDs by product:")
        by_product = {}
        for p in no_ids:
            by_product.setdefault(p["product"], []).append(p)
        for product in sorted(by_product):
            print(f"  {product}: {len(by_product[product])}")
        print()

    print("Reports:")
    print(f"  {uncovered_csv.relative_to(SCRIPT_DIR)}")
    print(f"  {no_ids_csv.relative_to(SCRIPT_DIR)}")


if __name__ == "__main__":
    main()
