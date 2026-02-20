#!/usr/bin/env python3
"""Collect current slugs from MDX frontmatter into a CSV.

Scans all .mdx files under fern/products/ and writes one row per page with
columns: id, title, product, version, version_slug, tab, slug, description,
file_path.

Version and tab are resolved by parsing docs.yml and each product's navigation
YAML — no hardcoded config needed.

Output: frontmatter-export.csv (or custom path via argv[1]).
"""

import csv
import sys
from pathlib import Path

import frontmatter
import yaml

SCRIPT_DIR = Path(__file__).resolve().parent
PROJECT_ROOT = SCRIPT_DIR.parent.parent
REPORTS_DIR = SCRIPT_DIR / "reports"
FERN_DIR = PROJECT_ROOT / "fern"
PRODUCTS_DIR = FERN_DIR / "products"
DOCS_YML = FERN_DIR / "docs.yml"

FIELDS = (
    "id", "title", "product", "version", "version_slug", "tab",
    "slug", "description", "file_path",
)


# ---------------------------------------------------------------------------
# docs.yml parsing
# ---------------------------------------------------------------------------

def parse_docs_yml():
    """Parse docs.yml.

    Returns:
        dir_to_slug:      {product_dir: product_url_slug}
        version_maps:     {product_dir: {version_dir: version_url_slug}}
        product_nav_ymls: {product_dir: [(nav_yml_path, version_dir | None)]}
    """
    data = yaml.safe_load(DOCS_YML.read_text())

    dir_to_slug = {}
    version_maps = {}
    product_nav_ymls = {}

    for product in data.get("products", []):
        if "path" not in product:
            continue  # href-only entries (Wirestarter, SWSH)

        main_path = product["path"]
        product_slug = product.get("slug", "")
        path_parts = main_path.split("/")
        # "products/swml/swml.yml" → "swml"; "products/apis.yml" → "apis"
        product_dir = path_parts[1] if len(path_parts) >= 3 else Path(path_parts[-1]).stem
        dir_to_slug[product_dir] = product_slug

        if "versions" in product:
            vm = {}
            navs = []
            for v in product["versions"]:
                v_path = v["path"]
                v_dir = Path(v_path).stem          # "latest", "v3", "v2"
                v_slug = v.get("slug", "")          # "" for latest
                vm[v_dir] = v_slug
                navs.append((FERN_DIR / v_path, v_dir))
            version_maps[product_dir] = vm
            product_nav_ymls[product_dir] = navs
        else:
            product_nav_ymls[product_dir] = [(FERN_DIR / main_path, None)]

    return dir_to_slug, version_maps, product_nav_ymls


# ---------------------------------------------------------------------------
# Nav YAML parsing — tab detection
# ---------------------------------------------------------------------------

def _collect_layout_paths(layout, yaml_dir, tab_slug, result):
    """Recursively walk a nav layout list, collecting {resolved_path: tab_slug}."""
    if not isinstance(layout, list):
        return
    for entry in layout:
        if not isinstance(entry, dict):
            continue
        # page: entry
        if "path" in entry:
            result[(yaml_dir / entry["path"]).resolve()] = tab_slug
        # folder: entry
        if "folder" in entry:
            folder = (yaml_dir / entry["folder"]).resolve()
            if folder.is_dir():
                for f in folder.rglob("*.mdx"):
                    result[f.resolve()] = tab_slug
        # section: with contents:
        if "contents" in entry:
            _collect_layout_paths(entry["contents"], yaml_dir, tab_slug, result)
        # variants: (realtime-sdk v2 uses tab-level variants)
        if "variants" in entry:
            for variant in entry["variants"]:
                if isinstance(variant, dict) and "layout" in variant:
                    _collect_layout_paths(variant["layout"], yaml_dir, tab_slug, result)


def build_tab_map(product_nav_ymls):
    """Build {resolved_abs_path: tab_url_slug} across all products."""
    result = {}

    for _product_dir, nav_entries in product_nav_ymls.items():
        for nav_yml, _version_dir in nav_entries:
            if not nav_yml.exists():
                continue

            data = yaml.safe_load(nav_yml.read_text())
            yaml_dir = nav_yml.parent

            # Tab key → URL slug mapping (tabs may override key via slug:)
            tab_slugs = {}
            for key, cfg in data.get("tabs", {}).items():
                tab_slugs[key] = cfg.get("slug", key) if isinstance(cfg, dict) else key

            # Landing page (outside any tab)
            lp = data.get("landing-page")
            if isinstance(lp, dict) and "path" in lp:
                result[(yaml_dir / lp["path"]).resolve()] = ""

            # Walk navigation entries
            for entry in data.get("navigation", []):
                if not isinstance(entry, dict):
                    continue
                if "tab" not in entry:
                    continue

                tab_key = entry["tab"]
                slug = tab_slugs.get(tab_key, tab_key)

                # Tab with direct layout:
                if "layout" in entry:
                    _collect_layout_paths(entry["layout"], yaml_dir, slug, result)
                # Tab with variants: (e.g., realtime-sdk v2)
                if "variants" in entry:
                    for variant in entry["variants"]:
                        if isinstance(variant, dict) and "layout" in variant:
                            _collect_layout_paths(variant["layout"], yaml_dir, slug, result)

    return result


# ---------------------------------------------------------------------------
# Version detection
# ---------------------------------------------------------------------------

def detect_version(rel_path, product_dir, version_maps):
    """Return (version_dir_name, version_url_slug) for a file path.

    For versioned products the path pattern is <product>/pages/<version_dir>/...
    For unversioned products returns ("", "").
    """
    if product_dir not in version_maps:
        return ("", "")
    parts = rel_path.split("/")
    if len(parts) >= 3 and parts[1] == "pages":
        candidate = parts[2]
        vm = version_maps[product_dir]
        if candidate in vm:
            return (candidate, vm[candidate])
    return ("", "")


# ---------------------------------------------------------------------------
# Main
# ---------------------------------------------------------------------------

def main():
<<<<<<< Updated upstream
    output_csv = sys.argv[1] if len(sys.argv) > 1 else str(REPORTS_DIR / "frontmatter-export.csv")
    dir_to_slug = build_dir_to_slug()
=======
    force = "--force" in sys.argv
    args = [a for a in sys.argv[1:] if a != "--force"]
    output_csv = args[0] if args else "frontmatter-export.csv"

    output_path = Path(output_csv)
    if output_path.exists() and not force:
        print(f"Error: {output_csv} already exists. Use --force to overwrite.")
        sys.exit(1)

    dir_to_slug, version_maps, product_nav_ymls = parse_docs_yml()
    tab_map = build_tab_map(product_nav_ymls)
>>>>>>> Stashed changes

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

        version, version_slug = detect_version(rel_path, product_dir, version_maps)
        tab = tab_map.get(mdx_path.resolve(), "")

        rows.append({
            "id": str(meta.get("id", "")),
            "title": str(meta.get("title", "")),
            "product": product,
            "version": version,
            "version_slug": version_slug,
            "tab": tab,
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
