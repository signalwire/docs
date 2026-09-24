---
paths:
  - "fern/products/*/pages/**/*.mdx"
---

# Capability guides — one capability, every surface

Applies to a how-to that teaches one platform capability across more than one surface (SWML, Relay, the REST Calling API, the Browser SDK, Call Flow Builder). Exemplars: `fern/products/platform/pages/calling/voice/make-and-receive-calls.mdx` (first-run walkthrough, complete samples) and `fern/products/platform/pages/calling/record-calls.mdx` (task sections, merged Relay and REST blocks). A single-surface how-to or an integration guide (the Vapi page) follows `mdx-style` alone. Voice, grounding, and `## Next steps` come from `mdx-style`; this rule fixes the skeleton and the sample conventions so guides match each other.

## Skeleton

Every guide answers the same questions in the same order: which approach fits, how to start, how to do the thing, how to know it worked, where to go next.

```text
frontmatter: title = capability as a noun phrase ("Call streaming"); slug /<area>/<capability>;
             description = one sentence naming the first-run outcome, then each extension in page order
[reference-style link definitions]
intro, 2–3 sentences, no heading: what the reader does, then "Start by <smallest verifiable thing>, then <extensions in H2 order>."
## Choose an approach for <X>          task-based comparison; can be the first step below
## Prepare for <X>
## How <X> works                         (optional — see below)
## <Do the first thing>                  (only for a reader starting from zero — see below)
   <Steps>
   ### Set your credentials and <X>
   ### <topic setup>                     (optional — "Choose a destination", "Run a WebSocket server")
   ### <Do it>                           ("Place the call", "Start the stream")
       <CodeBlocks>                     SDK examples first; cURL after the SDKs
         Python — <SDK client>
         TypeScript — <SDK client>
         cURL — <API>                   keep the direct HTTP example as an alternative
       </CodeBlocks>
   ### <Physical action>                 ("Answer the call", "Answer and speak") — the verification step
   </Steps>
## <Task>                                one per task the guide must cover
   ### <Task> via <surface>              one per surface that supports it
## Examples
   ### <Verb phrase>
   #### <Verb phrase> via <surface>
## Next steps
```

- **Choose an approach.** Help the reader choose where their code runs and how it handles this task. Compare useful distinctions such as hosting, control, events, and user participation. For first-call walkthroughs, put this choice inside `<Steps>` after the prerequisites. See "Approach comparisons" below.
- **Prepare.** "Have these values ready:" then bullets: Space URL, Project ID and API token with the **Voice** permission, a purchased number or verified caller ID, a destination the reader can answer, then topic-specific items. Hard constraints follow as titled `<Warning>`s (trial and international limits, `wss://` only, TCPA). Add one pointer sentence when a reader might want a sibling guide instead.
- **How it works.** Put it before the first run only when the reader can't interpret the result without the model (machine detection's outcome table). Otherwise conceptual depth goes after the first run, as its own `##` ("Handle the audio stream").
- **First run.** A `<Steps>` walkthrough is for a reader starting from zero: a first call, a first stream. A guide that picks up mid-stream (recording assumes you can already place a call) skips `<Steps>` and opens with its first task section. The walkthrough targets the smallest thing the reader can confirm alone, usually calling their own phone: one code block per surface, no options, no error handling.
- **Verification step** closes the `<Steps>`: what the reader hears or sees on success, then the likeliest failure and what it means. A guide without `<Steps>` puts the same check at the end of its first task section. Never skip it.
- **Task sections** are the body of the guide. Name each `##` after what the reader wants ("Record the whole call"), never after the API surface that provides it ("The record_call verb"). One `###` per surface beneath it, surface named in the heading. Options get their own `##` after the task that introduces them ("Recording options: format, stereo, and direction").
- **Track and control** is a task section like any other: REST gets `status_url`/`status_events` and a JSON callback payload; Relay gets `call.on(…)` handlers. One lifecycle diagram per surface family, themed SVG in `<llms-ignore>` with an `<llms-only>` mermaid `sequenceDiagram` twin (`mdx-diagrams`). Add `### Compare the surfaces` when defaults or parameter names differ by surface.
- **Examples** hold the variations you could delete and still have a guide. If removing a section would leave a hole in the main path, it is a task section and belongs above `## Examples`. Each example is `### <Verb phrase>`: one-sentence goal, a titled `<Warning>` when compliance applies, then a `####` per surface.
- **Next steps** is required here as on every guide (`mdx-style`). Cards deepen this capability only.

## Approach comparisons

Use one short table that helps the reader make a concrete choice. Default to one row per approach:

```markdown
| Approach | Useful when | How it handles the task |
|---|---|---|
| Server SDK — REST | A backend request or job starts the operation | Send requests from your server and receive progress at a webhook. |
| Server SDK — Relay | Your server reacts as events arrive | Keep a client running to receive events and send commands over its connection. |
| Browser SDK | A user participates from your web app | Provide media, user controls, and live status updates in the page. |
```

Adapt the rows to the task and verify each claim. For inbound calling, compare the handler, how calls reach it, and where its logic runs. For a narrow task such as recording, columns can instead explain how each approach starts the operation and delivers its result. Include a distinction only when it helps the reader choose or implement a path.

- Use descriptive text instead of red crosses, green checks, availability scores, or blanket "can/can't" cells. Different control models should read as choices, not a ranking of product power.
- Keep the comparison's scope explicit: a direct SDK method, a call handler, a transport, and the complete application are different things. The absence of a convenience method in one SDK does not establish that the task is impossible in a flow involving that SDK.
- Account for composition. A browser client, a Resource, and server call logic can participate in the same flow. When this matters to the choice, explain their roles briefly or link to the relevant flow. Do not label the options as mutually exclusive.
- Describe how the reader accomplishes the task through the supported approach. If an operation belongs to a Resource or server, say so when relevant rather than marking the browser as incapable. Verify that composed path before claiming it works.
- Keep real restrictions precise and visible: name the affected operation, destination, token type, or SDK version. Neutral wording must not hide unsupported behavior or present planned support as available.
- Keep workaround details out of the introductory comparison unless they are necessary for the reader's decision. Do not add a catalog of indirect paths merely to fill every cell.
- Link each approach to its example or reference. SDK builders are ways of authoring SWML, not separate call capabilities; compare hosting and delivery when those are the actual choices.

## Surface names

Canonical names come from the glossary (`/docs/platform/glossary`); the ones this rule uses are `SWML`, `Relay`, `REST Calling API`, `Server SDKs`, `Browser SDK`, `Call Flow Builder`. Never "Realtime SDK", "Agents SDK", "the WebSocket API", or "CFB". How specific to be depends on where the name sits:

- **Headings** name the surface in full: `### Stop recording the call via Relay`, `### Place the call via the REST Calling API`. Two shapes: `<task> via <surface>` when the surface is a transport; `<task> from <place>` when it is a caller context ("Hold an AI chat conversation from a browser"). Every heading stands alone in a search result with no page title above it, so it carries the keywords: "Recording options: format, stereo, and direction", not "Recording options".
- **Tab titles** are short: `REST`, `WebSocket (Relay)`.
- **Code block titles** are `<Language> — <client>`: `Python — Relay client`, `TypeScript — Relay client`, `cURL — REST Calling API`, `Python — SWML builder`, `TypeScript — SWML builder`, `Python — REST client`, `TypeScript — REST client`, `JavaScript — Browser SDK`, `YAML`, `JSON`.

## Surfaces: headings by default, tabs only inside Steps

- A task shows each surface under its own `###`, never in tabs. Headings appear in the table of contents, in search, and in the Markdown export; tab panes hide from all three.
- Inside `<Steps>`, `###` is already the step heading, so a step that differs by surface uses `<Tabs groupId="…">` with `<Tab title="REST">` and `<Tab title="WebSocket (Relay)">`. That is the only place tabs belong. Guides under one overview share a single `groupId` so the reader's choice follows them between pages; the voice guides use `outbound-api`.
- **Relay and the REST Calling API are the same commands over two transports.** When only the transport differs (pausing a recording, stopping a stream), one `### <task> via Relay` heading holds a single `<CodeBlocks>` of `Python — Relay client`, `TypeScript — Relay client`, and `cURL — REST Calling API`. Split them into separate headings only when the flow genuinely differs: placing a call over HTTP with inline SWML is not the same flow as dialing over a live socket.
- **SWML is one surface, authored several ways and delivered several ways.** Under `### <task> via SWML`, show the document once, in the forms a reader authors it, in one `<CodeBlocks>`: `Python — SWML builder` (`SWMLBuilder`) and `TypeScript — SWML builder` (`SwmlBuilder`) first, then `YAML`, then `JSON`. Use builder methods for supported verbs, including nested branches and confirmation instructions. Use `AgentBase` when the example needs its agent features. How the document reaches the call (served from your server, stored as a hosted script resource, passed inline in a REST `dial`) is a delivery choice: cover it once per guide, in the first-run section, and don't repeat it under every task. A REST `dial` that carries inline SWML is SWML delivery, not the REST Calling API surface.
- Where the reference already documents a REST request, place `EndpointRequestSnippet` and `EndpointResponseSnippet` with a link to the reference page after the SDK examples; describe only the fields the task needs. Keep an existing cURL alternative after the SDK blocks. A first-run REST step that dials still ends with the "returns a call `id` and status `queued` … save the `id`" paragraph and `<EndpointResponseSnippet endpoint="POST /api/calling/calls" />`.

## Sample conventions

- **SDK examples first.** For every API operation covered by a supported SDK, lead the explanation with the SDK method and make its example the first visible option. In a shared `<CodeBlocks>`, order Python SDK, TypeScript SDK, then cURL. Keep cURL as the direct HTTP alternative; do not remove it to make SDKs primary. Apply this to setup, resource creation, authentication, call control, and follow-up tasks as well as the first call. Link to the SDK reference before the underlying REST endpoint. If no supported SDK method exists for the documented version, explain the gap and use direct HTTP for that operation. A hosted-script-only step can show YAML and JSON directly because the reader pastes a document into the Dashboard.
- **Complete programs.** Every sample under `<Steps>` and `## Examples` runs as pasted: imports, client setup, the call, and the wait or disconnect. A block under a task section may show only the changed lines, with line highlights (`{6-8}`), when its paragraph names the sample it extends.
- **Header comments** on every complete sample. Python: `# Install: python -m pip install signalwire-sdk==3.4.1` then `# Save as <name>.py and run: python <name>.py`. TypeScript with no type annotations: `// Install: npm install @signalwire/sdk@2.0.5` then `// This sample also runs as JavaScript: save as <name>.mjs,` / `// then run: node <name>.mjs`. TypeScript that uses types: `// Save as <name>.mts and run: npx tsx <name>.mts`. Browser: `// Install: npm install @signalwire/js@4.0.0-rc.2 rxjs@7.8.2` plus the HTML elements the script expects, as comments.
- **Pinned versions** are literal and identical across every guide: `signalwire-sdk==3.4.1`, `@signalwire/sdk@2.0.5`, `@signalwire/js@4.0.0-rc.2 rxjs@7.8.2`. Bump them in every guide in one PR, never one page at a time.
- **Placeholders**: `<YOUR_SPACE>`, `<YOUR_PROJECT_ID>`, `<YOUR_API_TOKEN>`, `<YOUR_CALLER_ID>`, `<YOUR_DESTINATION>`, `<YOUR_STATUS_WEBHOOK_URL>`, `<YOUR_CALL_ID>`; new ones follow the same `<YOUR_…>` shape. Explain them once, in a `| Value | Replace with |` table before the first code block.
- **Relay boilerplate**: `contexts=["default"]`, `timeout: 30` on the phone device, Python `async with client:` and `await call.wait_for_ended()`, TypeScript `await client.connect()` / `try … finally { await client.disconnect(); }` and `await call.waitForEnded()`. Hang up in an `on_completed`/`onCompleted` callback guarded by `call.state !== "ended"`.
- **Builder gaps**: when the SDK's SWML builder lacks a verb, say so in a comment and use `add_verb`/`addVerb` with validation off for that verb only. Don't silently hand-write JSON where the builder works.
- **Running example**: `Bayview Taxi` and its dispatcher `Ada` when the scenario has a business voice; a plain "Hello, welcome to SignalWire!" for pure mechanics (`mdx-style` Grounding).

## Ships with the page

- A `<Card>` on the parent overview (`fern/products/platform/pages/calling/voice/overview.mdx` for voice), and a fix for any FAQ or stale link there that the guide now answers.
- The `fern/llms.txt` bullet: add or repoint, description copied from the page's frontmatter.
- Redirects in `fern/redirects.yml` only when the guide consolidates existing pages.
- No changelog entry (documentation work). A nav yml entry only where the folder isn't folder-driven (`platform.yml` lists `pages/calling/` pages explicitly).

## Before opening the PR

Extract every fenced block and validate it against the pinned SDKs: JSON and YAML parse; bash syntax (`bash -n`); Python `py_compile` and `pyflakes`; TypeScript `tsc --strict` against the installed `@signalwire/sdk`; every SDK method, parameter, and event field checked against the installed package, not only the reference pages. Run each SWML builder chain and diff its output against the hand-written JSON sample beside it. Confirm every internal link against the target's `slug:` and every `#anchor` by hand. Then `yarn fern-md-check`.

PR body sections: `## Summary` (bullets), `## Notes for reviewers` (cross-PR link dependencies, upstream SDK or doc inconsistencies worked around), `## Verification` (the checks above, stated as run), and the preview URLs of every page changed.

*Sources: PRs #640 (write-guides template, record calls, AI chat), #660, #692, #693 (2026-09), reconciled 2026-09-16. [SW]*
