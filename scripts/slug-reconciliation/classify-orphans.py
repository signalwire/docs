#!/usr/bin/env python3
"""Classify orphan IDs as migrated (content moved to new file) or fully deleted.

For each deleted orphan, extracts the title from the git history (last version
before deletion), then checks if any current page has a matching title within
the same product. Also checks if a file exists at a similar path.

Reads:  reports/orphan-ids-traced.csv
Writes: reports/orphan-ids-classified.csv
"""

import csv
import subprocess
from concurrent.futures import ThreadPoolExecutor, as_completed
from pathlib import Path

import frontmatter

SCRIPT_DIR = Path(__file__).resolve().parent
PROJECT_ROOT = SCRIPT_DIR.parent.parent
PRODUCTS_DIR = PROJECT_ROOT / "fern" / "products"
REPORTS_DIR = SCRIPT_DIR / "reports"
INPUT_CSV = REPORTS_DIR / "orphan-ids-traced.csv"


def build_current_pages():
    """Build lookup tables for current pages by title and slug.

    Returns (by_title, by_slug) where each maps to list of page info dicts.
    by_title key is (product, lowercase_title).
    by_slug key is the slug string.
    """
    by_title = {}
    by_slug = {}

    for mdx_path in sorted(PRODUCTS_DIR.rglob("*.mdx")):
        parts = mdx_path.relative_to(PRODUCTS_DIR).parts
        if "pages" not in parts:
            continue

        raw = mdx_path.read_bytes()
        if raw.startswith(b"\xef\xbb\xbf"):
            raw = raw[3:]
        text = raw.decode("utf-8")
        if not text.startswith("---"):
            continue

        try:
            post = frontmatter.loads(text)
        except Exception:
            continue

        title = str(post.metadata.get("title", "")).strip()
        slug = str(post.metadata.get("slug", "")).strip()
        doc_id = str(post.metadata.get("id", "")).strip()
        product = parts[0]

        try:
            rel_path = mdx_path.relative_to(PROJECT_ROOT).as_posix()
        except ValueError:
            rel_path = str(mdx_path)

        info = {"title": title, "slug": slug, "doc_id": doc_id,
                "file_path": rel_path, "product": product}

        if title:
            key = (product, title.lower())
            by_title.setdefault(key, []).append(info)
        if slug:
            by_slug.setdefault(slug, []).append(info)

    return by_title, by_slug


def get_deleted_content(commit_hash, file_path):
    """Get title and slug from file content just before deletion.

    Uses git show <parent>:<path> to read the file before it was deleted.
    """
    ref = f"{commit_hash}^:{file_path}"
    try:
        result = subprocess.run(
            ["git", "show", ref],
            capture_output=True, timeout=10,
            cwd=str(PROJECT_ROOT),
            encoding="utf-8", errors="replace",
        )
        if result.returncode != 0:
            return "", ""

        text = result.stdout
        if not text.startswith("---"):
            return "", ""

        post = frontmatter.loads(text)
        title = str(post.metadata.get("title", "")).strip()
        slug = str(post.metadata.get("slug", "")).strip()
        return title, slug
    except Exception:
        return "", ""


def extract_product(fern_file):
    """Extract product name from fern_file path like 'browser-sdk/pages/...'"""
    parts = fern_file.split("/")
    return parts[0] if parts else ""


def main():
    # Load orphans
    orphans = []
    with open(INPUT_CSV, newline="", encoding="utf-8") as f:
        for row in csv.DictReader(f):
            orphans.append(row)

    deleted = [o for o in orphans if o["status"] == "deleted"]
    print(f"Classifying {len(deleted)} deleted orphans...")

    # Build current page lookups
    print("Scanning current pages...")
    by_title, by_slug = build_current_pages()
    print(f"  {sum(len(v) for v in by_title.values())} pages indexed by title")

    # Extract deleted file content from git in parallel
    print("Extracting deleted file content from git...")

    def fetch_content(orphan):
        commit = orphan.get("deleted_commit", "").strip()
        fern_file = orphan.get("fern_file", "").strip()
        if not commit or not fern_file:
            return orphan["doc_id"], "", ""
        full_path = f"fern/products/{fern_file}"
        title, slug = get_deleted_content(commit, full_path)
        return orphan["doc_id"], title, slug

    content_map = {}
    with ThreadPoolExecutor(max_workers=16) as pool:
        futures = {pool.submit(fetch_content, o): o["doc_id"] for o in deleted}
        done = 0
        for future in as_completed(futures):
            done += 1
            doc_id, title, slug = future.result()
            content_map[doc_id] = {"title": title, "slug": slug}
            if done % 20 == 0 or done == len(deleted):
                print(f"  {done}/{len(deleted)} completed")

    # Classify each orphan
    results = []
    for orphan in orphans:
        row = dict(orphan)

        if orphan["status"] != "deleted":
            row["classification"] = orphan["status"]
            row["deleted_title"] = ""
            row["deleted_slug"] = ""
            row["replacement_file"] = ""
            row["replacement_id"] = ""
            row["replacement_title"] = ""
            row["match_type"] = ""
            results.append(row)
            continue

        doc_id = orphan["doc_id"]
        product = extract_product(orphan.get("fern_file", ""))
        content = content_map.get(doc_id, {})
        del_title = content.get("title", "")
        del_slug = content.get("slug", "")

        row["deleted_title"] = del_title
        row["deleted_slug"] = del_slug

        # Try to find replacement
        replacement = None
        match_type = ""

        # 1. Title match within same product
        if del_title:
            key = (product, del_title.lower())
            matches = by_title.get(key, [])
            if matches:
                replacement = matches[0]
                match_type = "title_in_product"

        # 2. Title match in any product
        if not replacement and del_title:
            for (prod, t), pages in by_title.items():
                if t == del_title.lower():
                    replacement = pages[0]
                    match_type = "title_cross_product"
                    break

        # 3. Slug match
        if not replacement and del_slug:
            matches = by_slug.get(del_slug, [])
            if matches:
                replacement = matches[0]
                match_type = "slug"

        if replacement:
            row["classification"] = "migrated"
            row["replacement_file"] = replacement["file_path"]
            row["replacement_id"] = replacement["doc_id"]
            row["replacement_title"] = replacement["title"]
            row["match_type"] = match_type
        else:
            row["classification"] = "fully_deleted"
            row["replacement_file"] = ""
            row["replacement_id"] = ""
            row["replacement_title"] = ""
            row["match_type"] = ""

        results.append(row)

    # Write output
    fieldnames = [
        "doc_id", "fern_file", "cur_full_url", "old_url", "action", "category",
        "status", "classification", "match_type",
        "deleted_title", "deleted_slug",
        "replacement_file", "replacement_id", "replacement_title",
        "original_file", "deleted_file",
        "added_commit", "added_date", "added_message",
        "deleted_commit", "deleted_date", "deleted_message", "error",
    ]

    output_csv = REPORTS_DIR / "orphan-ids-classified.csv"
    with open(output_csv, "w", newline="", encoding="utf-8") as f:
        w = csv.DictWriter(f, fieldnames=fieldnames, extrasaction="ignore")
        w.writeheader()
        w.writerows(results)

    # Summary
    by_class = {}
    for r in results:
        c = r["classification"]
        by_class.setdefault(c, []).append(r)

    print()
    print("=== Orphan Classification Results ===")
    print()
    for cls in sorted(by_class):
        print(f"  {cls}: {len(by_class[cls])}")

    migrated = by_class.get("migrated", [])
    if migrated:
        print()
        print("Match types:")
        by_match = {}
        for m in migrated:
            mt = m["match_type"]
            by_match.setdefault(mt, []).append(m)
        for mt in sorted(by_match):
            print(f"  {mt}: {len(by_match[mt])}")

    print()
    print(f"Output: {output_csv.relative_to(SCRIPT_DIR)}")


if __name__ == "__main__":
    main()
