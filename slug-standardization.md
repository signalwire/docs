# Slug standardization

Reference: `scripts/propose-new-slugs.py`

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
- Anything with `guides` in the path → `/guides/<last-segment>`
- `/cxml/...` → `/reference/cxml/...` (keep subcategories)
- `/sdks/...` → `/reference/...` (strip `sdks` and `methods` boilerplate)

## Collision resolution

If two pages within the same product+version map to the same new slug, 
the script auto-resolves by joining the last two old slug segments with a dash 
(e.g., `/guides/ai/swaig` and `/guides/methods/swaig` → `/guides/ai-swaig` 
and `/guides/methods-swaig`). Remaining collisions are flagged with `[COLLISION]`.

## Fern slug deduplication

Fern automatically prepends the product slug (from `docs.yml`) and version slug to every page URL. Page-level frontmatter slugs should NOT repeat these prefixes — Fern deduplicates them silently, but the correct form omits them. See CLAUDE.md "Slug Behavior" section.
