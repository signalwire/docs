#!/usr/bin/env python3
"""Insert missing `id: <UUID>` into MDX frontmatter.

Usage:
    # Dry run (default) — show what would change
    python3 scripts/insert-frontmatter-ids.py fern/products/browser-sdk/pages/

    # Apply changes
    python3 scripts/insert-frontmatter-ids.py fern/products/browser-sdk/pages/ --apply

    # Single file
    python3 scripts/insert-frontmatter-ids.py fern/products/browser-sdk/pages/latest/reference/video/overview.mdx --apply
"""

import argparse
import glob
import os
import sys
import uuid


def has_id(lines, limit=20):
    """Check if any of the first `limit` lines contain an id: field."""
    return any(line.startswith("id:") for line in lines[:limit])


def process_file(filepath, apply=False):
    """Insert id into frontmatter if missing. Returns True if file needs/got an id."""
    with open(filepath, "r", encoding="utf-8") as f:
        content = f.read()

    # Strip BOM if present
    if content.startswith("\ufeff"):
        content = content[1:]

    lines = content.split("\n")

    # Must start with frontmatter
    if not lines or lines[0].strip() != "---":
        return False

    if has_id(lines):
        return False

    new_id = str(uuid.uuid4())

    if apply:
        lines.insert(1, f"id: {new_id}")
        with open(filepath, "w", encoding="utf-8") as f:
            f.write("\n".join(lines))

    print(f"{'  ' if apply else '  [dry run] '}{new_id}  {filepath}")
    return True


def main():
    parser = argparse.ArgumentParser(description="Insert missing id: UUIDs into MDX frontmatter")
    parser.add_argument("path", help="File or directory to process")
    parser.add_argument("--apply", action="store_true", help="Actually write changes (default is dry run)")
    args = parser.parse_args()

    path = args.path.rstrip("/")

    if os.path.isfile(path):
        files = [path]
    elif os.path.isdir(path):
        files = sorted(glob.glob(os.path.join(path, "**/*.mdx"), recursive=True))
        files = [f for f in files if not f.endswith(".draft")]
    else:
        print(f"Error: {path} is not a file or directory", file=sys.stderr)
        sys.exit(1)

    count = 0
    for f in files:
        if process_file(f, apply=args.apply):
            count += 1

    mode = "Inserted" if args.apply else "Would insert"
    print(f"\n{mode} {count} ID(s) across {len(files)} file(s)")


if __name__ == "__main__":
    main()
