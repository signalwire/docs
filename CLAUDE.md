# SignalWire docs

Fern-powered documentation site. Two sources of truth: MDX pages under `fern/products/**/pages/`, and TypeSpec under `specs/` that generates the REST and SWML reference.

## Authoring rules

`.claude/rules/` holds the binding conventions. They are path-scoped and fire when a matching file is read — so when you create a file from scratch, open the matching rule first: `mdx-style`, `mdx-mechanics`, `mdx-components`, `mdx-reference-pages`, `docs-conventions` for anything under `fern/`; `spec-conventions` for `specs/`. Rationale and depth behind the style rules: `.claude/docs/mdx-style-reference.md` (read on demand, never auto-loads).

## Don't hand-edit generated output

`specs/**/tsp-output/**` and the OpenAPI files it produces (`fern/apis/signalwire-rest/openapi.yaml`, `fern/apis/compatibility/openapi.yaml`) are build artifacts. The REST reference has no MDX at all: change the `.tsp` under `specs/`, run `yarn build:specs`, and commit source plus regenerated output together. When a rendered page is wrong, fix the generator or its source — never patch the output, which the next build overwrites.

A SWML-only `.tsp` edit still moves `fern/apis/signalwire-rest/openapi.yaml`, because the REST tree imports the SWML models. Run `yarn build:specs` before committing even a SWML-only change, and expect a large REST diff in a SWML PR.

## Everything here is customer-facing

Assume no prior knowledge, and never expose internal implementation detail — backend endpoints, transports, engine-side params. Every fact traces to source, a spec, the dashboard, or a ticket; if you can't verify one, write `[NEEDS SOURCE: what's missing]` instead of guessing.

## Verify

| Change | Run |
|---|---|
| MDX pages | `yarn fern-md-check` |
| Nav yml (`fern/docs.yml`, `fern/products/*/*.yml`) | `yarn fern-check` |
| TypeSpec under `specs/` | `yarn build:specs` |

CI runs `fern-check` and `fern-md-check` on every PR. No check covers `#anchor` fragments — verify by hand any link you touch.

Never start the dev server (`yarn start`, `yarn start:dev`, `fern docs dev`). Ask the user to preview, and hand them the URLs of the pages you changed.
