# Documentation changes — 2026-08-27

Covers documentation merged between 2026-08-18 and 2026-08-27.
3 new or changed capabilities, 3 corrections and moves.

Entries marked **New** also appear on the public [changelog](/docs/platform/changelog).
Entries marked **Changed** stay internal: corrections to things the docs
previously got wrong, pages that moved, and gaps that were filled.

## apis

- **Changed — REST reference shows compact examples for SWML and AI payloads** ([#621](https://github.com/signalwire/docs/pull/621))

  The Fabric AI Agent REST schema is now shallow: it no longer inlines every SWML ai property, and points to /docs/swml/reference/calling/ai for the complete contract. The full Calling and Messaging SWML schemas stay in the OpenAPI files as unreferenced components (a service-level SWMLDocument union). If a customer asks where the AI Agent properties went in the API reference, the configuration contract now lives on the SWML ai page; the REST pages carry compact examples instead (77 added across the affected operations).



## platform

- **New — AI section adds analytics and quickstart guides** ([#568](https://github.com/signalwire/docs/pull/568))

  New pages: /docs/platform/ai/analytics and /docs/platform/ai/quickstart. Removed pages: the AI platform capabilities page (slug /ai/capabilities), the no-code agents page, and the prompt-engineering subpages best-practices and prompt-areas — their content was consolidated into the rewritten overview (now titled "System-directed AI"), prompt-engineering, and best-practices pages. fern/docs.yml gained 18 lines in this PR, likely redirects for the removed slugs, but verify an old link before resending one to a customer.

  - added: [Conversation analytics](/docs/platform/ai/analytics)
  - added: [Quickstart](/docs/platform/ai/quickstart)
  - modified: [System-directed AI](/docs/platform/ai)
  - modified: [Prompt engineering](/docs/platform/ai/prompt-engineering)
  - modified: [Handling sensitive content](/docs/platform/ai/content-redaction)

- **Changed — Google Cloud voice examples now include the engine prefix** ([#616](https://github.com/signalwire/docs/pull/616))

  Examples previously showed bare voice IDs (en-GB-Wavenet-A instead of gcloud.en-GB-Wavenet-A). A bare ID only works while it matches the platform default engine, which can change — customers who copied the old examples may have configurations that work by luck and break when the default moves. Follow-up to the sweep in #578/#577.

  - modified: [Google Cloud](/docs/platform/voice/tts/gcloud)

## swml

- **New — New SWML reference for ai.multilingual** ([#578](https://github.com/signalwire/docs/pull/578))

  New page for ai.multilingual, modeled field-by-field against source. multilingual and languages are mutually exclusive: when both are set, SignalWire uses multilingual and ignores languages. Corrections in the same PR: params.languages_enabled previously claimed to enable multilingualism when it only toggles handling of the languages array; default-engine assertions were removed (the default can change, so users needing a specific engine must declare it); a broken #providers anchor was fixed. Caveat for API questions: multilingual appears on the Fabric AI Agent REST schemas because AIAgent derives from the SWML ai object, but the Fabric API silently drops it today (like global_data and post_prompt_url) — tracked in #594.

  - added: [multilingual](/docs/swml/reference/calling/ai/multilingual)
  - modified: [languages](/docs/swml/reference/calling/ai/languages)
  - modified: [params](/docs/swml/reference/calling/ai/params)
  - modified: [ai](/docs/swml/reference/calling/ai)

- **New — Verify SWML request signatures** ([#527](https://github.com/signalwire/docs/pull/527))

  The X-Signalwire-Signature header has been sent on SWML document fetches for some time and is verifiable with the existing validateRequest helper, but the SWML docs never mentioned it — only the Compatibility API and generic Platform pages did. Customers serving SWML from their own servers can now be pointed at /docs/swml/guides/webhook-security for verification, including which requests are signed.

  - added: [Verify SWML request signatures](/docs/swml/guides/webhook-security)
  - modified: [Handle incoming calls from code](/docs/swml/guides/remote-server)

- **Changed — Four SWML method keys marked required** ([#593](https://github.com/signalwire/docs/pull/593))

  These four pages rendered the top-level ParamField without required={true}, so the method key looked optional when the schema requires it. A sweep of all 113 schema-required top-level keys found these four pages and no others. If a customer built against the pages before this fix, their SWML was already required to carry the key — the docs were wrong, not the behavior.

  - modified: [answer](/docs/swml/reference/calling/answer)
  - modified: [stop_stream](/docs/swml/reference/calling/stop-stream)
  - modified: [transcribe](/docs/swml/reference/calling/transcribe)
  - modified: [transcribe_stop](/docs/swml/reference/calling/transcribe-stop)
