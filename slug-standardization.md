# Slug standardization

## Usage

```bash
<<<<<<< Updated upstream
# 1. Collect current slugs from frontmatter into a CSV
python3 scripts/slug-reconciliation/collect-old-slugs.py            # → reports/frontmatter-export.csv
=======
# 1. Collect current slugs from frontmatter into a CSV (one-time snapshot)
python3 scripts/collect-old-slugs.py            # → frontmatter-export.csv
python3 scripts/collect-old-slugs.py out.csv    # → custom output path
python3 scripts/collect-old-slugs.py --force    # overwrite existing output
>>>>>>> Stashed changes

# 2. Propose new slugs based on per-product conventions
python3 scripts/slug-reconciliation/propose-new-slugs.py            # → reports/slug-proposals.csv

# 3. Run the full reconciliation pipeline (fetch old sitemap, reconcile, match, report)
python3 scripts/slug-reconciliation/run-pipeline.py                 # → reports/slug-final-report.csv + .md
python3 scripts/slug-reconciliation/run-pipeline.py --skip-fetch    # reuse cached sitemap
```

<<<<<<< Updated upstream
**Data flow:** `collect-old-slugs.py` reads every `.mdx` file's frontmatter and
writes `frontmatter-export.csv` (columns: id, title, product, slug, description,
file\_path). `propose-new-slugs.py` reads that CSV, applies per-product rules,
and writes `slug-proposals.csv` (adds a `new_slug` column). `run-pipeline.py`
then fetches the old Docusaurus sitemap, reconciles against proposals, content-matches
unmatched pages, and produces a unified redirect report.

All outputs go to `scripts/slug-reconciliation/reports/`.
=======
**Data flow:** `collect-old-slugs.py` parses `docs.yml` and each product's
navigation YAML to resolve version and tab info, then reads every `.mdx` file's
frontmatter and writes `frontmatter-export.csv` (columns: id, title, product,
version, version\_slug, tab, slug, description, file\_path).
`propose-new-slugs.py` reads that CSV, applies per-product rules, and writes a
separate `slug-proposals.csv` (adds `new_slug`, `composed_slug` columns).
Neither script mutates the other's output. Review `slug-proposals.csv` in a
spreadsheet, edit `new_slug` values as needed, then apply (apply script TBD).

**Overwrite guard:** `collect-old-slugs.py` refuses to overwrite an existing
output file unless `--force` is passed. This protects the historical snapshot
from accidental regeneration after files have been deleted.

**Deletion tracking:** `propose-new-slugs.py` checks whether each `file_path`
from the input CSV still exists on disk. Missing files get `new_slug` and
`composed_slug` set to `DELETED`. This is safe to rerun after successive
deletion batches — it reads the stable `frontmatter-export.csv` snapshot and
re-checks the filesystem each time, so deletions accumulate naturally.

### CSV columns

| Column | Example values | Purpose |
|--------|---------------|---------|
| `id` | `abc-123` | Frontmatter `id` field |
| `title` | `Switch AI context mid-call` | Frontmatter `title` field |
| `product` | `swml`, `platform` | Product URL slug (from `docs.yml`) |
| `version` | `latest`, `v3`, `v2`, (empty) | Version directory name — which version dir the file lives in. Empty for unversioned products. |
| `version_slug` | `v3`, `v2`, (empty) | Version URL segment — empty for latest and unversioned products |
| `tab` | `reference`, `guides`, `calling` | Tab URL slug — the segment that appears in the URL. Derived from the product nav YAML's `tabs:` section (respects custom `slug:` overrides). |
| `slug` | `/methods/ai` | Frontmatter `slug` field (raw) |
| `description` | `...` | Frontmatter `description` field |
| `file_path` | `swml/pages/reference/...` | Path relative to `fern/products/` |
| `new_slug` | `/reference/ai` | *(proposal only)* Proposed replacement slug |
| `composed_slug` | `/swml/reference/ai` | *(proposal only)* Full URL as Fern will produce it: `/<product>/<version?>/<tab>/<new_slug>` |

Fern composes page URLs as: `/<product>/<version?>/<tab>/<page_slug>`.
The `version_slug` and `tab` columns let you reconstruct the full URL and catch
problems like redundant tab prefixes in page slugs (e.g., a page under the
`reference` tab with slug `/reference/foo` produces `.../reference/reference/foo`).
The `composed_slug` column in the proposal CSV shows this full URL directly.
>>>>>>> Stashed changes

Requires `python-frontmatter` (`pip install python-frontmatter`).

## Conventions

- `/guides/<article-name>` for guides (flat, no subcategories)
- `/reference/<subcategory?>/<reference-name>` for references (subcategories OK if stable and useful)
- Always dashes, no underscores
- Lowercase
- Leading `/`, no trailing `/`

**SWML exception:** SWML references follow `/reference/<method>/<subcategory?>/<name>` —
the method name is always present as the first segment after `reference`. When the
path has more than 3 segments beyond `reference/`, the tail is flattened with dashes
(e.g., `/reference/ai/swaig/functions-data-map-webhooks-foreach`).

## Per-product rules

**SWML** — Has clear guide/reference tabs.
- `/methods/<method>/...` → `/reference/<method>/<subcategory?>/<name>` (max 3 levels under reference)
- `/expressions`, `/variables` → `/reference/expressions`, `/reference/variables`
- `/guides/...` → `/guides/<last-segment>` (flatten subcategories)
- `/quickstart` → `/guides/quickstart`

**Platform** — No guide/reference split in tabs, all content is instructional.
Categories (ai, voice, messaging, dashboard, etc.) are important and stable.
- Everything → `/<first-segment>/<last-segment>` (keep top-level category, flatten the rest)
- No `/guides/` prefix — since everything is a guide, it adds no information

**Call Flow Builder** — Two tabs: `core` and `nodes`.
- Pages in `pages/nodes/` → `/reference/<last-segment>`
- Pages in `pages/core/` → `/guides/<last-segment>`

**Agents SDK** — Has guide/reference tabs.
- `/api/...`, `/appendix/...` → `/reference/...` (strip old prefix, keep subcategories)
- Everything else → `/guides/<last-segment>`

**Browser SDK** — Has guide/reference tabs. 
108 pages had no slug at all (relied on file-path-derived URLs), 
so we derive a slug from the file path first.
- Anything with `guides` in the path → `/guides/<last-segment>`
- Everything else → `/reference/...` (strip duplicate `reference` from path, keep subcategories)

**Realtime SDK** — Has guide/reference tabs. 
v3 pages had `/v3/` baked into slugs redundantly (Fern handles versioning automatically), 
so we strip that first.
- `/guides/...` → `/guides/<last-segment>`
- `/reference/...` → unchanged (already correct)

**Compatibility API** — Tabs: `cxml`, `sdks`, `rest-api`.
Sub-product (tab name) comes before `reference` — these are distinct sub-products,
not just subcategories within a single reference section.
- Anything with `guides` in the path → `/guides/<last-segment>`
- `/cxml/...` → `/cxml/reference/...` (sub-product first, then reference)
- `/sdks/...` → `/sdks/reference/...` (strip `methods` boilerplate, sub-product first)

## Collision resolution

If two pages within the same product+version map to the same new slug, 
the script auto-resolves by joining the last two old slug segments with a dash 
(e.g., `/guides/ai/swaig` and `/guides/methods/swaig` → `/guides/ai-swaig` 
and `/guides/methods-swaig`). Remaining collisions are flagged with `[COLLISION]`.

## Fern slug deduplication

Fern automatically prepends the product slug (from `docs.yml`) and version slug to every page URL. Page-level frontmatter slugs should NOT repeat these prefixes — Fern deduplicates them silently, but the correct form omits them. See CLAUDE.md "Slug Behavior" section.

**Tab prefixes are NOT deduplicated.** Unlike product/version prefixes, Fern does
not strip duplicate tab segments. A page under the `reference` tab with slug
`/reference/foo` produces `/product/reference/reference/foo`. The `composed_slug`
column in the proposal CSV makes these bugs visible.

## History

- [Version + tab column refactor](slug-version-tab-refactor.md) — why and how
  the collect/propose scripts were updated to parse Fern nav YAMLs
