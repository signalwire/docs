#!/usr/bin/env python3
"""Match unmatched old URLs to Fern pages using content similarity.

For old URLs that weren't matched in the reconciliation step, this script:
1. Locates the original Docusaurus source file in temp/docs/website/docs/
2. Compares body content against Fern MDX pages using difflib.SequenceMatcher
3. Categorizes as: slug_changed, likely_deleted, already_mapped, or uncertain

Old Docusaurus routing:
  Plugin             | routeBasePath        | Source directory
  main (preset)      | /                    | docs/main/
  agents-sdk-manual  | /sdks/agents-sdk     | docs/agents-sdk/
  browser-sdk        | /sdks/browser-sdk    | docs/browser-sdk/
  realtime-sdk       | /sdks/realtime-sdk   | docs/realtime-sdk/
"""

import csv
import multiprocessing
import re
import sys
from difflib import SequenceMatcher
from pathlib import Path

SCRIPT_DIR = Path(__file__).resolve().parent
PROJECT_ROOT = SCRIPT_DIR.parent.parent
REPORTS_DIR = SCRIPT_DIR / "reports"
OLD_DOCS_DIR = PROJECT_ROOT / "temp" / "docs" / "website" / "docs"
OLD_WEBSITE_DIR = PROJECT_ROOT / "temp" / "docs" / "website"
FERN_PRODUCTS_DIR = PROJECT_ROOT / "fern" / "products"

# Compat SDK: Fern methods directory for direct filesystem matching
COMPAT_SDK_FERN_METHODS = FERN_PRODUCTS_DIR / "compatibility-api" / "pages" / "sdks" / "methods"

# Old URL prefixes that map to compat SDK methods.
# Order matters: most specific first.
_COMPAT_SDK_URL_PREFIXES = [
    "/compatibility-api/client-sdks/api/",   # e.g. .../api/available-phone-numbers/find-toll-free
    "/compatibility-api/client-sdks/methods/",  # e.g. .../methods/calls/delete
    "/compatibility-api/client-sdks/",       # e.g. .../applications/create
]

# Regex to detect versioned URL segments: /v2/, /v3/, etc.
_URL_VERSION_RE = re.compile(r"^/(v\d+)(/.*)?$")

# Old site routing: URL prefix -> source directory under docs/
ROUTE_MAP = [
    # SDK plugins (check these first — more specific prefixes)
    ("/sdks/agents-sdk", "agents-sdk", "/sdks/agents-sdk"),
    ("/sdks/browser-sdk", "browser-sdk", "/sdks/browser-sdk"),
    ("/sdks/realtime-sdk", "realtime-sdk", "/sdks/realtime-sdk"),
    # Main plugin — content directories
    ("/swml", "main/swml", ""),
    ("/call-flow-builder", "main/call-flow-builder", ""),
    ("/compatibility-api", "main/compatibility-api", ""),
    ("/cantina", "main/cantina", ""),
    ("/home", "main/home", ""),
    ("/rest", "main/rest", ""),
    ("/events", "main/events", ""),
    # Catch-all for main plugin
    ("/", "main", ""),
]

# Map old URL prefix -> Fern product directory for candidate matching
OLD_PREFIX_TO_FERN_PRODUCT = {
    "/sdks/agents-sdk": "agents-sdk",
    "/sdks/browser-sdk": "browser-sdk",
    "/sdks/realtime-sdk": "realtime-sdk",
    "/swml": "swml",
    "/call-flow-builder": "call-flow-builder",
    "/compatibility-api": "compatibility-api",
    "/cantina": None,  # No direct Fern equivalent
    "/home": "home",
    "/rest": None,  # Reorganized into apis or other products
    "/events": None,
    "/ai": "platform",  # AI content moved to platform
    "/guides": "platform",  # General guides moved to platform
    "/dashboard": "platform",
    "/platform": "platform",
}

# Confidence thresholds
HIGH_CONFIDENCE = 0.7
LOW_CONFIDENCE = 0.3


def strip_frontmatter(text):
    """Remove YAML frontmatter from MDX content, return body only."""
    if text.startswith("---"):
        end = text.find("\n---", 3)
        if end != -1:
            return text[end + 4:].strip()
    return text.strip()


def read_mdx_body(filepath):
    """Read an MDX file and return the body text (without frontmatter)."""
    try:
        raw = filepath.read_bytes()
        # Strip BOM
        if raw.startswith(b"\xef\xbb\xbf"):
            raw = raw[3:]
        text = raw.decode("utf-8", errors="replace")
        return strip_frontmatter(text)
    except (OSError, UnicodeDecodeError):
        return ""


def read_frontmatter_slug(filepath):
    """Read frontmatter slug from an MDX file."""
    try:
        raw = filepath.read_bytes()
        if raw.startswith(b"\xef\xbb\xbf"):
            raw = raw[3:]
        text = raw.decode("utf-8", errors="replace")
        if not text.startswith("---"):
            return None
        end = text.find("\n---", 3)
        if end == -1:
            return None
        fm_text = text[3:end]
        # Simple YAML slug extraction
        for line in fm_text.splitlines():
            m = re.match(r"^slug:\s+(.*)", line)
            if m:
                return m.group(1).strip().strip('"').strip("'")
        return None
    except (OSError, UnicodeDecodeError):
        return None


def derive_url_from_filepath(filepath, docs_subdir, route_base_path):
    """Derive Docusaurus URL from file path (no slug frontmatter case).

    Docusaurus rules:
      - Strip .md/.mdx extension
      - index.mdx -> parent directory path
      - Path relative to plugin docs directory
      - Prepend routeBasePath
    """
    # Get path relative to the docs subdirectory
    docs_dir = OLD_DOCS_DIR / docs_subdir
    try:
        rel = filepath.relative_to(docs_dir)
    except ValueError:
        return None

    parts = list(rel.parts)
    if not parts:
        return route_base_path or "/"

    # Strip extension from last part
    last = parts[-1]
    if last.endswith(".mdx"):
        last = last[:-4]
    elif last.endswith(".md"):
        last = last[:-3]

    # index -> use parent directory
    if last == "index":
        parts = parts[:-1]
    else:
        parts[-1] = last

    slug_path = "/".join(parts)
    if route_base_path and route_base_path != "/":
        return f"{route_base_path}/{slug_path}" if slug_path else route_base_path
    return f"/{slug_path}" if slug_path else "/"


def _resolve_search_dir(docs_subdir, url_remainder):
    """Resolve the search directory and remainder for versioned/unversioned URLs.

    Docusaurus stores versioned docs in separate directories:
      docs/<plugin>/           -> latest version
      <plugin>_versioned_docs/version-<v>/  -> older versions

    For a URL like /sdks/realtime-sdk/v2/language/dotnet/...:
      url_remainder = "/v2/language/dotnet/..."
      -> search in realtime-sdk_versioned_docs/version-v2/
      -> remainder = "language/dotnet/..."

    Returns (search_dir, remainder_without_version, version_or_none).
    """
    vm = _URL_VERSION_RE.match(url_remainder)
    if vm:
        version = vm.group(1)  # e.g. "v2"
        # SDK products use <product>_versioned_docs/version-<v>/
        product_name = docs_subdir  # e.g. "realtime-sdk", "browser-sdk"
        versioned_dir = OLD_WEBSITE_DIR / f"{product_name}_versioned_docs" / f"version-{version}"
        if versioned_dir.exists():
            new_remainder = vm.group(2) or ""  # the path after /v2
            return versioned_dir, new_remainder, version

    # Default: latest version in docs/<subdir>
    return OLD_DOCS_DIR / docs_subdir, url_remainder, None


def _search_dir_for_file(search_dir, url_remainder, route_base_path, old_url, version=None):
    """Search a directory for the source file matching an old URL.

    Tries frontmatter slug scanning, then reverse-engineers from path.
    """
    if not search_dir.exists():
        return None

    # Build the expected full URL prefix for frontmatter slug matching
    # For versioned URLs: route_base_path + /v2 + slug
    version_prefix = f"/{version}" if version else ""

    # Strategy 1: Scan for matching frontmatter slug
    for ext_glob in ("*.mdx", "*.md"):
        for path in search_dir.rglob(ext_glob):
            slug = read_frontmatter_slug(path)
            if not slug:
                continue
            if route_base_path and route_base_path != "/":
                full_url = route_base_path + version_prefix + (slug if slug.startswith("/") else "/" + slug)
            else:
                full_url = version_prefix + (slug if slug.startswith("/") else "/" + slug)
            full_url = full_url.rstrip("/") or "/"
            if full_url.lower() == old_url.lower():
                return path

    # Strategy 2: Reverse-engineer file path from URL remainder
    if not url_remainder or url_remainder == "/":
        for ext in (".mdx", ".md"):
            candidate = search_dir / f"index{ext}"
            if candidate.exists():
                return candidate
    else:
        remainder = url_remainder.lstrip("/")
        for ext in (".mdx", ".md"):
            candidate = search_dir / f"{remainder}{ext}"
            if candidate.exists():
                return candidate
            candidate = search_dir / remainder / f"index{ext}"
            if candidate.exists():
                return candidate

        # Try with underscores instead of dashes
        remainder_us = remainder.replace("-", "_")
        if remainder_us != remainder:
            for ext in (".mdx", ".md"):
                candidate = search_dir / f"{remainder_us}{ext}"
                if candidate.exists():
                    return candidate
                candidate = search_dir / remainder_us / f"index{ext}"
                if candidate.exists():
                    return candidate

    return None


def find_old_source_file(old_url):
    """Locate the Docusaurus source file for an old URL.

    Handles both latest (docs/<plugin>/) and versioned
    (<plugin>_versioned_docs/version-<v>/) directories.
    """
    # Determine which docs subdirectory to search
    docs_subdir = None
    route_base_path = ""
    url_remainder = old_url

    for prefix, subdir, base_path in ROUTE_MAP:
        if prefix == "/" or old_url.startswith(prefix + "/") or old_url == prefix:
            docs_subdir = subdir
            route_base_path = base_path
            if prefix != "/":
                url_remainder = old_url[len(prefix):]
            break

    if docs_subdir is None:
        return None, None

    # For SDK products, check if URL has a version segment (e.g. /v2/...)
    search_dir, search_remainder, version = _resolve_search_dir(docs_subdir, url_remainder)

    result = _search_dir_for_file(search_dir, search_remainder, route_base_path, old_url, version)
    if result:
        return result, docs_subdir

    # Fallback: if versioned search failed, also try the main docs dir
    if version:
        fallback_dir = OLD_DOCS_DIR / docs_subdir
        if fallback_dir.exists() and fallback_dir != search_dir:
            result = _search_dir_for_file(fallback_dir, url_remainder, route_base_path, old_url)
            if result:
                return result, docs_subdir

    return None, docs_subdir


def guess_fern_product(old_url):
    """Guess which Fern product directory to search based on old URL prefix."""
    for prefix, product in sorted(OLD_PREFIX_TO_FERN_PRODUCT.items(),
                                   key=lambda x: -len(x[0])):
        if old_url.startswith(prefix + "/") or old_url == prefix:
            return product

    # Default: search all products
    return None



def filename_similarity(old_url, fern_path):
    """Compute filename-based similarity score (0-1)."""
    old_name = old_url.rstrip("/").split("/")[-1].lower().replace("_", "-")
    fern_name = fern_path.stem.lower().replace("_", "-")
    if fern_name == "index":
        # Use parent dir name for index files
        fern_name = fern_path.parent.name.lower().replace("_", "-")
    if old_name == fern_name:
        return 1.0
    if old_name in fern_name or fern_name in old_name:
        return 0.5
    return SequenceMatcher(None, old_name, fern_name).ratio()


_WORD_RE = re.compile(r"[a-zA-Z_]\w{2,}")


def _tokenize(text):
    """Extract a set of lowercase word tokens (3+ chars) for cheap overlap check."""
    return set(_WORD_RE.findall(text.lower()))


def preload_fern_bodies():
    """Pre-read all Fern MDX file bodies into memory, grouped by product.

    Each entry is (path, body_text, token_set, body_len).
    """
    bodies = {}  # product -> [entry, ...]
    all_bodies = []

    for mdx_path in sorted(FERN_PRODUCTS_DIR.rglob("*.mdx")):
        body = read_mdx_body(mdx_path)
        if not body or len(body) < 20:
            continue

        rel = mdx_path.relative_to(FERN_PRODUCTS_DIR)
        product = rel.parts[0] if rel.parts else ""

        entry = (mdx_path, body, _tokenize(body), len(body))
        if product not in bodies:
            bodies[product] = []
        bodies[product].append(entry)
        all_bodies.append(entry)

    return bodies, all_bodies


def load_proposals_slugs(proposals_csv):
    """Load all known slugs from slug-proposals.csv for pre-check.

    Returns:
        known_slugs: set of reconstructed old URLs
        rows_by_slug: old_url -> CSV row
        new_slug_by_file: file_path -> (current_slug, new_slug) for reporting
    """
    slugs = set()
    rows_by_slug = {}
    new_slug_by_file = {}
    try:
        with open(proposals_csv, newline="") as f:
            for row in csv.DictReader(f):
                product = row["product"]
                slug = row["slug"].strip().lower()
                if not slug.startswith("/"):
                    slug = "/" + slug
                # Store the full reconstructed old URLs
                # (same logic as reconcile-slugs.py)
                if product in ("agents-sdk", "browser-sdk", "realtime-sdk"):
                    full = f"/sdks/{product}{slug}"
                elif product in ("swml", "call-flow-builder"):
                    full = f"/{product}{slug}"
                else:
                    full = slug
                full = full.rstrip("/") or "/"
                slugs.add(full.lower())
                rows_by_slug[full.lower()] = row
                # Map file_path -> (current_slug, new_slug) for enriching match results
                if row.get("file_path"):
                    new_slug_by_file[row["file_path"]] = (
                        row.get("slug", ""),
                        row.get("new_slug", ""),
                    )
    except FileNotFoundError:
        pass
    return slugs, rows_by_slug, new_slug_by_file


def score_candidates(old_url, old_body, fern_entries, threshold=LOW_CONFIDENCE):
    """Score Fern candidates against an old page's body text.

    Uses three levels of increasingly expensive filtering:
      1. Length ratio  (O(1))         — skip if lengths are too different
      2. Token overlap (O(n) set ops) — skip if too few shared words
      3. quick_ratio() (cheaper)      — upper bound on similarity
      4. ratio()       (O(n*m))       — full SequenceMatcher

    fern_entries: list of (path, body_text, token_set, body_len) tuples.
    Returns sorted list of (composite, body_sim, fname_sim, path).
    """
    old_len = len(old_body)
    old_tokens = _tokenize(old_body)
    scores = []

    for fern_path, fern_body, fern_tokens, fern_len in fern_entries:
        # Filter 1: Length ratio — if one is 5x longer, similarity < 0.33
        if fern_len == 0:
            continue
        length_ratio = min(old_len, fern_len) / max(old_len, fern_len)
        if length_ratio < 0.15:
            continue

        # Filter 2: Token overlap — cheap set intersection
        if old_tokens and fern_tokens:
            shared = len(old_tokens & fern_tokens)
            total = len(old_tokens | fern_tokens)
            jaccard = shared / total if total else 0
            if jaccard < 0.05:
                continue

        # Filter 3: quick_ratio() upper bound (avoids full O(n*m))
        sm = SequenceMatcher(None, old_body, fern_body)
        if sm.real_quick_ratio() < threshold * 0.8:
            continue
        if sm.quick_ratio() < threshold * 0.8:
            continue

        # Filter 4: Full ratio
        body_sim = sm.ratio()
        if body_sim >= 0.1:
            fname_sim = filename_similarity(old_url, fern_path)
            composite = body_sim * 0.8 + fname_sim * 0.2
            scores.append((composite, body_sim, fname_sim, fern_path))

    scores.sort(key=lambda x: -x[0])
    return scores


_COMPAT_SDK_OVERVIEW = FERN_PRODUCTS_DIR / "compatibility-api" / "pages" / "sdks"

# Explicit mappings for compat SDK overview/index pages
_COMPAT_SDK_EXACT = {
    "/compatibility-api/sdks": _COMPAT_SDK_OVERVIEW / "core" / "overview.mdx",
    "/compatibility-api/api-reference/rest-client-sdks/methods": COMPAT_SDK_FERN_METHODS / "overview.mdx",
}


def _match_compat_sdk(old_url):
    """Try to match a compat SDK old URL to a Fern file by directory structure.

    Old URLs use varied prefixes (client-sdks/methods/, client-sdks/api/,
    client-sdks/) but the Fern files all live under sdks/methods/<group>/<op>.mdx
    with identical filenames. Match by extracting <group>/<op> from the old URL
    and looking for it in the Fern methods tree.

    Returns (fern_path, fern_slug, match_method) or None.
    """
    # Check exact URL matches first (overview pages)
    exact = _COMPAT_SDK_EXACT.get(old_url)
    if exact and exact.exists():
        fern_slug = read_frontmatter_slug(exact) or ""
        rel = str(exact.relative_to(FERN_PRODUCTS_DIR))
        return rel, fern_slug, "compat_sdk_exact"

    tail = None
    for prefix in _COMPAT_SDK_URL_PREFIXES:
        if old_url.startswith(prefix):
            tail = old_url[len(prefix):]
            break
    if tail is None:
        return None

    # tail is e.g. "calls/delete", "available-phone-numbers/find-toll-free",
    # or a bare group name like "calls"
    parts = tail.strip("/").split("/")
    if not parts or not parts[0]:
        return None

    # Try direct file match: <group>/<op>.mdx
    if len(parts) >= 2:
        group, op = parts[0], parts[1]
        for ext in (".mdx", ".md"):
            candidate = COMPAT_SDK_FERN_METHODS / group / f"{op}{ext}"
            if candidate.exists():
                fern_slug = read_frontmatter_slug(candidate) or ""
                rel = str(candidate.relative_to(FERN_PRODUCTS_DIR))
                return rel, fern_slug, "compat_sdk_filename"

    # Group index page: <group> -> <group>/index.mdx
    if len(parts) == 1:
        group = parts[0]
        for ext in (".mdx", ".md"):
            candidate = COMPAT_SDK_FERN_METHODS / group / f"index{ext}"
            if candidate.exists():
                fern_slug = read_frontmatter_slug(candidate) or ""
                rel = str(candidate.relative_to(FERN_PRODUCTS_DIR))
                return rel, fern_slug, "compat_sdk_index"

    # Fallback: scan Fern methods for matching frontmatter title
    old_title = parts[-1].replace("-", " ").title()
    for mdx_path in COMPAT_SDK_FERN_METHODS.rglob("*.mdx"):
        fm_slug = read_frontmatter_slug(mdx_path)
        # Quick title check from frontmatter
        try:
            raw = mdx_path.read_bytes()
            if raw.startswith(b"\xef\xbb\xbf"):
                raw = raw[3:]
            text = raw.decode("utf-8", errors="replace")
            if text.startswith("---"):
                end = text.find("\n---", 3)
                if end != -1:
                    fm_block = text[3:end]
                    for line in fm_block.splitlines():
                        m = re.match(r"^title:\s+(.*)", line)
                        if m:
                            title = m.group(1).strip().strip('"').strip("'")
                            if title.lower() == old_title.lower():
                                rel = str(mdx_path.relative_to(FERN_PRODUCTS_DIR))
                                return rel, fm_slug or "", "compat_sdk_title"
        except (OSError, UnicodeDecodeError):
            continue

    return None


def classify_known_url(url):
    """Classify URL into a known non-doc category, or return None.

    Only classifies URLs that are definitively NOT doc pages (Docusaurus
    chrome like category listings, tag pages, etc.). Does NOT classify
    /rest/ as autogen — those go through normal source-file lookup, which
    correctly finds the ~20 real MDX files and returns no_source for the
    ~400 OpenAPI-generated endpoint pages.
    """
    # Docusaurus-generated listing/category pages
    if url.startswith("/page/") or url.startswith("/pages/") or url in ("/page", "/pages"):
        return "known_deleted"
    # Tag listing pages (autogen by Docusaurus)
    if url.startswith("/tags/") or url == "/tags":
        return "autogen"
    # Known-deleted sections — content not migrated to Fern
    if url.startswith("/compatibility-api/guides"):
        return "known_deleted"
    if url.startswith("/internal") or url == "/internal":
        return "known_deleted"
    if url.startswith("/blog") or url == "/blog":
        return "known_deleted"
    return None


def _classify_url(old_url, known_slugs):
    """Classify a single URL through the cheap pre-checks (no content matching).

    Returns (result_dict, needs_content_match, old_body, product_hint).
    If needs_content_match is False, result_dict is complete.
    """
    result = {
        "old_url": old_url,
        "match_type": "",
        "matched_fern_file": "",
        "matched_slug": "",
        "new_slug": "",
        "confidence": "",
        "match_method": "",
        "notes": "",
    }

    # Fast path: non-doc pages and known-deleted sections
    known_type = classify_known_url(old_url)
    if known_type == "known_deleted":
        result["match_type"] = "known_deleted"
        result["notes"] = "Section not migrated to Fern"
        return result, False, None, None

    # Fast path: compat SDK docs — match by directory structure / filename
    if (old_url.startswith("/compatibility-api/client-sdks")
            or old_url in _COMPAT_SDK_EXACT):
        match = _match_compat_sdk(old_url)
        if match:
            rel_path, fern_slug, method = match
            result["match_type"] = "slug_changed"
            result["matched_fern_file"] = rel_path
            result["matched_slug"] = fern_slug
            result["confidence"] = "1.000"
            result["match_method"] = method
            result["notes"] = "Matched via compat SDK directory structure"
            return result, False, None, None

    # Find old source file
    source_file, docs_subdir = find_old_source_file(old_url)
    if source_file is None:
        if old_url.startswith("/rest/") or old_url == "/rest":
            result["match_type"] = "autogen"
            result["notes"] = "OpenAPI-generated endpoint (no MDX source in docs/main/rest/)"
        else:
            result["match_type"] = "no_source"
            result["notes"] = f"No source file found in {docs_subdir or 'any'} docs dir"
        return result, False, None, None

    # Already-mapped pre-check
    fm_slug = read_frontmatter_slug(source_file)
    if fm_slug:
        for _prefix, subdir, base_path in ROUTE_MAP:
            if docs_subdir and subdir == docs_subdir:
                if base_path and base_path != "/":
                    derived = base_path + (fm_slug if fm_slug.startswith("/") else "/" + fm_slug)
                else:
                    derived = fm_slug if fm_slug.startswith("/") else "/" + fm_slug
                derived = derived.rstrip("/").lower() or "/"
                if derived != old_url.lower() and derived in known_slugs:
                    result["match_type"] = "already_mapped"
                    result["notes"] = f"Source file has slug '{fm_slug}' -> mapped as {derived}"
                    return result, False, None, None
                break

    # Read body for content matching
    old_body = read_mdx_body(source_file)
    if not old_body:
        result["match_type"] = "likely_deleted"
        result["notes"] = "Source file has no body content"
        return result, False, None, None

    product_hint = guess_fern_product(old_url)
    return result, True, old_body, product_hint


# Worker function for multiprocessing — must be top-level for pickling
def _match_worker(args):
    """Content-match a single old page against Fern candidates.

    args: (old_url, old_body, fern_entries_serialized, new_slug_by_file)
    fern_entries_serialized: list of (path_str, body, tokens, body_len)
    new_slug_by_file: dict mapping Fern file_path -> (current_slug, new_slug)
    Returns result dict.
    """
    old_url, old_body, fern_entries_ser, new_slug_map = args

    # Reconstruct Path objects
    fern_entries = [(Path(p), body, tokens, blen)
                    for p, body, tokens, blen in fern_entries_ser]

    scores = score_candidates(old_url, old_body, fern_entries)

    result = {
        "old_url": old_url,
        "match_type": "",
        "matched_fern_file": "",
        "matched_slug": "",
        "new_slug": "",
        "confidence": "",
        "match_method": "",
        "notes": "",
    }

    def _fill_match(match_type, best):
        rel_path = str(best[3].relative_to(FERN_PRODUCTS_DIR)).replace("\\", "/")
        fern_slug = read_frontmatter_slug(best[3]) or ""
        result["match_type"] = match_type
        result["matched_fern_file"] = rel_path
        result["matched_slug"] = fern_slug or new_slug_map.get(rel_path, ("", ""))[0]
        result["new_slug"] = new_slug_map.get(rel_path, ("", ""))[1]
        result["confidence"] = f"{best[0]:.3f}"
        result["match_method"] = f"body={best[1]:.3f} fname={best[2]:.3f}"

    if scores and scores[0][0] >= HIGH_CONFIDENCE:
        _fill_match("slug_changed", scores[0])
    elif scores and scores[0][0] >= LOW_CONFIDENCE:
        _fill_match("uncertain", scores[0])
    else:
        result["match_type"] = "likely_deleted"
        result["confidence"] = f"{scores[0][0]:.3f}" if scores else "0"
        result["notes"] = "No Fern page above similarity threshold"

    return result


def main():
    unmatched_csv = sys.argv[1] if len(sys.argv) > 1 else str(REPORTS_DIR / "slug-reconciliation-unmatched.csv")
    proposals_csv = sys.argv[2] if len(sys.argv) > 2 else str(REPORTS_DIR / "slug-proposals.csv")
    output_csv = sys.argv[3] if len(sys.argv) > 3 else str(REPORTS_DIR / "slug-matches.csv")

    # Load unmatched old URLs
    unmatched = []
    with open(unmatched_csv, newline="") as f:
        for row in csv.DictReader(f):
            unmatched.append(row["old_url"])
    print(f"Loaded {len(unmatched)} unmatched old URLs")

    # Load known slugs for pre-check
    known_slugs, _, new_slug_by_file = load_proposals_slugs(proposals_csv)

    # Verify old docs directory exists
    if not OLD_DOCS_DIR.exists():
        print(f"Error: Old docs directory not found: {OLD_DOCS_DIR}", file=sys.stderr)
        print("Make sure temp/docs/website/docs/ exists with Docusaurus source files.")
        sys.exit(1)

    # Pre-load all Fern file bodies for efficient matching
    print("Pre-loading Fern MDX bodies...")
    fern_by_product, fern_all = preload_fern_bodies()
    total_fern = sum(len(v) for v in fern_by_product.values())
    print(f"  Loaded {total_fern} Fern pages across {len(fern_by_product)} products")

    # Serialize Fern entries for multiprocessing (Path -> str)
    def _serialize(entries):
        return [(str(p), body, tokens, blen) for p, body, tokens, blen in entries]

    fern_all_ser = _serialize(fern_all)
    fern_by_product_ser = {k: _serialize(v) for k, v in fern_by_product.items()}

    # ── Phase 1: Fast serial classification ──
    print("Phase 1: Classifying URLs (fast)...")
    results = []           # final results, in order
    content_jobs = []      # (index, old_url, old_body, product_hint) for phase 2
    stats = {"slug_changed": 0, "likely_deleted": 0, "uncertain": 0,
             "already_mapped": 0, "no_source": 0, "autogen": 0,
             "known_deleted": 0}

    for i, old_url in enumerate(unmatched):
        result, needs_match, old_body, product_hint = _classify_url(old_url, known_slugs)
        if not needs_match:
            stats[result["match_type"]] += 1
            results.append((i, result))
        else:
            content_jobs.append((i, old_url, old_body, product_hint))

    fast_count = len(results)
    print(f"  Classified {fast_count} URLs without content matching")
    print(f"  Remaining for content matching: {len(content_jobs)}")

    # ── Phase 2: Parallel content matching ──
    if content_jobs:
        # Build worker args
        worker_args = []
        for idx, old_url, old_body, product_hint in content_jobs:
            entries = fern_by_product_ser.get(product_hint, []) if product_hint else fern_all_ser
            if not entries:
                entries = fern_all_ser
            worker_args.append((old_url, old_body, entries, new_slug_by_file))

        num_workers = min(multiprocessing.cpu_count(), len(content_jobs))
        print(f"Phase 2: Content matching with {num_workers} workers...")

        bar_width = 40
        completed = 0
        with multiprocessing.Pool(num_workers) as pool:
            for job_idx, match_result in enumerate(
                pool.imap_unordered(_match_worker, worker_args, chunksize=4)
            ):
                completed += 1
                pct = completed / len(content_jobs)
                filled = int(bar_width * pct)
                bar = "#" * filled + "-" * (bar_width - filled)
                print(f"\r[{bar}] {completed}/{len(content_jobs)} ({pct*100:.0f}%)",
                      end="", flush=True)

                # Find the original index for this result (imap_unordered doesn't preserve order)
                orig_idx = -1
                # imap_unordered doesn't preserve order, so match by old_url
                for ci, (cidx, curl, _, _) in enumerate(content_jobs):
                    if curl == match_result["old_url"]:
                        orig_idx = cidx
                        break

                stats[match_result["match_type"]] += 1
                results.append((orig_idx, match_result))

        print()  # newline after progress bar

    # Sort results back into original URL order
    results.sort(key=lambda x: x[0])
    ordered_results = [r for _, r in results]

    # Write output
    fields = ["old_url", "match_type", "matched_fern_file", "matched_slug",
              "new_slug", "confidence", "match_method", "notes"]
    with open(output_csv, "w", newline="") as f:
        w = csv.DictWriter(f, fieldnames=fields)
        w.writeheader()
        w.writerows(ordered_results)

    # Categorize results
    changed = [r for r in ordered_results if r["match_type"] == "slug_changed"]
    uncertain_results = [r for r in ordered_results if r["match_type"] == "uncertain"]
    deleted = [r for r in ordered_results if r["match_type"] == "likely_deleted"]
    autogen = [r for r in ordered_results if r["match_type"] == "autogen"]
    no_source = [r for r in ordered_results if r["match_type"] == "no_source"]
    mapped = [r for r in ordered_results if r["match_type"] == "already_mapped"]
    known_del = [r for r in ordered_results if r["match_type"] == "known_deleted"]

    # Summary to stdout
    print(f"\nMatch results -> {output_csv}")
    print(f"  Total unmatched:  {len(unmatched)}")
    print(f"  slug_changed:     {stats['slug_changed']}")
    print(f"  already_mapped:   {stats['already_mapped']}")
    print(f"  likely_deleted:   {stats['likely_deleted']}")
    print(f"  uncertain:        {stats['uncertain']}")
    print(f"  no_source:        {stats['no_source']}")
    print(f"  autogen:          {stats['autogen']}")
    print(f"  known_deleted:    {stats['known_deleted']}")


    if changed:
        print(f"\nTop slug_changed matches (showing up to 10):")
        for r in changed[:10]:
            ns = f" -> new: {r['new_slug']}" if r.get("new_slug") else ""
            print(f"  {r['old_url']}")
            print(f"    -> {r['matched_fern_file']} (slug: {r['matched_slug']}{ns}, conf: {r['confidence']})")

    if uncertain_results:
        print(f"\nUncertain matches (showing up to 10):")
        for r in uncertain_results[:10]:
            ns = f" -> new: {r['new_slug']}" if r.get("new_slug") else ""
            print(f"  {r['old_url']}")
            print(f"    -> {r['matched_fern_file']} (slug: {r['matched_slug']}{ns}, conf: {r['confidence']})")

    # Write report
    report_file = output_csv.replace(".csv", "-report.md")
    with open(report_file, "w") as f:
        f.write("# Unmatched Page Matching Report\n\n")
        f.write("## Summary\n\n")
        f.write("| Category | Count | Description |\n")
        f.write("|----------|-------|-------------|\n")
        f.write(f"| **slug_changed** | {len(changed)} | Page exists in Fern under a different slug |\n")
        f.write(f"| already_mapped | {len(mapped)} | Source file maps to a known slug via different URL |\n")
        f.write(f"| uncertain | {len(uncertain_results)} | Possible match, needs manual review |\n")
        f.write(f"| likely_deleted | {len(deleted)} | No similar page found in Fern |\n")
        f.write(f"| autogen | {len(autogen)} | OpenAPI-generated endpoint (no MDX source) |\n")
        f.write(f"| known_deleted | {len(known_del)} | Section known to be not migrated |\n")
        f.write(f"| no_source | {len(no_source)} | No Docusaurus source file found |\n")

        f.write(f"| **Total** | **{len(ordered_results)}** | |\n\n")

        # Slug changed section
        if changed:
            f.write("## Slug changed\n\n")
            f.write("Pages that exist in Fern but with a different URL.\n\n")
            f.write("| Old URL | Fern file | Current slug | New slug | Confidence |\n")
            f.write("|---------|-----------|--------------|----------|------------|\n")
            for r in changed:
                ns = r.get("new_slug", "")
                ns_cell = f"`{ns}`" if ns else "--"
                f.write(f"| `{r['old_url']}` | `{r['matched_fern_file']}` "
                        f"| `{r['matched_slug']}` | {ns_cell} | {r['confidence']} |\n")

        # Uncertain section
        if uncertain_results:
            f.write("\n## Uncertain matches (manual review needed)\n\n")
            f.write("| Old URL | Fern file | Current slug | New slug | Confidence |\n")
            f.write("|---------|-----------|--------------|----------|------------|\n")
            for r in uncertain_results:
                ns = r.get("new_slug", "")
                ns_cell = f"`{ns}`" if ns else "--"
                f.write(f"| `{r['old_url']}` | `{r['matched_fern_file']}` "
                        f"| `{r['matched_slug']}` | {ns_cell} | {r['confidence']} |\n")

        # Likely deleted section
        if deleted:
            f.write("\n## Likely deleted\n\n")
            f.write("Pages with no matching content in Fern.\n\n")
            for r in deleted:
                note = f" -- {r['notes']}" if r.get("notes") else ""
                f.write(f"- `{r['old_url']}`{note}\n")

        # Autogen section
        if autogen:
            f.write(f"\n## Auto-generated API reference ({len(autogen)} pages)\n\n")
            f.write("These `/rest/` URLs were generated by the Docusaurus OpenAPI plugin, "
                    "not from MDX source files. They are handled by Fern's API reference "
                    "generation and do not need MDX redirects.\n\n")
            for r in autogen[:20]:
                f.write(f"- `{r['old_url']}`\n")
            if len(autogen) > 20:
                f.write(f"- ... and {len(autogen) - 20} more\n")

        # Known deleted section
        if known_del:
            f.write(f"\n## Known deleted ({len(known_del)} pages)\n\n")
            f.write("These sections were not migrated to Fern.\n\n")
            for r in known_del[:20]:
                f.write(f"- `{r['old_url']}`\n")
            if len(known_del) > 20:
                f.write(f"- ... and {len(known_del) - 20} more\n")

        # No source section
        if no_source:
            f.write(f"\n## No source file found ({len(no_source)} pages)\n\n")
            for r in no_source[:30]:
                note = f" -- {r['notes']}" if r.get("notes") else ""
                f.write(f"- `{r['old_url']}`{note}\n")
            if len(no_source) > 30:
                f.write(f"- ... and {len(no_source) - 30} more\n")

        f.write(f"\n## Output files\n\n")
        f.write(f"- `{output_csv}` -- full results ({len(ordered_results)} rows)\n")

    print(f"\n  Report written to: {report_file}")


if __name__ == "__main__":
    main()
