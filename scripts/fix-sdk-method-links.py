#!/usr/bin/env python3
"""Fix SDK links that point to class pages with method anchors.

Methods have been split into their own subpages. This script:
1. Builds a mapping from (product, version, parent_slug, anchor) -> method_slug
   by reading frontmatter slugs from all method subpage .mdx files
2. Rewrites links like /docs/server-sdk/v3/node/reference/voice/call#playaudio
   to /docs/server-sdk/v3/node/reference/voice/call/play-audio

It does NOT remove any ref definitions — only rewrites URLs.
"""

import os
import re
import sys

DRY_RUN = '--dry-run' in sys.argv


def get_slug(path):
    with open(path, 'r', encoding='utf-8', errors='ignore') as f:
        content = f.read(500)
    m = re.search(r'^slug:\s*(.+)', content, re.MULTILINE)
    return m.group(1).strip() if m else None


def build_method_mapping():
    """Build mapping: (product_slug, version, parent_slug, anchor_lower) -> method_slug"""
    mapping = {}

    for product_dir, product_slug in [
        ('fern/products/realtime-sdk/pages', 'server-sdk'),
        ('fern/products/browser-sdk/pages', 'browser-sdk'),
    ]:
        for root, _, files in os.walk(product_dir):
            if os.path.basename(root) == 'methods':
                parent_dir = os.path.dirname(root)
                parent_index = os.path.join(parent_dir, 'index.mdx')
                parent_slug = get_slug(parent_index) if os.path.exists(parent_index) else None
                if not parent_slug:
                    continue

                rel = os.path.relpath(root, product_dir).replace(os.sep, '/')
                if rel.startswith('v3/'):
                    versions = ['v3']
                elif rel.startswith('v2/'):
                    versions = ['v2']
                elif rel.startswith('latest/'):
                    versions = ['latest', 'v4']
                else:
                    versions = ['unknown']

                for f in files:
                    if f.endswith('.mdx'):
                        method_slug = get_slug(os.path.join(root, f))
                        method_name = f.replace('.mdx', '').lower()
                        if method_slug:
                            for ver in versions:
                                mapping[(product_slug, ver, parent_slug, method_name)] = method_slug

    return mapping


def resolve_link(url, mapping):
    """Try to resolve a link with anchor to a method subpage URL.
    Returns new URL or None if no match."""
    if '#' not in url:
        return None

    base, anchor = url.rsplit('#', 1)
    anchor_lower = anchor.lower()

    m = re.match(r'/docs/(server-sdk|browser-sdk)(?:/(v\d+))?(/.*)', base)
    if not m:
        return None

    product = m.group(1)
    version = m.group(2)
    parent_slug = m.group(3)
    lookup_ver = version if version else 'latest'

    key = (product, lookup_ver, parent_slug, anchor_lower)
    method_slug = mapping.get(key)
    if method_slug:
        if version:
            return f'/docs/{product}/{version}{method_slug}'
        else:
            return f'/docs/{product}{method_slug}'

    return None


def fix_file(path, mapping):
    """Rewrite method-anchor links in a single file. Returns list of changes."""
    with open(path, 'r', encoding='utf-8', errors='ignore') as f:
        lines = f.readlines()

    new_lines = []
    changes = []

    for i, line in enumerate(lines):
        new_line = line

        # Pattern 1: Reference-style [label]: /docs/...#anchor
        def fix_ref(m):
            url = m.group(1)
            new_url = resolve_link(url, mapping)
            if new_url:
                changes.append((i + 1, url, new_url))
                return f']: {new_url}'
            return m.group(0)
        new_line = re.sub(r'\]: (/docs/(?:server-sdk|browser-sdk)/[^\s]+#[\w]+)', fix_ref, new_line)

        # Pattern 2: Inline [text](/docs/...#anchor)
        def fix_inline(m):
            url = m.group(1)
            new_url = resolve_link(url, mapping)
            if new_url:
                changes.append((i + 1, url, new_url))
                return f']({new_url})'
            return m.group(0)
        new_line = re.sub(r'\]\((/docs/(?:server-sdk|browser-sdk)/[^\)]+#[\w]+)\)', fix_inline, new_line)

        # Pattern 3: href="/docs/...#anchor"
        def fix_href(m):
            url = m.group(1)
            new_url = resolve_link(url, mapping)
            if new_url:
                changes.append((i + 1, url, new_url))
                return f'href="{new_url}"'
            return m.group(0)
        new_line = re.sub(r'href="(/docs/(?:server-sdk|browser-sdk)/[^"]+#[\w]+)"', fix_href, new_line)

        new_lines.append(new_line)

    if changes and not DRY_RUN:
        with open(path, 'w', encoding='utf-8', newline='\n') as f:
            f.writelines(new_lines)

    return changes


def main():
    mapping = build_method_mapping()
    print(f'Built mapping with {len(mapping)} entries')

    total_link_fixes = 0
    total_files_fixed = 0
    unresolved = {}

    for root, _, files in os.walk('fern'):
        for f in files:
            if f.endswith('.mdx'):
                path = os.path.join(root, f)
                changes = fix_file(path, mapping)
                if changes:
                    total_files_fixed += 1
                    total_link_fixes += len(changes)
                    if DRY_RUN:
                        for line_num, old, new in changes:
                            print(f'  {path}:{line_num}')
                            print(f'    - {old}')
                            print(f'    + {new}')
                    else:
                        print(f'  Fixed {len(changes)} link(s) in {path}')

    # Report unresolved
    for root, _, files in os.walk('fern'):
        for f in files:
            if f.endswith('.mdx'):
                path = os.path.join(root, f)
                with open(path, 'r', encoding='utf-8', errors='ignore') as fh:
                    for line in fh:
                        for m in re.finditer(r'(/docs/(?:server-sdk|browser-sdk)/[^\s\)"]+#[\w]+)', line):
                            url = m.group(1)
                            if resolve_link(url, mapping) is None:
                                base, anchor = url.rsplit('#', 1)
                                if base not in unresolved:
                                    unresolved[base] = set()
                                unresolved[base].add(anchor)

    mode = "Would fix" if DRY_RUN else "Fixed"
    print(f'\n{mode} {total_link_fixes} links across {total_files_fixed} files.')

    if unresolved:
        print(f'\nUnresolved anchored links (no matching method subpage):')
        for base in sorted(unresolved):
            anchors = sorted(unresolved[base])
            print(f'  {base}')
            for a in anchors:
                print(f'    #{a}')


if __name__ == '__main__':
    main()
