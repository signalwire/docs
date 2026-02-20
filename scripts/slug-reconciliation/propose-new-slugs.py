#!/usr/bin/env python3
"""Propose new slugs based on conventions.

Reads frontmatter-export.csv and outputs slug-proposals.csv with a new_slug column.

Conventions:
  - /guides/<article-name>       for guides (flat, no subcategories)
  - /reference/<subcat?>/<name> for references (subcategories OK)
  - Always dashes, no underscores
  - Leading slash on all explicit slugs
"""

import csv
import re
import sys
from collections import defaultdict
from pathlib import Path

SCRIPT_DIR = Path(__file__).resolve().parent
<<<<<<< Updated upstream:scripts/slug-reconciliation/propose-new-slugs.py
REPORTS_DIR = SCRIPT_DIR / "reports"
=======
PRODUCTS_DIR = SCRIPT_DIR.parent / "fern" / "products"

DELETED = "DELETED"
>>>>>>> Stashed changes:scripts/propose-new-slugs.py


# ---------------------------------------------------------------------------
# Helpers
# ---------------------------------------------------------------------------

def normalize(slug):
    """Underscores → dashes, lowercase, ensure leading /, strip trailing /."""
    if not slug:
        return ""
    s = slug.strip().replace("_", "-").lower()
    if not s.startswith("/"):
        s = "/" + s
    if s != "/" and s.endswith("/"):
        s = s.rstrip("/")
    return s


def segments(slug):
    """Split slug into non-empty path segments."""
    return [p for p in slug.split("/") if p]


def last(slug, n=1):
    """Return the last n segments joined by /."""
    parts = segments(slug)
    return "/".join(parts[-n:]) if parts else ""


def guide_slug(slug):
    """Flatten to /guides/<article>.  Strips leading 'guides'/'guide' segment."""
    parts = segments(slug)
    if parts and parts[0] in ("guides", "guide"):
        parts = parts[1:]
    if not parts:
        return "/guides"
    return "/guides/" + parts[-1]


def reference_slug(slug, strip_prefixes=()):
    """Convert to /reference/<rest>.  Optionally strips leading segments."""
    parts = segments(slug)
    while parts and parts[0] in strip_prefixes:
        parts = parts[1:]
    if not parts:
        return "/reference"
    return "/reference/" + "/".join(parts)


# ---------------------------------------------------------------------------
# Per-product handlers — each returns proposed new slug
# ---------------------------------------------------------------------------

def swml(slug, fp):
    if slug == "/":
        return "/"
    if slug == "/quickstart":
        return "/guides/quickstart"
    if slug.startswith("/guides"):
        return guide_slug(slug)
    if slug.startswith("/methods"):
        parts = segments(slug)
        # Strip "methods" prefix → [method, subcategory?, name...]
        parts = parts[1:]
        if not parts:
            return "/reference"
        method = parts[0]
        rest = parts[1:]
        if not rest:
            # /reference/<method>
            return "/reference/" + method
        if len(rest) == 1:
            # /reference/<method>/<name>
            return "/reference/" + method + "/" + rest[0]
        if len(rest) == 2:
            # /reference/<method>/<subcategory>/<name>
            return "/reference/" + method + "/" + rest[0] + "/" + rest[1]
        # /reference/<method>/<subcategory>/<name-joined>
        subcat = rest[0]
        name = "-".join(rest[1:])
        return "/reference/" + method + "/" + subcat + "/" + name
    if slug in ("/expressions", "/variables"):
        return "/reference" + slug
    if slug.startswith("/reference"):
        return slug
    return slug


def platform(slug, fp):
    if not slug or slug == "/":
        return slug
    # Platform has no reference/guide distinction — everything is a guide.
    # Keep the top-level category (ai, voice, messaging, etc.) since they're
    # stable and meaningful; flatten everything below it.
    parts = segments(slug)
    # Strip leading "guides"/"guide" — not a real category here
    if parts and parts[0] in ("guides", "guide"):
        parts = parts[1:]
    if not parts:
        return "/"
    if len(parts) == 1:
        return "/" + parts[0]
    return "/" + parts[0] + "/" + parts[-1]


def call_flow_builder(slug, fp):
    effective = slug if slug else slug_from_filepath(fp)
    if not effective or effective == "/":
        return effective
    if "pages/nodes/" in fp:
        return "/reference/" + last(effective)
    return "/guides/" + last(effective)


def agents_sdk(slug, fp):
    if not slug or slug == "/":
        return slug
    parts = segments(slug)
    # Reference tab pages live under /api/ and /appendix/
    if parts[0] in ("api", "appendix"):
        ref = reference_slug(slug, strip_prefixes=("api", "appendix"))
        # Flatten subcategories: /reference/cli/swaig-test → /reference/cli-swaig-test
        ref_parts = segments(ref)
        if len(ref_parts) > 2:
            return "/reference/" + "-".join(ref_parts[1:])
        return ref
    return "/guides/" + parts[-1]


def slug_from_filepath(fp):
    """Derive a slug from file path, stripping product/pages/version prefixes."""
    parts = segments(fp)
    # Strip: <product>/pages/<version>/
    if len(parts) >= 3 and parts[1] == "pages":
        parts = parts[3:]  # skip product, pages, version
    # Strip index.mdx → use parent dir name
    if parts and parts[-1] in ("index.mdx", "index.md"):
        parts = parts[:-1]
    elif parts:
        # Strip .mdx extension from last segment
        parts[-1] = parts[-1].rsplit(".", 1)[0]
    return "/" + "/".join(parts) if parts else "/"


def browser_sdk(slug, fp):
    effective = slug if slug else slug_from_filepath(fp)
    if effective == "/":
        return "/"
    parts = segments(effective)
    # Guide pages
    if "guides" in parts:
        guide_parts = parts[parts.index("guides"):]
        return guide_slug("/" + "/".join(guide_parts))
    # Reference — strip existing 'reference' prefix to avoid doubling
    content = [p for p in parts if p != "reference"]
    if not content:
        return "/reference"
    return "/reference/" + "/".join(content)


def realtime_sdk(slug, fp):
    if not slug or slug == "/":
        return slug
    # Strip version prefixes — Fern handles versioning automatically
    s = re.sub(r"^/v\d+/", "/", slug)
    if s.startswith("/guides"):
        return guide_slug(s)
    return s


def compatibility_api(slug, fp):
    if not slug or slug == "/":
        return slug
    parts = segments(slug)
    # Guide pages
    if "guides" in parts:
        return guide_slug(slug)
    # cXML reference — sub-product first, then reference
    if parts[0] == "cxml":
        rest = parts[1:]
        if not rest:
            return "/cxml/reference"
        return "/cxml/reference/" + "/".join(rest)
    # SDK reference — sub-product first, then reference; strip 'methods' boilerplate
    if parts[0] == "sdks":
        # /sdks → /sdks (sub-product landing page)
        if len(parts) == 1:
            return "/sdks"
        # Strip 'methods' boilerplate from path
        rest = [p for p in parts[1:] if p != "methods"]
        if not rest:
            return "/sdks/reference"  # /sdks/methods → /sdks/reference
        return "/sdks/reference/" + "/".join(rest)
    return slug


HANDLERS = {
    "swml": swml,
    "platform": platform,
    "call-flow-builder": call_flow_builder,
    "agents-sdk": agents_sdk,
    "browser-sdk": browser_sdk,
    "realtime-sdk": realtime_sdk,
    "compatibility-api": compatibility_api,
}


def compose_url(product, version_slug, tab, page_slug):
    """Build the full URL that Fern will produce for a page."""
    parts = []
    if product and product != "/":
        parts.append(product)
    if version_slug:
        parts.append(version_slug)
    if tab:
        parts.append(tab)
    if page_slug and page_slug != "/":
        parts.append(page_slug.lstrip("/"))
    return "/" + "/".join(parts) if parts else "/"


def collision_key(row):
    """Key used to detect same-slot collisions.  Version-aware."""
    return (row["product"], row.get("version", ""), row["new_slug"])


# ---------------------------------------------------------------------------
# Collision resolution
# ---------------------------------------------------------------------------

def resolve_collisions(rows):
    """Disambiguate colliding new_slugs by prefixing with parent segment."""
    by_key = defaultdict(list)
    for r in rows:
        ns = r["new_slug"]
        if ns and ns != "/" and ns != DELETED:
            by_key[collision_key(r)].append(r)

    for key, group in by_key.items():
        if len(group) < 2:
            continue
        for r in group:
            old_parts = segments(r["slug"])
            if len(old_parts) >= 2:
                new_parts = segments(r["new_slug"])
                # Keep existing prefix (guides/, reference/, or category like ai/)
                prefix = new_parts[0] if new_parts else old_parts[0]
                # Use parent + last segment from OLD slug to disambiguate
                r["new_slug"] = normalize(
                    "/" + prefix + "/" + old_parts[-2] + "-" + old_parts[-1]
                )
            # else: leave as-is; will be flagged below

    # Second pass — flag anything still colliding
    by_key2 = defaultdict(list)
    for r in rows:
        ns = r["new_slug"]
        if ns and ns != "/":
            by_key2[collision_key(r)].append(r)

    remaining = {}
    for key, group in by_key2.items():
        if len(group) >= 2:
            remaining[key] = group
            for r in group:
                if "COLLISION" not in r["new_slug"]:
                    r["new_slug"] += " [COLLISION]"
    return remaining


# ---------------------------------------------------------------------------
# Main
# ---------------------------------------------------------------------------

def main():
    input_csv = sys.argv[1] if len(sys.argv) > 1 else str(REPORTS_DIR / "frontmatter-export.csv")
    output_csv = sys.argv[2] if len(sys.argv) > 2 else str(REPORTS_DIR / "slug-proposals.csv")

    rows = []
    deleted_count = 0
    with open(input_csv, newline="") as f:
        for row in csv.DictReader(f):
            product = row["product"]
            slug = normalize(row["slug"])
            fp = row["file_path"]

            # Mark deleted files
            if not (PRODUCTS_DIR / fp).exists():
                row["slug"] = slug
                row["new_slug"] = DELETED
                rows.append(row)
                deleted_count += 1
                continue

            # Strip redundant product prefix from raw frontmatter slug
            if product and product != "/" and slug.startswith("/" + product + "/"):
                slug = slug[len("/" + product):]
            elif product and product != "/" and slug == "/" + product:
                slug = "/"

            handler = HANDLERS.get(product)
            new_slug = normalize(handler(slug, fp)) if handler else slug

            row["slug"] = slug
            row["new_slug"] = new_slug
            rows.append(row)

    collisions = resolve_collisions(rows)

    # Compose full Fern URLs
    for r in rows:
        if r["new_slug"] == DELETED:
            r["composed_slug"] = DELETED
        else:
            r["composed_slug"] = compose_url(
                r["product"], r.get("version_slug", ""), r.get("tab", ""), r["new_slug"],
            )

    # Write output
    fields = ["id", "title", "description", "file_path", "product", "version", "version_slug", "tab", "slug", "new_slug", "composed_slug"]
    with open(output_csv, "w", newline="") as f:
        w = csv.DictWriter(f, fieldnames=fields, extrasaction="ignore")
        w.writeheader()
        w.writerows(rows)

    # Summary
    changed = sum(
        1 for r in rows
        if r["slug"] != r["new_slug"] and r["new_slug"] and "COLLISION" not in r["new_slug"]
    )
    unchanged = sum(1 for r in rows if r["slug"] == r["new_slug"])
    empty = sum(1 for r in rows if not r["new_slug"])
    coll_count = sum(len(v) for v in collisions.values())

    print(f"Processed {len(rows)} pages → {output_csv}")
    print(f"  Changed:   {changed}")
    print(f"  Unchanged: {unchanged}")
    print(f"  Empty:     {empty}")
    if deleted_count:
        print(f"  Deleted:   {deleted_count}")
    if collisions:
        print(f"  COLLISIONS: {coll_count} pages in {len(collisions)} groups")
        for (prod, ver, slug_key), rs in sorted(collisions.items()):
            clean = slug_key.replace(" [COLLISION]", "")
            ver_label = f" ({ver})" if ver else ""
            print(f"    {prod}{ver_label}: {clean}")
            for r in rs:
                print(f"      ← {r['slug']}  ({r['file_path']})")


if __name__ == "__main__":
    main()
