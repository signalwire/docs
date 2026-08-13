---
paths:
  - "specs/**/*.tsp"
  - "specs/**/*.ts"
---

# Spec conventions — TypeSpec

`specs/` generates the REST reference (`signalwire-rest`, `compatibility-api`) and the SWML schemas. There are no MDX pages for any of it. Build with `yarn build:specs`, and commit the `.tsp` source together with the regenerated output; `specs/**/tsp-output/**` and the OpenAPI files under `fern/apis/` are artifacts the next build overwrites.

## Modeling

- Model the real API. Verify every field, type, default, and enum against backend source before adding it, and never invent one to make a shape tidy. Can't verify it? Leave it out and say so.
- Source-verified is not the same as public. A field the engine reads belongs in a public spec only once a customer can actually obtain and set it.
- Prefer structural modeling over magic decorators. Standards-first: keep any workaround quarantined and removable, with a comment naming what it works around.
- No discriminated union when the discriminator is optional — OpenAPI requires the discriminator field to be required, and backends usually default it. Keep the params flat and cover the variants in prose.
- When a payload is byte-identical to one that already exists, reference the canonical model instead of forking it for a separate nav entry.

## Editing

- `Unknown decorator` means a missing import, not a decorator to delete — the semantics differ (`@oneOf` is not implicit `anyOf`). Fix the import.
- Apply repetitive edits by hand, one block at a time. No bulk scripts over spec files.
- Decorator semantics belong in the emitter: wrap the stock emitter and delegate to it (`$onEmit` is exported). Never post-process emitted YAML in the build.

## Prose inside specs

`@doc` and `@example` text ships to customers, so the voice, grounding, and no-internal-details rules in `mdx-style` govern it.

## Checks

`yarn build:specs` must succeed, and the spec format's own validator or CLI is the conformance gate — schema-valid is not the same as idiomatic. Never write off a pre-existing build or CI error as out of scope; it usually marks real drift.
