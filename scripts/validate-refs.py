#!/usr/bin/env python3
"""Validate that no reference-style link usages are broken (missing definitions)."""

import re
import os

broken = []
for root, dirs, files in os.walk('fern'):
    for f in files:
        if not f.endswith('.mdx'):
            continue
        path = os.path.join(root, f)
        with open(path, 'r', encoding='utf-8', errors='ignore') as fh:
            lines = fh.readlines()

        # Collect all ref definitions
        ref_defs = set()
        for line in lines:
            m = re.match(r'^\[([^\]]+)\]:\s+\S', line)
            if m:
                ref_defs.add(m.group(1))

        # Check for [text][label] usages where label is NOT defined
        in_code_block = False
        for i, line in enumerate(lines):
            stripped = line.strip()
            if stripped.startswith('```'):
                in_code_block = not in_code_block
                continue
            if in_code_block:
                continue
            # Skip definition lines
            if re.match(r'^\[([^\]]+)\]:\s+\S', line):
                continue
            # [text][label] pattern - this is the definitive ref usage pattern
            for m in re.finditer(r'\]\[([^\]]+)\]', line):
                label = m.group(1)
                if label not in ref_defs:
                    broken.append((path, i + 1, label, stripped[:120]))

if broken:
    print(f'Found {len(broken)} broken [text][label] references:')
    for path, ln, label, ctx in broken:
        print(f'  {path}:{ln}: [{label}]')
        print(f'    {ctx}')
else:
    print('No broken [text][label] references found!')
