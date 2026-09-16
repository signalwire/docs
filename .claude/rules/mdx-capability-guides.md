---
paths:
  - "fern/products/*/pages/**/*.mdx"
---

# Capability guides — one capability, every surface

Applies to a how-to that teaches one platform capability across more than one surface (SWML, the REST Calling API, WebSocket via Relay, the Browser SDK). Exemplar: `fern/products/platform/pages/calling/voice/outbound-calling.mdx`; `call-streaming.mdx` and `machine-detection.mdx` beside it follow the same shape. A single-surface how-to or an integration guide (the Vapi page) follows `mdx-style` alone. Voice, grounding, and `## Next steps` come from `mdx-style`; this rule fixes the skeleton and the sample conventions so guides match each other.

## Skeleton

```text
frontmatter: title = capability as a noun phrase ("Call streaming"); slug /voice/<capability>;
             description = one sentence naming the first-run outcome, then each extension in page order
[reference-style link definitions]
intro, 2–3 sentences, no heading: what the reader does, then "Start by <smallest verifiable thing>, then <extensions in H2 order>."
## Prepare for <X>
## How <X> works                     (optional — see below)
## <Do the first thing>              ("Make your first call", "Stream your first call")
   <Steps>
   ### Choose how to <X>
   ### Set your credentials and <X>
   ### <topic setup>                 (optional — "Choose a destination", "Run a WebSocket server")
   ### <Do it>                       ("Place the call", "Start the stream")
   ### <Physical action>             ("Answer the call", "Answer and speak") — the verification step
   </Steps>
## Track <X> / Control <X>
   ### … via REST
   ### … via WebSocket
   ### Compare the surfaces          (optional)
## Examples
   ### <Verb phrase>
   #### <Verb phrase> via REST
   #### <Verb phrase> via WebSocket (Relay)
## Next steps
```

- **Prepare.** "Have these values ready:" then bullets: Space URL, Project ID and API token with the **Voice** permission, a purchased number or verified caller ID, a destination the reader can answer, then topic-specific items. Hard constraints follow as titled `<Warning>`s (trial and international limits, `wss://` only, TCPA). Add one pointer sentence when a reader might want a sibling guide instead.
- **How it works.** Put it before the first run only when the reader can't interpret the result without the model (machine detection's outcome table). Otherwise conceptual depth goes after the first run, as its own `##` ("Handle the audio stream").
- **First run** targets the smallest thing the reader can confirm alone, usually calling their own phone.
- **Verification step** closes the `<Steps>`: what the reader hears or sees on success, then the likeliest failure and what it means. Never skip it.
- **Track/Control** opens with "Follow the section for the approach you used." REST gets `status_url`/`status_events` and a JSON callback payload; WebSocket gets `call.on(…)` handlers. One lifecycle diagram per surface family, themed SVG in `<llms-ignore>` with an `<llms-only>` mermaid `sequenceDiagram` twin (`mdx-diagrams`). Add `### Compare the surfaces` when defaults or parameter names differ by surface.
- **Examples** are `### <Verb phrase>` scenarios: one-sentence goal, a titled `<Warning>` when compliance applies, then a `####` per surface. Every example is a complete program the reader can run, not a fragment.
- **Next steps** is required here as on every guide (`mdx-style`). Cards deepen this capability only.

## Choose-how tables

Two tables, in this order:

1. `| What you want to do | Where to start |` — one row per surface; the second cell links to the do-it step's anchor and names the surface ("[REST Calling API](#place-the-call), using cURL or a Server SDK").
2. `| Function | SWML | REST | WebSocket (Relay) | Browser SDK |` (only the surfaces the capability has) — cells are `<Icon icon="regular circle-check" color="var(--status-success)" />` or `<Icon icon="regular circle-xmark" color="var(--status-error)" />`. Rows are reader outcomes ("Command a call already in progress from any process, by its call ID"), not feature names.

Close with one sentence on what the approaches share and where they differ. Surface names are fixed: "SWML", "REST Calling API" (or "REST"), "WebSocket (Relay)", "Browser SDK", "Server SDK". Never "Realtime SDK" or "Agents SDK".

## Surface tabs and code blocks

- The do-it step is `<Tabs groupId="…">` with exactly `<Tab title="REST">` and `<Tab title="WebSocket (Relay)">`. Guides under one overview share a single `groupId` so the reader's surface choice follows them from page to page; the voice guides use `outbound-api`. Each tab opens with one paragraph on what the request does, then `<CodeBlocks>`.
- CodeBlock titles are `<Language> — <client>`: REST tab `cURL — Calling API`, `Python — REST client`, `TypeScript — REST client`; Relay tab `Python — Relay client`, `TypeScript — Relay client`, plus `JavaScript — Browser SDK` when the browser applies.
- The REST tab ends with the "returns a call `id` and status `queued` … save the `id`" paragraph and `<EndpointResponseSnippet endpoint="POST /api/calling/calls" />`.
- A SWML-only sample is `<CodeBlocks>` of `YAML` and `JSON`. Later `####`s outside the tabs use bare `<CodeBlocks>`, not nested tabs.

## Sample conventions

- **Header comments** on every standalone sample. Python: `# Install: python -m pip install signalwire-sdk==3.4.1` then `# Save as <name>.py and run: python <name>.py`. TypeScript with no type annotations: `// Install: npm install @signalwire/sdk@2.0.5` then `// This sample also runs as JavaScript: save as <name>.mjs,` / `// then run: node <name>.mjs`. TypeScript that uses types: `// Save as <name>.mts and run: npx tsx <name>.mts`. Browser: `// Install: npm install @signalwire/js@4.0.0-rc.2 rxjs@7.8.2` plus the HTML elements the script expects, as comments.
- Every sample under `## Examples` is standalone with headers. A block under `## Track…`/`## Control…` may show only the changed lines when its paragraph names the sample it extends.
- **Pinned versions** are literal and identical across every guide: `signalwire-sdk==3.4.1`, `@signalwire/sdk@2.0.5`, `@signalwire/js@4.0.0-rc.2 rxjs@7.8.2`. Bump them in every guide in one PR, never one page at a time.
- **Placeholders**: `<YOUR_SPACE>`, `<YOUR_PROJECT_ID>`, `<YOUR_API_TOKEN>`, `<YOUR_CALLER_ID>`, `<YOUR_DESTINATION>`, `<YOUR_STATUS_WEBHOOK_URL>`, `<YOUR_CALL_ID>`; new ones follow the same `<YOUR_…>` shape and appear in the credentials table.
- **Relay boilerplate**: `contexts=["default"]`, `timeout: 30` on the phone device, Python `async with client:` and `await call.wait_for_ended()`, TypeScript `await client.connect()` / `try … finally { await client.disconnect(); }` and `await call.waitForEnded()`. Hang up in an `on_completed`/`onCompleted` callback guarded by `call.state !== "ended"`.
- **Builder gaps**: when the SDK's SWML builder lacks a verb, say so in a comment and use `add_verb`/`addVerb` with validation off for that verb only. Don't silently hand-write JSON where the builder works.
- **Running example**: `Bayview Taxi` and its dispatcher `Ada` when the scenario has a business voice; a plain "Hello, welcome to SignalWire!" for pure mechanics (`mdx-style` Grounding).

## Ships with the page

- A `<Card>` on the parent overview (`fern/products/platform/pages/calling/voice/overview.mdx` for voice), and a fix for any FAQ or stale link there that the guide now answers.
- The `fern/llms.txt` bullet: add or repoint, description copied from the page's frontmatter.
- Redirects in `fern/docs.yml` only when the guide consolidates existing pages.
- No changelog entry (documentation work) and no nav yml change (folder-driven nav).

## Before opening the PR

Extract every fenced block and validate it against the pinned SDKs: JSON and YAML parse; bash syntax (`bash -n`); Python `py_compile` and `pyflakes`; TypeScript `tsc --strict` against the installed `@signalwire/sdk`; every SDK method, parameter, and event field checked against the installed package, not only the reference pages. Run each SWML builder chain and diff its output against the hand-written JSON sample beside it. Confirm every internal link against the target's `slug:` and every `#anchor` by hand. Then `yarn fern-md-check`.

PR body sections: `## Summary` (bullets), `## Notes for reviewers` (cross-PR link dependencies, upstream SDK or doc inconsistencies worked around), `## Verification` (the checks above, stated as run), and the preview URLs of every page changed.

*Source: PRs #660, #692, #693 (2026-09), which established the shape. [SW]*
