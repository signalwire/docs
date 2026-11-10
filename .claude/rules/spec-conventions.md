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

## Sharing a contract across pathways

One contract gets one model, even when it arrives by more than one route. Before writing a model that looks like an existing one, establish whether the platform actually treats them as the same thing — if a single parser handles both, they are the same contract and the second model is a fork. The SWAIG function result is the worked example: a `data_map` output is expanded into exactly the object a `web_hook_url` handler returns, and both go through one parser, so both are `SWML.Calling.Output`.

When you find the shared type is wrong, fix it at the source rather than writing a corrected copy beside it. A stale canonical model plus an accurate duplicate is worse than either alone, because the next reader cannot tell which one is authoritative.

Pathways that read *slightly* different properties still share. Declare only the divergence:

- **A pathway reads extra properties** — spread the shared model and add them.
  ```typespec
  model SwaigToolWebhookResponse {
    ...SWML.Calling.Output;
    post_process?: boolean = false;
  }
  ```
- **A pathway re-types a property** — `OmitProperties` that one and re-declare it. TypeSpec cannot re-type a spread property, and `extends` cannot re-type an inherited one, so this is the only form that works. Place the spread so the emitted property order still reads well; order follows declaration order, and the emitter does not sort within a schema.
  ```typespec
  model SwaigToolWebhookResponse {
    response?: string | SwaigToolResult;
    ...OmitProperties<SWML.Calling.Output, "response">;
    post_process?: boolean = false;
  }
  ```
- **A pathway reads a subset** — `PickProperties` with a named union of keys, as `BedrockSWAIGFunction` does.
- **A pathway reads the shared contract exactly** — reference it directly and write no model at all.

Prefer spread over `extends`: `extends` emits `allOf`, which buys an indirection readers have to resolve for no gain when the parent is not itself a published variant.

Two constraints on divergence. Only add a property to the shared model when *every* pathway honours it — one that a single pathway reads belongs on that pathway's model, or you are telling the others' users they can set something inert. And say which pathway a divergence serves in a comment, so the next person can tell a deliberate asymmetry from drift; if you cannot explain why it diverges, that is a question for whoever owns the backend, not a spec decision.

## Editing

- `Unknown decorator` means a missing import, not a decorator to delete — the semantics differ (`@oneOf` is not implicit `anyOf`). Fix the import.
- Apply repetitive edits by hand, one block at a time. No bulk scripts over spec files.
- Decorator semantics belong in the emitter: wrap the stock emitter and delegate to it (`$onEmit` is exported). Never post-process emitted YAML in the build.

## Prose inside specs

`@doc` and `@example` text ships to customers, so the voice, grounding, and no-internal-details rules in `mdx-style` govern it.

## Checks

`yarn build:specs` must succeed, and the spec format's own validator or CLI is the conformance gate — schema-valid is not the same as idiomatic. Never write off a pre-existing build or CI error as out of scope; it usually marks real drift.
