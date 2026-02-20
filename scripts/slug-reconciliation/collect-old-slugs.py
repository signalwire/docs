#!/usr/bin/env python3
"""Collect current slugs from MDX frontmatter into a CSV.

Scans all .mdx files under fern/products/ and writes one row per page with
columns: id, title, product, slug, description, file_path.

Output: frontmatter-export.csv (or custom path via argv[1]).
"""

import csv
import sys
from pathlib import Path

import frontmatter

from utils import build_product_slug_map, normalize_path

SCRIPT_DIR = Path(__file__).resolve().parent
PROJECT_ROOT = SCRIPT_DIR.parent.parent
REPORTS_DIR = SCRIPT_DIR / "reports"
PRODUCTS_DIR = PROJECT_ROOT / "fern" / "products"

FIELDS = ("id", "title", "product", "slug", "description", "file_path")


def main():
    output_csv = sys.argv[1] if len(sys.argv) > 1 else str(REPORTS_DIR / "frontmatter-export.csv")
    dir_to_slug = build_product_slug_map()

    rows = []
    for mdx_path in sorted(PRODUCTS_DIR.rglob("*.mdx")):
        raw = mdx_path.read_bytes()
        # Strip UTF-8 BOM if present
        if raw.startswith(b"\xef\xbb\xbf"):
            raw = raw[3:]
        text = raw.decode("utf-8")

        # Skip files without frontmatter
        if not text.startswith("---"):
            continue

        post = frontmatter.loads(text)
        meta = post.metadata

        rel_path = normalize_path(mdx_path.relative_to(PRODUCTS_DIR))
        product_dir = rel_path.split("/")[0]
        product = dir_to_slug.get(product_dir, product_dir)

        rows.append({
            "id": str(meta.get("id", "")),
            "title": str(meta.get("title", "")),
            "product": product,
            "slug": str(meta.get("slug", "")),
            "description": str(meta.get("description", "")),
            "file_path": rel_path,
        })

    with open(output_csv, "w", newline="") as f:
        w = csv.DictWriter(f, fieldnames=FIELDS)
        w.writeheader()
        w.writerows(rows)

    print(f"Exported {len(rows)} pages to {output_csv}")


if __name__ == "__main__":
    main()
