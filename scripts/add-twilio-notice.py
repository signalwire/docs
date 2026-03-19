#!/usr/bin/env python3
"""Add Twilio trademark notice to all pages that mention Twilio.

For each .mdx file under fern/ that contains "Twilio":
1. Adds an asterisk after the first prose mention of "Twilio" (skipping code blocks and inline code).
2. Appends a trademark notice at the bottom of the page.
"""

import re
import sys
from pathlib import Path

NOTICE = (
    "\n---\n\n"
    "*Twilio and TwiML are trademarks of Twilio, Inc. "
    "SignalWire, Inc. and its products are not affiliated with or endorsed by Twilio, Inc.*\n"
)

FERN_DIR = Path(__file__).resolve().parent.parent / "fern"


def find_first_prose_twilio(content: str) -> int | None:
    """Return the index of the end of the first prose 'Twilio' (not inside code blocks or inline code).

    Returns the index right after 'Twilio' where we'd insert the asterisk,
    or None if no prose mention found.
    """
    # We'll walk through the content tracking whether we're inside a code block or inline code
    i = 0
    in_fenced_block = False
    in_frontmatter = False
    frontmatter_count = 0

    while i < len(content):
        # Track frontmatter (--- at start of file)
        if i == 0 and content[i:i+3] == '---':
            in_frontmatter = True
            i += 3
            continue

        if in_frontmatter:
            # Look for closing ---
            if content[i] == '\n' and content[i+1:i+4] == '---':
                in_frontmatter = False
                i += 4
                continue
            i += 1
            continue

        # Track fenced code blocks (``` or ~~~)
        if content[i] == '\n' and i + 1 < len(content):
            rest = content[i+1:]
            # Check for fenced code block delimiter
            if rest.startswith('```') or rest.startswith('~~~'):
                in_fenced_block = not in_fenced_block
                i += 4
                continue

        if in_fenced_block:
            i += 1
            continue

        # Skip inline code
        if content[i] == '`':
            # Find the closing backtick
            end = content.find('`', i + 1)
            if end != -1:
                i = end + 1
                continue
            i += 1
            continue

        # Check for "Twilio" at current position
        if content[i:i+6] == 'Twilio':
            # Make sure it's not already asterisked
            after = content[i+6:i+7] if i + 6 < len(content) else ''
            if after != '*':
                return i + 6

        i += 1

    return None


def process_file(filepath: Path, dry_run: bool = False) -> bool:
    """Process a single file. Returns True if modified."""
    content = filepath.read_text(encoding='utf-8')

    # Skip if notice already present
    if "trademarks of Twilio, Inc." in content:
        return False

    # Check if file mentions Twilio at all
    if "Twilio" not in content:
        return False

    modified = False

    # Step 1: Add asterisk to first prose mention
    pos = find_first_prose_twilio(content)
    if pos is not None:
        content = content[:pos] + '*' + content[pos:]
        modified = True

    # Step 2: Add trademark notice at bottom
    # Strip trailing whitespace/newlines, then add notice
    content = content.rstrip() + NOTICE
    modified = True

    if not dry_run:
        filepath.write_text(content, encoding='utf-8')

    if modified:
        print(f"  Modified: {filepath.relative_to(FERN_DIR.parent)}")

    return modified


def main():
    dry_run = '--dry-run' in sys.argv
    if dry_run:
        print("DRY RUN - no files will be modified\n")

    # Find all .mdx files containing "Twilio"
    mdx_files = sorted(FERN_DIR.rglob("*.mdx"))

    count = 0
    for f in mdx_files:
        content = f.read_text(encoding='utf-8')
        if "Twilio" in content:
            if process_file(f, dry_run):
                count += 1

    print(f"\n{'Would modify' if dry_run else 'Modified'} {count} files.")


if __name__ == "__main__":
    main()
