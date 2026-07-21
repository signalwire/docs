---
paths:
  - "fern/**/*.mdx"
---

# Reference-page patterns

Applies wherever an interface is documented: SWML methods, SDK reference, Call Flow Builder nodes, cXML verbs, param-bearing snippets.

- One page per symbol, terse and lookup-oriented (~50–80 lines): intro sentence → optional `Note`/`Warning` → params → returns/variables → examples.
- Section names are bolded verbatim: `## **Parameters**` (functions/methods), `## **Properties**` (data objects), `## **Returns**`, `## **Variables**` (SWML methods that set any), `## **Examples**`.
- One `<ParamField>` per element, in source order. `path` = bare name for function args, dot-notation for object keys (`answer.max_duration`); nest children in `<Indent>` (blank lines inside). Types in the language's own terms (`str` for Python, `string` for SWML/JSON).
- XML elements (cXML verbs): the heading is `## Attributes` — unbolded, the one exception — with the bare attribute name as `path`. Callbacks/events: `## **Parameters**` with the handler as the param, its payload fields documented inline beneath it.
- `required={true}` only on required params — never `required={false}`. `default` only when the source defines one. `toc={true}` on reference params.
- SWML method pages: every example in both YAML and JSON inside `<CodeBlocks>`.
- Server SDK reference: mirror the SDK's own naming and types per language — verify against source, and sync any edit across every language variant of the page.
- REST API reference has no MDX pages — it renders from `fern/apis/*/openapi.yaml`. Change the `.tsp` source under `specs/` instead (see `docs-conventions`).
