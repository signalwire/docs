# Documentation changes for Support — 2026-08-18

Covers documentation merged between 2026-08-11 and 2026-08-18.
3 new or changed capabilities, 1 correction or move.

Entries marked **New** also appear on the public [changelog](/docs/platform/changelog).
Entries marked **Changed** are internal-only: corrections to things the docs
previously got wrong, and pages that moved to a new URL.

## apis

- **New — Webhook reference pages document the expected response** ([#579](https://github.com/signalwire/docs/pull/579))

  Webhooks were remodeled as TypeSpec operations, so each webhook's OpenAPI entry now carries a response schema instead of a hardcoded 200 acknowledgment. Reader-visible: the SWAIG family's return contract (tool webhook, signature request) renders as a schema with examples instead of prose, and amazon_bedrock's data_map output is documented as narrower than the canonical Output (string-only response, actions always deferred). Compatibility API webhooks also moved into their own spec section. If a customer asks what to return from a SWAIG webhook, the reference now answers it structurally.



- **New — Chat with an AI agent over the REST API** ([#572](https://github.com/signalwire/docs/pull/572))

  Documents POST /api/ai/chat (JSON-RPC: one path, six methods discriminated on a body field, following the Calling API pattern). New spec family specs/signalwire-rest/ai-api renders the endpoint reference at /docs/apis/rest/ai-chat/chat-methods per the PR body. Requires the chat token scope. New Python SDK reference pages for AIChatClient (server-side client) and ChatGateway (browser-facing proxy so pages never hold an API token), each with per-method subpages. Chat conversations reuse the existing SWAIG and post-prompt webhook payloads — same shapes, different values.

  - added: [AIChatClient](/docs/server-sdks/reference/python/agents/ai-chat-client)
  - added: [ChatGateway](/docs/server-sdks/reference/python/agents/chat-gateway)

- **New — AI post-prompt and debug webhooks fully documented** ([#571](https://github.com/signalwire/docs/pull/571))

  Beyond the new definitions, five factual errors in the old hand-maintained post-prompt field list are corrected — the docs previously said: content_type is "text/swaig" (actually "text/json"), content_disposition is "Conversation Log" (actually "agent.summary"), a caller_id_num field (actually caller_id_number), a version: "2.0" key (does not exist), and call_log typed object (actually an array of objects). The debug envelope description also wrongly claimed exactly one event key beside call_info; one moment can produce several. Customers with handlers built against the old docs may hit these. debug_webhook_level is also clarified: setting debug_webhook_url turns the stream on, the level only thins it, and level 2 adds the high-volume conversation_add/llm_request/llm_response events.

  - modified: [ai](/docs/swml/reference/calling/ai)
  - modified: [params](/docs/swml/reference/calling/ai/params)
  - modified: [amazon_bedrock](/docs/swml/reference/calling/amazon-bedrock)

- **Changed — Webhook reference pages move to a top-level Webhooks section** ([#575](https://github.com/signalwire/docs/pull/575))

  All 14 REST reference webhook pages changed URL: they moved out of per-resource locations (for example the ten Calling webhooks under Calls, at /docs/apis/rest/calls/webhooks/*) into a new top-level Webhooks section with AI, Calling, and Messaging groups. AI is its own group because the same payloads fire for voice, Bedrock, sidecar, and chat. Any webhook reference link shared with a customer before 2026-08-13 points at the old location — fern/docs.yml gained 49 lines in this PR, likely redirects, but verify one old URL before resending it.


