#!/usr/bin/env python3
"""Insert a unique `id: <uuid>` field into every MDX page's frontmatter
in fern/products/. Skips files that already have an `id` field or no
frontmatter. Also strips UTF-8 BOM if present.

Uses python-frontmatter for robust parsing.
"""

import sys
import uuid
from pathlib import Path

import frontmatter

SCRIPT_DIR = Path(__file__).resolve().parent
PRODUCTS_DIR = SCRIPT_DIR.parent / "fern" / "products"


def main():
    inserted = 0
    skipped = 0
    bom_stripped = 0

    for mdx_path in sorted(PRODUCTS_DIR.rglob("*.mdx")):
        raw = mdx_path.read_bytes()

        # Strip BOM if present
        had_bom = raw.startswith(b"\xef\xbb\xbf")
        if had_bom:
            raw = raw[3:]

        text = raw.decode("utf-8")

        if not text.startswith("---"):
            skipped += 1
            continue

        post = frontmatter.loads(text)

        if "id" in post.metadata:
            if had_bom:
                # Still write back to strip the BOM even if id exists
                mdx_path.write_text(
                    frontmatter.dumps(post, sort_keys=False) + "\n",
                    encoding="utf-8",
                )
                bom_stripped += 1
            skipped += 1
            continue

        post.metadata["id"] = str(uuid.uuid4())

        # python-frontmatter preserves key order; insert id first
        # by rebuilding metadata with id at the top
        new_meta = {"id": post.metadata["id"]}
        for k, v in post.metadata.items():
            if k != "id":
                new_meta[k] = v
        post.metadata = new_meta

        mdx_path.write_text(
            frontmatter.dumps(post, sort_keys=False) + "\n", encoding="utf-8",
        )
        inserted += 1
        if had_bom:
            bom_stripped += 1

    print(f"Inserted id into {inserted} files, skipped {skipped}.")
    if bom_stripped:
        print(f"Stripped BOM from {bom_stripped} files.")


if __name__ == "__main__":
    main()
