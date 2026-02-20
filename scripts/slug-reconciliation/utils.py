"""Shared utilities for the slug reconciliation pipeline.

Consolidates duplicated logic: path/slug normalization, docs.yml parsing,
version extraction, file-path-to-slug derivation, tab detection, and URL
decomposition.
"""

import re
from dataclasses import dataclass
from pathlib import Path

import yaml

SCRIPT_DIR = Path(__file__).resolve().parent
PROJECT_ROOT = SCRIPT_DIR.parent.parent
FERN_DIR = PROJECT_ROOT / "fern"
PRODUCTS_DIR = FERN_DIR / "products"
DOCS_YML = FERN_DIR / "docs.yml"


# ---------------------------------------------------------------------------
# Path normalization
# ---------------------------------------------------------------------------

def normalize_path(p):
    """Forward-slash normalize, strip leading ./"""
    s = str(p).replace("\\", "/")
    if s.startswith("./"):
        s = s[2:]
    return s


# ---------------------------------------------------------------------------
# Slug normalization
# ---------------------------------------------------------------------------

def normalize_slug(s):
    """Lowercase, underscores->dashes, ensure leading /, strip trailing /."""
    if not s:
        return ""
    s = s.strip().replace("_", "-").lower()
    if not s.startswith("/"):
        s = "/" + s
    if s != "/" and s.endswith("/"):
        s = s.rstrip("/")
    return s


def segments(slug):
    """Split slug into non-empty path segments."""
    return [p for p in slug.split("/") if p]


# ---------------------------------------------------------------------------
# YAML parsing (replaces all regex parsing of docs.yml)
# ---------------------------------------------------------------------------

_docs_config_cache = None


def parse_docs_config(docs_yml_path=None):
    """Parse docs.yml with yaml.safe_load(). Returns list of product dicts.

    Each has: display_name, slug, path, versions (list of {display_name, slug, path}),
    href (if link-only product).
    """
    global _docs_config_cache
    if _docs_config_cache is not None:
        return _docs_config_cache

    if docs_yml_path is None:
        docs_yml_path = DOCS_YML

    raw = Path(docs_yml_path).read_text(encoding="utf-8")
    data = yaml.safe_load(raw)

    products = []
    for p in data.get("products", []):
        product = {
            "display_name": p.get("display-name", ""),
            "slug": p.get("slug", ""),
            "path": p.get("path", ""),
            "versions": [],
            "href": p.get("href", ""),
        }
        for v in p.get("versions", []):
            product["versions"].append({
                "display_name": v.get("display-name", ""),
                "slug": v.get("slug", ""),
                "path": v.get("path", ""),
                "availability": v.get("availability", ""),
            })
        products.append(product)

    _docs_config_cache = products
    return products


_product_slug_map_cache = None


def build_product_slug_map(docs_yml_path=None):
    """Returns dict: fern_directory_name -> product_url_slug.

    e.g. 'swml' -> 'swml', 'compatibility-api' -> 'compatibility-api'
    Replaces regex-based build_dir_to_slug() and parse_product_slugs().
    """
    global _product_slug_map_cache
    if _product_slug_map_cache is not None:
        return _product_slug_map_cache

    products = parse_docs_config(docs_yml_path)
    mapping = {}
    for p in products:
        path_str = p["path"]
        if not path_str:
            continue
        # Extract directory name from path like "products/swml/swml.yml"
        # or "products/realtime-sdk/versions/latest.yml"
        # Skip paths like "products/apis.yml" (no subdirectory)
        parts = path_str.replace("\\", "/").split("/")
        if len(parts) >= 3 and parts[0] == "products":
            dirname = parts[1]
            slug = p["slug"].strip("/")
            if dirname not in mapping:
                mapping[dirname] = slug

    _product_slug_map_cache = mapping
    return mapping


# ---------------------------------------------------------------------------
# Tab detection
# ---------------------------------------------------------------------------

_tab_cache = {}


def parse_product_tabs(product_yml_path):
    """Parse a product YAML file to get tab definitions.

    Returns dict: tab_key -> {'display_name': str, 'slug': str}
    The 'slug' is the explicit slug override if present, otherwise the tab key itself.
    """
    path_str = str(product_yml_path)
    if path_str in _tab_cache:
        return _tab_cache[path_str]

    data = yaml.safe_load(Path(product_yml_path).read_text(encoding="utf-8"))
    tabs = {}
    for key, val in (data.get("tabs") or {}).items():
        tabs[key] = {
            "display_name": val.get("display-name", key),
            "slug": val.get("slug", key),
        }

    _tab_cache[path_str] = tabs
    return tabs


def _resolve_yml_path(product_dir_name):
    """Find the product YAML file for a given product directory name.

    Handles both direct YML (swml/swml.yml) and versioned (browser-sdk/versions/latest.yml).
    """
    # Try direct product yml first
    direct = PRODUCTS_DIR / product_dir_name / f"{product_dir_name}.yml"
    if direct.exists():
        return direct
    # Try versions/latest.yml
    versioned = PRODUCTS_DIR / product_dir_name / "versions" / "latest.yml"
    if versioned.exists():
        return versioned
    return None


def _walk_layout_paths(layout, base_dir):
    """Walk a YAML navigation layout tree and yield all referenced file paths
    (normalized relative to products/).

    Handles: page path, folder, section contents (recursive).
    """
    if not layout:
        return
    for item in layout:
        if isinstance(item, dict):
            # page with path
            if "path" in item:
                raw_path = item["path"]
                resolved = (base_dir / raw_path).resolve()
                try:
                    yield normalize_path(resolved.relative_to(PRODUCTS_DIR))
                except ValueError:
                    pass
            # folder
            if "folder" in item:
                folder_raw = item["folder"]
                resolved = (base_dir / folder_raw).resolve()
                try:
                    yield normalize_path(resolved.relative_to(PRODUCTS_DIR))
                except ValueError:
                    pass
            # section with contents
            if "contents" in item:
                yield from _walk_layout_paths(item["contents"], base_dir)
            # nested layout
            if "layout" in item:
                yield from _walk_layout_paths(item["layout"], base_dir)


def detect_tab_for_file(product_dir_name, file_path):
    """Given a product directory name and a file path (relative to products/),
    determine which tab it belongs to.

    Returns tab key string (e.g. 'reference', 'guides', 'cxml') or ''.
    """
    yml_path = _resolve_yml_path(product_dir_name)
    if yml_path is None:
        return ""

    data = yaml.safe_load(yml_path.read_text(encoding="utf-8"))
    navigation = data.get("navigation", [])
    base_dir = yml_path.parent

    norm_fp = normalize_path(file_path)

    for nav_item in navigation:
        if not isinstance(nav_item, dict) or "tab" not in nav_item:
            continue
        tab_key = nav_item["tab"]
        layout = nav_item.get("layout", [])

        for ref_path in _walk_layout_paths(layout, base_dir):
            # Check if file_path starts with or matches a referenced path
            if norm_fp == ref_path or norm_fp.startswith(ref_path + "/"):
                return tab_key
            # For page paths that point to a specific file
            if ref_path.endswith(".mdx") or ref_path.endswith(".md"):
                if norm_fp == ref_path:
                    return tab_key

    return ""


def tab_url_slug(product_dir_name, tab_key):
    """Get the URL slug for a tab. Uses explicit slug: override if present,
    otherwise uses the tab key itself.

    e.g. tab 'rest-api' with slug: 'rest' -> 'rest'
         tab 'reference' (no override) -> 'reference'
    """
    if not tab_key:
        return ""
    yml_path = _resolve_yml_path(product_dir_name)
    if yml_path is None:
        return tab_key
    tabs = parse_product_tabs(yml_path)
    tab_info = tabs.get(tab_key)
    if tab_info:
        return tab_info["slug"]
    return tab_key


# ---------------------------------------------------------------------------
# Version extraction
# ---------------------------------------------------------------------------

VERSION_RE = re.compile(r"^[^/]+/pages/(latest|v\d+)/")


def extract_version(file_path):
    """Extract version from file path. Returns 'latest', 'v2', 'v3', etc. or '' for unversioned."""
    fp = normalize_path(file_path)
    m = VERSION_RE.match(fp)
    return m.group(1) if m else ""


VERSIONED_PRODUCTS = {"realtime-sdk", "browser-sdk"}


def version_url_slug(product, file_path):
    """Returns version string for URL (e.g. 'v2') or '' if latest/unversioned."""
    ver = extract_version(file_path)
    if ver and ver != "latest":
        return ver
    return ""


# ---------------------------------------------------------------------------
# File-path-to-slug
# ---------------------------------------------------------------------------

def slug_from_filepath(file_path):
    """Derive page slug from file path, stripping product/pages/version prefixes.

    e.g. 'call-flow-builder/pages/core/version.mdx' -> '/core/version'
         'browser-sdk/pages/latest/reference/chat/index.mdx' -> '/reference/chat'

    Single implementation replacing 4 scattered versions.
    """
    fp = normalize_path(file_path)
    parts = segments(fp)

    # Strip: <product>/pages/
    if len(parts) >= 2 and parts[1] == "pages":
        parts = parts[2:]
    else:
        return "/"

    # Strip version directory (latest, v2, v3, etc.)
    if parts and re.match(r"^(latest|v\d+)$", parts[0]):
        parts = parts[1:]

    # Strip index.mdx -> use parent dir name
    if parts and parts[-1] in ("index.mdx", "index.md"):
        parts = parts[:-1]
    elif parts:
        # Strip .mdx/.md extension from last segment
        parts[-1] = re.sub(r"\.mdx?$", "", parts[-1])

    return "/" + "/".join(parts) if parts else "/"


# ---------------------------------------------------------------------------
# URL decomposition
# ---------------------------------------------------------------------------

@dataclass
class DecomposedUrl:
    product_slug: str    # e.g. 'swml', 'compatibility-api'
    version_slug: str    # e.g. 'v2' or '' for latest
    tab_slug: str        # e.g. 'reference', 'guides', 'rest', 'cxml' or ''
    page_slug: str       # e.g. '/methods/ai' — the part that goes in frontmatter
    full_url: str        # e.g. '/swml/reference/methods/ai' — for redirects


def decompose_url(product, page_slug, file_path, product_yml_dir=None):
    """Build a DecomposedUrl from product + page slug + file path.

    Determines tab by walking the product YAML navigation.
    Determines version from file path.
    Builds full_url as: /<product>[/<version>][/<tab>]/<page_slug>

    Args:
        product: fern directory name (e.g. 'swml')
        page_slug: the page-level slug (from frontmatter or file path)
        file_path: fern file path relative to products/ (e.g. 'swml/pages/reference/methods/ai.mdx')
        product_yml_dir: unused, kept for API compat (we resolve YML from product name)
    """
    product_slugs = build_product_slug_map()
    prod_slug = product_slugs.get(product, product)

    ver_slug = version_url_slug(product, file_path) if file_path else ""

    # Detect tab from navigation YAML
    tab_key = detect_tab_for_file(product, file_path) if file_path else ""
    t_slug = tab_url_slug(product, tab_key) if tab_key else ""

    # Normalize page_slug
    ps = normalize_slug(page_slug) if page_slug else "/"

    # Build full URL: /<product>[/<version>][/<tab>]/<page_slug>
    url_parts = []
    if prod_slug:
        url_parts.append(prod_slug)
    if ver_slug:
        url_parts.append(ver_slug)
    if t_slug:
        url_parts.append(t_slug)

    if ps and ps != "/":
        # Strip leading slash from page_slug before appending
        url_parts.append(ps.lstrip("/"))

    full = "/" + "/".join(url_parts) if url_parts else "/"

    return DecomposedUrl(
        product_slug=prod_slug,
        version_slug=ver_slug,
        tab_slug=t_slug,
        page_slug=ps,
        full_url=full,
    )


# ---------------------------------------------------------------------------
# Old site prefix mapping
# ---------------------------------------------------------------------------

PRODUCT_TO_OLD_PREFIX = {
    "agents-sdk": "/sdks/agents-sdk",
    "browser-sdk": "/sdks/browser-sdk",
    "realtime-sdk": "/sdks/realtime-sdk",
    "swml": "/swml",
    "call-flow-builder": "/call-flow-builder",
    "platform": "",
    "compatibility-api": "",
    "home": "",
    "/": "",
    "apis": "",
}
