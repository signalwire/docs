#!/usr/bin/env python3
"""Export frontmatter fields (id, title, slug, description) + file path to CSV
from all MDX pages in fern/products/.

Replaces the old bash script with python-frontmatter for robust parsing
(handles BOM, multi-line values, quoted strings, etc.).
"""

import csv
import re
import sys
from pathlib import Path

import frontmatter

SCRIPT_DIR = Path(__file__).resolve().parent
PROJECT_ROOT = SCRIPT_DIR.parent.parent
REPORTS_DIR = SCRIPT_DIR / "reports"
FERN_DIR = PROJECT_ROOT / "fern"
PRODUCTS_DIR = FERN_DIR / "products"
DOCS_YML = FERN_DIR / "docs.yml"

FIELDS = ("id", "title", "product", "slug", "description", "file_path")


def build_dir_to_slug():
    """Parse docs.yml to map directory names → product slugs.

    Uses simple regex matching (same approach as the old bash script)
    to avoid round-tripping the YAML through a serializer.
    """
    mapping = {}
    current_slug = None
    for line in DOCS_YML.read_text().splitlines():
        m = re.match(r"^\s+slug:\s+(.*)", line)
        if m:
            current_slug = m.group(1).strip()
        m = re.match(r"^\s+path:\s+products/([^/]+)", line)
        if m and current_slug is not None:
            d = m.group(1)
            mapping.setdefault(d, current_slug)
    return mapping


def main():
    output_csv = sys.argv[1] if len(sys.argv) > 1 else str(REPORTS_DIR / "frontmatter-export.csv")
    dir_to_slug = build_dir_to_slug()

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

        rel_path = str(mdx_path.relative_to(PRODUCTS_DIR))
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
