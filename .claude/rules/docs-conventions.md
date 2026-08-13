---
paths:
  - "fern/**/*.mdx"
  - "fern/**/*.md"
  - "fern/**/*.yml"
  - "fern/**/*.yaml"
---

# Doc types — what you may edit

| Docs | Location | Edit by hand? |
|---|---|---|
| SWML reference | `fern/products/swml/pages/reference/methods/` | Yes |
| SDK reference | `fern/products/server-sdks/pages/reference/{lang}/` | Yes — sync every language variant |
| REST API reference | rendered from `fern/apis/*/openapi.yaml` | **No MDX exists** — edit `.tsp` under `specs/`, run `yarn build:specs`, commit source + regenerated output |
| Guides, tutorials, concepts | `fern/products/*/pages/**` | Yes |
| Snippets/partials | `fern/snippets/**` | Yes — re-check every page that includes them |

Generated artifacts — `specs/**/tsp-output/**` and the OpenAPI files it emits (`fern/apis/signalwire-rest/openapi.yaml`, `fern/apis/compatibility/openapi.yaml`) — are never hand-edited; the next build overwrites them. Not all of `fern/apis/` is generated: `calling-rpc/openrpc.yaml` has no generator and is hand-maintained (currently commented out of `fern/products/apis/apis.yml`). TypeSpec conventions live in `spec-conventions`.

## Applying audit findings

Apply only what the source supports:

- Missing param → add a `<ParamField>`; wrong type/default/description → correct to actual behavior; missing enum values → add them.
- New method → new page following `mdx-reference-pages`, with at least one example.
- Never add a param the source doesn't show; never remove one without explicit instruction.
