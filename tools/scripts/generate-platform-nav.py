#!/usr/bin/env python3
"""
Generate platform.yml navigation from directory structure.
Skips files starting with _ (partials).
No external dependencies.
"""

import os
from pathlib import Path

PAGES_DIR = Path(__file__).parent.parent.parent / "fern" / "products" / "platform" / "pages"

def get_title_from_mdx(filepath):
    """Extract title from MDX frontmatter."""
    try:
        with open(filepath, 'r') as f:
            content = f.read()
            if content.startswith('---'):
                end = content.find('---', 3)
                if end != -1:
                    frontmatter = content[3:end]
                    for line in frontmatter.split('\n'):
                        if line.startswith('title:'):
                            title = line.split(':', 1)[1].strip().strip('"\'')
                            return title
    except:
        pass
    return Path(filepath).stem.replace('-', ' ').replace('_', ' ').title()

def yaml_str(s, indent=0):
    """Format string for YAML output."""
    if any(c in s for c in ':{}[]&*#?|-<>=!%@`'):
        return f'"{s}"'
    return s

def build_nav_tree(directory, rel_path="", indent=0):
    """Recursively build navigation tree as YAML string."""
    lines = []
    prefix = "  " * indent

    try:
        entries = sorted(os.listdir(directory))
    except:
        return lines

    mdx_files = [e for e in entries if e.endswith('.mdx') and not e.startswith('_')]
    subdirs = [e for e in entries if os.path.isdir(os.path.join(directory, e)) and not e.startswith('_')]

    # Handle index.mdx first
    if 'index.mdx' in mdx_files:
        mdx_files.remove('index.mdx')
        filepath = os.path.join(directory, 'index.mdx')
        title = get_title_from_mdx(filepath)
        rel_file = f"./pages/{rel_path}/index.mdx" if rel_path else "./pages/index.mdx"
        lines.append(f"{prefix}- page: {yaml_str(title)}")
        lines.append(f"{prefix}  path: {rel_file.replace('//', '/')}")

    # Other MDX files
    for f in mdx_files:
        filepath = os.path.join(directory, f)
        title = get_title_from_mdx(filepath)
        rel_file = f"./pages/{rel_path}/{f}" if rel_path else f"./pages/{f}"
        lines.append(f"{prefix}- page: {yaml_str(title)}")
        lines.append(f"{prefix}  path: {rel_file.replace('//', '/')}")

    # Subdirectories as sections
    for subdir in subdirs:
        subpath = os.path.join(directory, subdir)
        sub_rel = f"{rel_path}/{subdir}" if rel_path else subdir

        subdir_index = os.path.join(subpath, 'index.mdx')
        if os.path.exists(subdir_index):
            title = get_title_from_mdx(subdir_index)
        else:
            title = subdir.replace('-', ' ').replace('_', ' ').title()

        sub_lines = build_nav_tree(subpath, sub_rel, indent + 2)
        if sub_lines:
            lines.append(f"{prefix}- section: {yaml_str(title)}")
            lines.append(f"{prefix}  contents:")
            lines.extend(sub_lines)

    return lines

def main():
    tab_configs = [
        ('overview', 'Overview', 'fa-solid fa-house'),
        ('platform', 'Platform', 'fa-solid fa-gear'),
        ('calling', 'Calling', 'fa-solid fa-phone'),
        ('messaging', 'Messaging', 'fa-solid fa-message'),
        ('tools', 'Tools', 'fa-solid fa-wrench'),
    ]

    # Tabs section
    print("tabs:")
    for tab_dir, display_name, icon in tab_configs:
        tab_path = PAGES_DIR / tab_dir
        if tab_path.exists():
            print(f"  {tab_dir}:")
            print(f"    display-name: {display_name}")
            print(f"    icon: {icon}")

    print()
    print("navigation:")

    for tab_dir, display_name, icon in tab_configs:
        tab_path = PAGES_DIR / tab_dir
        if tab_path.exists():
            print(f"  - tab: {tab_dir}")
            print(f"    layout:")
            lines = build_nav_tree(str(tab_path), tab_dir, indent=3)
            for line in lines:
                print(line)

if __name__ == '__main__':
    main()
