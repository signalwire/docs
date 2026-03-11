#!/usr/bin/env python3
"""Strip redundant #anchor fragments from method-page ref definitions.

When a method became its own page, the anchor (e.g., #connectphone) is redundant
because the entire page IS that method. Keep anchors on /events pages since those
point to specific sections.
"""
import re
import sys
import subprocess

def strip_redundant_anchor(m):
    prefix = m.group(1)  # [label]: url-without-anchor
    anchor = m.group(2)  # #anchor
    # Keep anchors on events pages
    if prefix.rstrip().endswith("/events"):
        return prefix + anchor
    return prefix

# Get list of changed files
result = subprocess.run(
    ["git", "diff", "--name-only", "--", "fern/"],
    capture_output=True, text=True
)
files = [f for f in result.stdout.strip().split("\n") if f]

fixed = 0
for filepath in files:
    try:
        with open(filepath, "r", encoding="utf-8") as f:
            content = f.read()
    except (FileNotFoundError, UnicodeDecodeError):
        continue

    # Match ref def lines with /docs/ URLs that have anchors
    new_content = re.sub(
        r"^(\[.*?\]:\s*/docs/[^#\s]+)(#\S+)",
        strip_redundant_anchor,
        content,
        flags=re.MULTILINE,
    )

    if new_content != content:
        with open(filepath, "w", encoding="utf-8", newline="") as f:
            f.write(new_content)
        print(f"Fixed: {filepath}")
        fixed += 1

print(f"\nStripped redundant anchors from {fixed} files.")
