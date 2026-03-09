# Slug Reconciliation Pipeline

## Context

The `propose-new-slugs.py` script maps current frontmatter slugs to standardized new slugs. But it only sees pages that currently exist in Fern with their current frontmatter. It misses:

1. Pages whose slugs were already changed during migration (before the report)
2. Pages that were deleted during migration
3. Pages that had no slug frontmatter (URL was file-path-derived)

The old Docusaurus site (`developer.signalwire.com`) is still live. We'll fetch its sitemap programmatically and reconcile against the generated CSV.

---

## Old Docusaurus Routing (critical context)

The old site used 5 docs plugin instances, each with a different `routeBasePath`:

| Plugin | routeBasePath | Source directory |
|--------|---------------|-----------------|
| main (classic preset) | `/` | `temp/docs/website/docs/main/` |
| agents-sdk-manual | `/sdks/agents-sdk` | `temp/docs/website/docs/agents-sdk/` |
| browser-sdk | `/sdks/browser-sdk` | `temp/docs/website/docs/browser-sdk/` |
| realtime-sdk | `/sdks/realtime-sdk` | `temp/docs/website/docs/realtime-sdk/` |

**URL derivation rules:**
- **With `slug` frontmatter:** final URL = `routeBasePath` + `slug`
- **Without `slug` frontmatter:** final URL = `routeBasePath` + file-path-derived-slug
  - Strip `.md`/`.mdx` extension
  - `index.mdx` maps to parent directory path
  - Path is relative to the plugin's docs directory

**Example:** `temp/docs/website/docs/browser-sdk/guides/video/highlighting-whos-speaking.mdx` (no slug) → `/sdks/browser-sdk/guides/video/highlighting-whos-speaking`

The main plugin contains: `swml/`, `call-flow-builder/`, `compatibility-api/`, `cantina/`, `home/`, `rest/`, `events/`

---

## Scripts

### Script 1: `scripts/fetch-old-sitemap.py`

**Purpose:** Fetch the old site's sitemap and build an array of all doc slugs.

- Fetch `https://developer.signalwire.com/sitemap.xml`
- Parse XML, extract all `<loc>` URLs
- Filter out external links (different domain)
- Strip domain to get path slugs (e.g., `https://developer.signalwire.com/sdks/agents-sdk/foo` → `/sdks/agents-sdk/foo`)
- Configurable exclude list for non-doc sections (e.g., `/blog/`, `/tags/`, `/search/`, `/internal/`) — defaulting to include everything so we don't accidentally miss content
- **Output:** `old-sitemap-slugs.json` — array of slug strings

---

### Script 2: `scripts/reconcile-slugs.py`

**Purpose:** Compare old sitemap slugs against the `slug-proposals.csv` report to find exact matches and non-matches.

- Read `old-sitemap-slugs.json` (from script 1)
- Read `slug-proposals.csv` (from existing `propose-new-slugs.py`)
- For each old sitemap slug, check if an exact match exists in the CSV's slug column
  - Need to account for product prefix differences (old site may have `/sdks/agents-sdk/...` while CSV has `/advanced/call-recording` for product `agents-sdk`)
  - Build full old-style URL from CSV data: `/<product-prefix>/<slug>` and compare
- Categorize each old slug: **matched** or **unmatched**
- **Output:** `slug-reconciliation.csv` with columns: `old_url`, `status`, `matched_csv_row` (if found)
- Print summary stats: total old URLs, matched count, unmatched count

---

### Script 3: `scripts/match-unmatched-pages.py`

**Purpose:** For unmatched old URLs, determine if the page was deleted or had its slug changed, using intelligent content matching.

**Old page content source:** Docusaurus source files in `temp/docs/website/docs/`. Map old URLs back to source MDX files using the routing table above — determine which plugin directory the file belongs to, then reconstruct the old URL using `routeBasePath` + `slug` (if frontmatter slug exists) or `routeBasePath` + file-path-derived-slug (per Docusaurus routing rules: strip extension, `index.mdx` → parent dir).

**Matching approach — body content focused:**
- Strip frontmatter from both old (Docusaurus) and new (Fern) MDX files
- Compare the raw markdown body text, not metadata
- This is more reliable because titles/descriptions may have been edited during migration, but body content is largely preserved

**Steps:**

1. Read unmatched entries from script 2's output
2. For each unmatched old URL, locate the Docusaurus source file in `temp/docs/`
3. Derive old URL from source file:
   - If file has `slug` frontmatter → old URL = `routeBasePath` + `slug`
   - If file has NO `slug` frontmatter → derive URL from file path per Docusaurus rules (strip extension, `index.mdx` → parent dir, path relative to plugin docs dir, prepend `routeBasePath`)
4. **Pre-check: slug lookup** — compare the derived/explicit slug against slugs in `slug-proposals.csv`. If it matches a known slug → this page is already accounted for in the report. Mark as `already_mapped` and skip fuzzy matching.
5. For remaining unmatched: strip frontmatter, extract body text from old file
6. For each candidate Fern MDX page in the mapped product:
   - Strip frontmatter, extract body text
   - Compute similarity score using `difflib.SequenceMatcher` on body content
7. Rank candidates by similarity score
8. **Secondary signals** (used to boost/break ties): filename match, title match
9. Categorize:
   - **`slug_changed`** — high confidence match (score >= 0.7)
   - **`likely_deleted`** — no source file in `temp/docs/`, or source exists but no Fern match above threshold
   - **`uncertain`** — low confidence matches (0.3–0.7)
10. **Output:** `slug-matches.csv` with columns: `old_url`, `match_type`, `matched_fern_file`, `matched_slug`, `confidence`, `match_method`

---

## Key Files

| File | Description |
|------|-------------|
| `scripts/propose-new-slugs.py` | Existing script, generates `slug-proposals.csv` |
| `scripts/export-frontmatter-csv.py` | Existing script, generates `frontmatter-export.csv` |
| `slug-proposals.csv` | Existing output (1,262 rows) |
| `fern/docs.yml` | Product slug mappings |
| `fern/products/` | All current MDX pages |
| `temp/docs/website/docusaurus.config.ts` | Old site routing config (`routeBasePath` per plugin) |
| `temp/docs/website/docs/` | Old Docusaurus source files (for content matching) |

## Dependencies

- Python 3 standard library (`xml.etree`, `csv`, `json`, `difflib`, `urllib`)
- `python-frontmatter` (already a dependency for `export-frontmatter-csv.py`)

## Verification

1. Run script 1: `python scripts/fetch-old-sitemap.py` → produces `old-sitemap-slugs.json`
2. Run script 2: `python scripts/reconcile-slugs.py` → produces `slug-reconciliation.csv`, review summary stats
3. Run script 3: `python scripts/match-unmatched-pages.py` → produces `slug-matches.csv`
4. Spot-check: pick 5–10 entries from each category (`matched`, `slug_changed`, `likely_deleted`) and verify manually
