#!/usr/bin/env python3
"""Prepend /docs to internal slug links in .mdx files.

Targets three link patterns:
1. Reference-style:  [label]: /path
2. Inline:           [text](/path)
3. href attribute:   href="/path"

Excludes links already starting with /docs, /assets, or /snippets.
"""

import re
import os
import sys

EXCLUDED_PREFIXES = ('/docs/', '/docs#', '/docs"', '/assets/', '/snippets/')
DRY_RUN = '--dry-run' in sys.argv


def should_fix(slug):
    """Return True if this slug needs /docs prepended."""
    return not any(slug.startswith(p) for p in EXCLUDED_PREFIXES)


def fix_line(line):
    """Fix all three link patterns in a single line."""
    changed = False

    # 1. Reference-style: ]: /path
    def fix_ref(m):
        nonlocal changed
        slug = m.group(1)
        if should_fix(slug):
            changed = True
            return ']: /docs' + slug
        return m.group(0)

    line = re.sub(r'\]: (/[a-z][\w./#-]*)', fix_ref, line)

    # 2. Inline: [text](/path)
    def fix_inline(m):
        nonlocal changed
        slug = m.group(1)
        if should_fix(slug):
            changed = True
            return '](/docs' + slug
        return m.group(0)

    line = re.sub(r'\]\((/[a-z][\w./#-]*)', fix_inline, line)

    # 3. href="/path"
    def fix_href(m):
        nonlocal changed
        slug = m.group(1)
        if should_fix(slug):
            changed = True
            return 'href="/docs' + slug + '"'
        return m.group(0)

    line = re.sub(r'href="(/[a-z][\w./#-]*)"', fix_href, line)

    return line, changed


def process_file(path):
    """Process a single file and return number of lines changed."""
    with open(path, 'r', encoding='utf-8', errors='ignore') as f:
        lines = f.readlines()

    new_lines = []
    total_changed = 0
    for i, line in enumerate(lines):
        new_line, changed = fix_line(line)
        if changed:
            total_changed += 1
            if DRY_RUN:
                print(f"  {path}:{i+1}")
                print(f"    - {line.rstrip()}")
                print(f"    + {new_line.rstrip()}")
        new_lines.append(new_line)

    if total_changed > 0 and not DRY_RUN:
        with open(path, 'w', encoding='utf-8', newline='\n') as f:
            f.writelines(new_lines)

    return total_changed


def main():
    total_files = 0
    total_changes = 0

    for root, dirs, files in os.walk('fern'):
        for f in files:
            if f.endswith('.mdx'):
                path = os.path.join(root, f)
                changes = process_file(path)
                if changes:
                    total_files += 1
                    total_changes += changes
                    if not DRY_RUN:
                        print(f"  Fixed {changes} link(s) in {path}")

    mode = "Would fix" if DRY_RUN else "Fixed"
    print(f"\n{mode} {total_changes} lines across {total_files} files.")


if __name__ == '__main__':
    main()
