#!/usr/bin/env python3
"""Find dead (orphaned) reference-style link usages in MDX files.

A "dead reference" is a [text][label] or [label] usage where no corresponding
[label]: URL definition exists in the same file (or in included snippets).

Usage:
    python scripts/find-dead-refs.py              # human-readable stdout
    python scripts/find-dead-refs.py --csv out.csv # machine-readable CSV
    python scripts/find-dead-refs.py --fix         # auto-fix dead references

Exit code: 0 if no dead refs found, 1 if any found.
"""

import argparse
import csv
import os
import re
import sys

# ---------------------------------------------------------------------------
# Regex patterns
# ---------------------------------------------------------------------------

# Reference definition: [label]: URL  (optional title)
RE_DEF = re.compile(r'^\s*\[([^\]]+)\]:\s+\S')

# Full reference usage: [display text][label]
RE_FULL_REF = re.compile(r'\[([^\]]*)\]\[([^\]]+)\]')

# Shorthand reference usage: [label]
# Must NOT be followed by [ (full ref), ( (inline link), or : + space (definition)
# Must NOT be preceded by ] (would be the label part of [text][label])
# Must NOT be preceded by ! (image ref)
RE_SHORT_REF = re.compile(r'(?<![!\]])\[([^\]\[]+)\](?!\[|:\s|\()')

# Markdown snippet include: <Markdown src="/snippets/..." />
RE_SNIPPET = re.compile(r'<Markdown\s+src="(/snippets/[^"]+)"', re.IGNORECASE)

# Fenced code block delimiter
RE_CODE_FENCE = re.compile(r'^(\s*)`{3,}')

# Inline code spans
RE_INLINE_CODE = re.compile(r'`[^`]+`')

# ---------------------------------------------------------------------------
# Label filtering
# ---------------------------------------------------------------------------


def _is_ignorable_label(label):
    """Return True if the label should not be treated as a reference."""
    # Whitespace-only (from masked inline code)
    if not label.strip():
        return True
    # Footnotes: [^1], [^note]
    if label.startswith('^'):
        return True
    # JSX/HTML: [<Component>]
    if label.startswith('<'):
        return True
    # Checkboxes: [x], [ ], [X]
    if label in ('x', ' ', 'X'):
        return True
    # Inline code or URLs
    if label.startswith('http'):
        return True
    # Heading anchors: [#some-anchor]
    if label.startswith('#'):
        return True
    # Numeric (array index): [0], [1], etc.
    if label.strip().isdigit():
        return True
    # JSON/array-like content: ["foo"], ["a", "b"], [{"key": ...}]
    if label.lstrip().startswith(('"', "'", '{')):
        return True
    # Type annotations: [str], [dict], [int], etc.
    type_names = {
        'str', 'string', 'int', 'float', 'bool', 'dict', 'list',
        'none', 'any', 'object', 't', 'type', 'void',
    }
    if label.lower().strip() in type_names:
        return True
    # Labels containing commas (likely array content)
    if ',' in label:
        return True
    # Labels containing quotes (JSON-like)
    if '"' in label or "'" in label:
        return True
    # Labels with colons followed by space (likely not refs)
    if ': ' in label:
        return True
    # Labels with spaces that look like natural language placeholders
    # Real ref labels are typically slug-like (no spaces, or hyphenated)
    # But some legitimate refs have spaces (e.g., "ngrok guide")
    # Labels with spaces where any word is capitalized — likely natural language
    # placeholders like [Caller ID], not reference labels (which are lowercase/hyphenated)
    if ' ' in label and any(c.isupper() for c in label):
        return True
    return False


def _find_inline_code_spans(line):
    """Return list of (start, end) for inline code spans in a line."""
    return [(m.start(), m.end()) for m in RE_INLINE_CODE.finditer(line)]


def _is_inside_inline_code(code_spans, start, end):
    """Check if range [start, end) is fully contained within an inline code span."""
    for cs, ce in code_spans:
        if start >= cs and end <= ce:
            return True
    return False


def _is_inside_jsx_attr(line, match_start):
    """Check if a position is inside a JSX attribute value (quotes)."""
    before = line[:match_start]
    dq_count = before.count('"') - before.count('\\"')
    return dq_count % 2 == 1


# ---------------------------------------------------------------------------
# Collection
# ---------------------------------------------------------------------------


def collect_definitions(lines):
    """Return a set of lowercase labels defined in the given lines."""
    defs = set()
    in_code = False
    for line in lines:
        stripped = line.strip()
        if RE_CODE_FENCE.match(stripped):
            in_code = not in_code
            continue
        if in_code:
            continue
        m = RE_DEF.match(line)
        if m:
            defs.add(m.group(1).lower())
    return defs


def collect_usages(lines):
    """Return list of (line_num, label_lower, usage_text, context_line) tuples."""
    usages = []
    in_code = False
    for i, line in enumerate(lines):
        stripped = line.strip()
        if RE_CODE_FENCE.match(stripped):
            in_code = not in_code
            continue
        if in_code:
            continue
        # Skip definition lines
        if RE_DEF.match(line):
            continue

        code_spans = _find_inline_code_spans(line)

        # Full references: [display text][label]
        for m in RE_FULL_REF.finditer(line):
            if _is_inside_inline_code(code_spans, m.start(), m.end()):
                continue
            label = m.group(2)
            if _is_ignorable_label(label):
                continue
            if _is_inside_jsx_attr(line, m.start()):
                continue
            usages.append((i + 1, label.lower(), m.group(0), stripped))

        # Shorthand references: [label]
        full_ref_spans = [(m.start(), m.end()) for m in RE_FULL_REF.finditer(line)]

        for m in RE_SHORT_REF.finditer(line):
            if _is_inside_inline_code(code_spans, m.start(), m.end()):
                continue
            if any(m.start() >= s and m.start() < e for s, e in full_ref_spans):
                continue
            label = m.group(1)
            if _is_ignorable_label(label):
                continue
            if _is_inside_jsx_attr(line, m.start()):
                continue
            usages.append((i + 1, label.lower(), m.group(0), stripped))

    return usages


def resolve_snippet_defs(filepath, fern_root):
    """Collect definitions from snippets included via <Markdown src="...">."""
    snippet_defs = set()
    try:
        with open(filepath, 'r', encoding='utf-8', errors='ignore') as fh:
            content = fh.read()
    except (OSError, IOError):
        return snippet_defs

    for m in RE_SNIPPET.finditer(content):
        snippet_path = m.group(1)
        local_path = os.path.join(fern_root, snippet_path.lstrip('/'))
        if os.path.isfile(local_path):
            try:
                with open(local_path, 'r', encoding='utf-8', errors='ignore') as fh:
                    snippet_lines = fh.readlines()
                snippet_defs |= collect_definitions(snippet_lines)
            except (OSError, IOError):
                pass
    return snippet_defs


def find_dead_refs(fern_root='fern'):
    """Scan all .mdx files under fern_root and return dead references."""
    results = []

    for root, _, files in os.walk(fern_root):
        for fname in files:
            if not fname.endswith('.mdx'):
                continue
            filepath = os.path.join(root, fname)
            try:
                with open(filepath, 'r', encoding='utf-8', errors='ignore') as fh:
                    lines = fh.readlines()
            except (OSError, IOError):
                continue

            defs = collect_definitions(lines)
            defs |= resolve_snippet_defs(filepath, fern_root)
            usages = collect_usages(lines)

            for line_num, label_lower, usage_text, context in usages:
                if label_lower not in defs:
                    results.append({
                        'file': filepath,
                        'line': line_num,
                        'label': label_lower,
                        'usage_text': usage_text,
                        'context': context,
                    })

    return results


# ---------------------------------------------------------------------------
# Auto-fix
# ---------------------------------------------------------------------------


def fix_dead_refs(fern_root='fern'):
    """Find and fix dead references in-place."""
    results = find_dead_refs(fern_root)
    if not results:
        print('No dead references found!')
        return 0

    by_file = {}
    for r in results:
        by_file.setdefault(r['file'], []).append(r)

    fixed_count = 0
    for filepath, refs in by_file.items():
        try:
            with open(filepath, 'r', encoding='utf-8', errors='ignore') as fh:
                content = fh.read()
        except (OSError, IOError):
            continue

        for ref in refs:
            usage = ref['usage_text']
            # [display text][label] → display text
            m = RE_FULL_REF.search(usage)
            if m and m.group(0) == usage:
                content = content.replace(usage, m.group(1))
                fixed_count += 1
                continue
            # [label] → label
            m = RE_SHORT_REF.search(usage)
            if m and m.group(0) == usage:
                content = content.replace(usage, m.group(1))
                fixed_count += 1
                continue

        with open(filepath, 'w', encoding='utf-8', newline='') as fh:
            fh.write(content)

    print(f'Fixed {fixed_count} dead reference(s) across {len(by_file)} file(s).')
    return 0


# ---------------------------------------------------------------------------
# Main
# ---------------------------------------------------------------------------


def main():
    parser = argparse.ArgumentParser(
        description='Find dead reference-style link usages in MDX files.'
    )
    parser.add_argument(
        '--csv', metavar='FILE',
        help='Write results to a CSV file instead of stdout.'
    )
    parser.add_argument(
        '--fix', action='store_true',
        help='Auto-fix dead references by removing link syntax.'
    )
    args = parser.parse_args()

    if args.fix:
        sys.exit(fix_dead_refs())

    results = find_dead_refs()

    if not results:
        print('No dead references found!')
        sys.exit(0)

    if args.csv:
        with open(args.csv, 'w', newline='', encoding='utf-8') as fh:
            writer = csv.DictWriter(fh, fieldnames=['file', 'line', 'label', 'usage_text', 'context'])
            writer.writeheader()
            writer.writerows(results)
        print(f'Wrote {len(results)} dead reference(s) to {args.csv}')
    else:
        print(f'Found {len(results)} dead reference(s):\n')
        for r in results:
            print(f"  {r['file']}:{r['line']}: [{r['label']}]")
            print(f"    {r['context'][:120]}")
            print()

    sys.exit(1)


if __name__ == '__main__':
    main()
