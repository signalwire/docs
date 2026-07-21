---
paths:
  - "fern/**/*.mdx"
  - "fern/**/*.md"
---

# Doc types — what you may edit

| Docs | Location | Edit by hand? |
|---|---|---|
| SWML reference | `fern/products/swml/pages/reference/methods/` | Yes |
| SDK reference | `fern/products/server-sdks/pages/reference/{lang}/` | Yes — sync every language variant |
| REST API reference | rendered from `fern/apis/*/openapi.yaml` | **No MDX exists** — edit `.tsp` under `specs/`, run `yarn build:specs`, commit source + regenerated output |
| Guides, tutorials, concepts | `fern/products/*/pages/**` | Yes |
| Snippets/partials | `fern/snippets/**` | Yes — re-check every page that includes them |

Generated artifacts — `fern/apis/**` and `specs/**/tsp-output/**` — are never hand-edited; the next build overwrites them.

## Applying audit findings

Apply only what the source supports:

- Missing param → add a `<ParamField>`; wrong type/default/description → correct to actual behavior; missing enum values → add them.
- New method → new page following `mdx-reference-pages`, with at least one example.
- Never add a param the source doesn't show; never remove one without explicit instruction.
