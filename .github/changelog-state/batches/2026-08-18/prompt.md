## Role

You are tiering merged documentation pull requests for SignalWire's developer
documentation. Each PR gets exactly one tier, which decides who hears about it.

## Tiers

**notable** — published to the public customer-facing changelog AND both internal
Slack digests. Reserve this for changes a customer building on SignalWire would
want to know about:
- A new page, guide, or tutorial.
- A new endpoint, method, field, or parameter appearing in the API or SWML reference.
- A documented behavior change, new limit, or changed default.
- A deprecation or removal.

**minor** — internal Support digest only. Support needs these to answer tickets;
customers do not get a card for them:
- A corrected factual error (wrong type, wrong default, wrong enum value, wrong
  description). Support must know the docs previously said something wrong.
- A page that moved, was renamed, or got a new slug — any URL change, because
  Support may have shared the old link.
- A substantive change to an example or code sample: it previously did not run,
  used the wrong parameter, or now demonstrates a different approach.
- A clarification that changes what a reader would conclude.

**skip** — nobody hears about it:
- Typos, spelling, grammar, punctuation, capitalization.
- Formatting, whitespace, heading levels, table or component markup.
- Broken-link fixes and link target updates.
- Rewording that does not change meaning: tightening prose, cutting filler,
  style-guide compliance, voice fixes.
- Tooling, CI, scripts, dependencies, build configuration.
- Regenerated build artifacts with no underlying source change.
- `.draft` files, and any page not yet wired into navigation.
- Internal refactors: moving content between files with no reader-visible change.

## Steps

1. Read the PR title, body, and the changed files with their diffs.
2. Ask what a customer reading the docs would *newly be able to do or know*.
   If the answer is nothing, the tier is `skip` or `minor`, never `notable`.
3. Ask whether the docs previously told someone something false, or whether a URL
   changed. If so, the tier is at least `minor`.
4. Assign the single highest tier justified by the change. One PR that adds a new
   guide and also fixes six typos is `notable` — describe the guide, ignore the typos.

## Worked examples

- Adds `fern/products/calling/pages/guides/port-numbers.mdx`, a new guide.
  → **notable**. "New guide: porting numbers with E911."

- Adds a `codecs` field to a SIP endpoint model in `specs/**/*.tsp`.
  → **notable**. A new field in the reference is a new capability to a reader.

- Changes a documented default from `30s` to `60s` in the reference.
  → **notable**. Behavior change; readers may have built around the old value.

- Corrects a parameter documented as `string` that is actually an object.
  → **minor**. The docs were wrong and Support needs to know, but this is not a
  new capability and does not belong on the public timeline.

- Moves a page from `/docs/ai/tool-calling` to `/docs/swml/ai/tool-calling`.
  → **minor**. URL change; Support may have sent customers the old link.

- Rewrites an intro paragraph to cut "In this guide you will learn" and drop the
  editorial "we".
  → **skip**. Style compliance; nothing a reader concludes differently.

- Fixes 12 broken links flagged by the link checker.
  → **skip**. Even at volume, this reaches nobody.

- Rewrites a warning from "this may take a while" to "this takes up to 30 seconds".
  → **minor**. Vague became specific, so a reader now concludes something they
  could not before. Not `skip`, despite reading like a reword.

- Updates `.github/workflows/check-links.yml` and `scripts/check-links.js`.
  → **skip**. Tooling.

## Narrowing

Default to the *lower* tier when genuinely torn. Over-reporting trains people to
ignore the digest, which is the failure mode this pipeline exists to avoid. Set
`confidence` below 0.7 whenever you are unsure, and say why in `reasoning` —
a human reviews every tier call before anything is published.

## Input

These pull requests merged into `main` in the SignalWire documentation repo
between 2026-08-11 and 2026-08-18.

Every URL you may cite is given to you below, read from the page's own
`slug:` frontmatter. **Never construct, guess, or infer a documentation URL.**
If a changed file has no URL listed, set that page's `url` to `null` and do not
put a link in `entry_body`. Reference-page URLs in particular are generated from
spec operation IDs and cannot be derived by hand.

Writing constraints for `entry_title` and `entry_body` — these are published to
customers on a public page:
- Sentence-case titles, no end punctuation. Name the change, never the week.
- Second person, present tense, active voice. No editorial "we".
- No marketing adjectives (powerful, seamless, robust), no emoji, no "simply".
- Do not describe the pull request or the repository. Describe what the reader
  can now do or now knows.

### PR #604 — Add Google Analytics tag

Author: Devon-White · Merged: 2026-08-18T17:18:59Z · 1 docs files changed

## Summary

- configure the Google Analytics 4 measurement ID in Fern docs

## Validation

- parsed `fern/docs.yml` successfully and verified the configured measurement ID
- `git diff --check`
- `yarn fern-check` *(blocked by Fern registry HTTP 403 during the published redirects check)*

Changed files:
- **modified** `fern/docs.yml` (+4/-0)
```diff
@@ -28,6 +28,10 @@ agents:
     For a complete index of all SignalWire documentation pages, fetch
     https://signalwire.com/docs/llms.txt
 
+analytics:
+  ga4:
+    measurement-id: G-5LFTNYK9JK
+
 experimental:
   ai-examples: false
   mdx-components:
```

---

### PR #579 — refactor(specs): model webhooks as TypeSpec operations

Author: Devon-White · Merged: 2026-08-14T12:30:17Z · 29 docs files changed

## Why

Our `@webhook` decorator took a payload `Model` and hand-assembled the OpenAPI `webhooks` entry, with a hardcoded `responses: { 200: { description: "Webhook received" } }`. That shape can only ever describe the request SignalWire *sends*. It has no way to describe the reply — which is fine for a status callback, where a 2xx ack is the whole contract, but wrong for the SWAIG family, where we **parse** what your endpoint returns. That return contract existed only as `@doc` prose, so it never became a schema, an example, or anything Fern could render.

OpenAPI 3.1 models both directions on a webhook (a Path Item's `requestBody` is what the provider sends; its `responses` is what the subscriber must return). We were using half of it.

## What changed

Webhooks are now real TypeSpec operations. An `op` already carries a request body, a return type, headers, and status codes — so the response side comes for free, and the decorator drops to a bare marker:

```typespec
@webhook
@operationId("ai_swaig_tool_webhook")
@summary("AI SWAIG tool webhook")
@post
op aiSwaigToolWebhook(@body payload: AiSwaigToolWebhookPayload): SwaigToolWebhookResponse;
```

This is the shape TypeSpec has signposted in [microsoft/typespec#4736](https://github.com/microsoft/typespec/issues/4736) — *"decorator indicating operation is a webhook"*. That issue is open, `design:needed`, `lib:http`, milestone **Backlog**, untouched by maintainers since Oct 2024 (three "any updates?" comments, latest June 2026

Changed files:
- **removed** `specs/_shared/webhook/decorator.tsp` (+0/-123)
```diff
@@ -1,123 +0,0 @@
-import "@typespec/openapi";
-import "./decorator.js";
-
-using TypeSpec.Reflection;
-using TypeSpec.OpenAPI;
-
-/** Tag specification for a webhook — either a plain name or name with metadata. */
-model WebhookTag {
-  /** The tag name. */
-  name: string;
-
-  /** A description of the tag. */
-  description?: string;
-
-  /** External documentation for the tag. */
-  externalDocs?: ExternalDocs;
-}
-
-/**
- * Attach an OpenAPI webhook definition to the service namespace.
- *
- * Produces a fully-formed entry in the OpenAPI `webhooks` object with an
- * inline JSON schema derived from the payload model. No post-processing
- * scripts or `$ref` resolution required — the output is valid OpenAPI 3.1.
- *
- * ## Targets
- *
- * | Target | Use case |
- * |--------|----------|
- * | **ModelProperty** | Colocate the webhook with the field that configures it (e.g., `status_url`). The webhook is attached to the service namespace automatically. |
- * | **Namespace** | Attach a webhook directly to the service namespace for events not tied to a specific request field. |
- *
- * ## Metadata from standard decorators
- *
- * The decorator reads metadata from standard TypeSpec d
```
- **added** `specs/compatibility-api/webhooks/main.tsp` (+157/-0)
```diff
@@ -0,0 +1,157 @@
+import "@typespec/http";
+import "@typespec/openapi";
+import "@signalwire/typespec-webhook";
+import "../../_shared/webhook-ack.tsp";
+import "../tags.tsp";
+import "../calls/models/webhooks.tsp";
+import "../messages/models/webhooks.tsp";
+import "../transcriptions/models/webhooks.tsp";
+import "../incoming-phone-numbers/models/webhooks.tsp";
+
+using TypeSpec.Http;
+using TypeSpec.OpenAPI;
+using SignalWire.Webhook;
+
+// Webhooks are collected here rather than on the resources that configure them
+// because they cannot live under a routed namespace: the Compatibility API's
+// resource namespaces carry an `/Accounts/{AccountSid}/...` route, and a webhook
+// has no path to hang off. Each operation keeps its own @tag so it still files
+// under the resource it belongs to.
+//
+// SignalWire is the caller here, not the callee, so the service's auth scheme
+// does not apply.
+@useAuth(NoAuth)
+namespace CompatibilityAPI.Webhooks;
+
+@summary("Voice status callback")
+@doc("""
+  Payload sent by SignalWire to your Voice Status Callback URL when the status of a call changes.
+  
+  Configure this callback using the `StatusCallback` and `StatusCallbackEvent` para
```
- **modified** `specs/signalwire-rest/webhooks/ai/main.tsp` (+204/-21)
```diff
@@ -1,31 +1,214 @@
-import "../../../_shared/webhook/decorator.tsp";
+import "@typespec/http";
+import "@typespec/openapi";
 import "../tags.tsp";
 import "./models/common.tsp";
 import "./models/swaig.tsp";
 import "./models/post-prompt.tsp";
 import "./models/debug.tsp";
 import "./models/sidecar.tsp";
+import "@signalwire/typespec-webhook";
+import "../../../_shared/webhook-ack.tsp";
 
+using TypeSpec.Http;
 using TypeSpec.OpenAPI;
+using SignalWire.Webhook;
 
-@webhook("aiSwaigToolWebhook", AiSwaigToolWebhookPayload, AI_WEBHOOKS_TAG)
-@webhook("swaigSignatureRequest", SwaigSignatureRequestPayload, AI_WEBHOOKS_TAG)
-@webhook("aiPostPromptCallback", AiPostPromptCallbackPayload, AI_WEBHOOKS_TAG)
-@webhook("aiDebugWebhook", AiDebugWebhookPayload, AI_WEBHOOKS_TAG)
-@webhook(
-  "bedrockSwaigToolWebhook",
-  BedrockSwaigToolWebhookPayload,
-  AI_WEBHOOKS_TAG
-)
-@webhook(
-  "bedrockPostPromptCallback",
-  BedrockPostPromptCallbackPayload,
-  AI_WEBHOOKS_TAG
-)
-@webhook("aiSidecarCallback", AISidecarCallbackPayload, AI_WEBHOOKS_TAG)
-@webhook(
-  "aiSidecarSwaigToolWebhook",
-  AISidecarSwaigToolWebhookPayload,
-  AI_WEBHOOKS_TAG
-)
+// SignalWire is the caller here, not the callee 
```
- **modified** `specs/signalwire-rest/webhooks/messaging/main.tsp` (+87/-16)
```diff
@@ -1,23 +1,94 @@
-import "../../../_shared/webhook/decorator.tsp";
+import "@typespec/http";
+import "@typespec/openapi";
 import "../tags.tsp";
 import "./models/status-callbacks.tsp";
 import "./models/inbound-message.tsp";
+import "@signalwire/typespec-webhook";
+import "../../../_shared/webhook-ack.tsp";
+import "../../../swml/messaging";
 
+using TypeSpec.Http;
 using TypeSpec.OpenAPI;
+using SignalWire.Webhook;
 
-@webhook(
-  "messageStatusCallback",
-  MessageStatusCallbackPayload,
-  MESSAGING_WEBHOOKS_TAG
-)
-@webhook(
-  "tenDlcStatusCallback",
-  TenDlcStatusCallbackPayload,
-  MESSAGING_WEBHOOKS_TAG
-)
-@webhook(
-  "inboundMessageWebhook",
-  InboundMessageWebhookPayload,
-  MESSAGING_WEBHOOKS_TAG
-)
+// SignalWire is the caller here, not the callee — these operations describe
+// requests we send to the customer's endpoint, so the service's own auth scheme
+// does not apply to them.
+@tag(MESSAGING_WEBHOOKS_TAG)
+@useAuth(NoAuth)
 namespace SignalWireAPI.Webhooks.Messaging;
+
+@summary("SWML inbound message webhook")
+@doc("""
+  Payload sent by SignalWire to a SWML messaging webhook URL when an inbound SMS or MMS message arrives on a phone number configured with a
```
- **added** `specs/swml/calling/Methods/amazon_bedrock/swaig/data_map.tsp` (+85/-0)
```diff
@@ -0,0 +1,85 @@
+import "@typespec/json-schema";
+import "../../ai/swaig/functions/data_map";
+
+using TypeSpec.JsonSchema;
+
+namespace SWML.Calling;
+
+// Bedrock runs its own data_map evaluator (`bedrock_process_data_map`), which
+// reads the result with a string-only accessor and always defers actions rather
+// than honouring `post_process`. So its outputs are `BedrockOutput`, not the
+// canonical `Output`.
+//
+// The Pick list below is this surface's to maintain: when `Output` gains a
+// property, Bedrock keeps its current shape until someone confirms Bedrock reads
+// the new field and adds it here. That is the safe direction — an allowlist
+// cannot silently claim support that does not exist.
+//
+// The DataMap models re-point only the properties that carry an output and
+// inherit the rest, so structural changes on the `ai` side still arrive free.
+
+@summary("Bedrock output object")
+@doc("""
+  The result of a SWAIG function run by an
+  [`amazon_bedrock`](/docs/swml/reference/calling/amazon-bedrock) agent.
+  
+  Narrower than the canonical [`Output`](/docs/swml/reference/calling/ai/swaig/functions/data-map):
+  Bedrock reads `response` as a plain string, and de
```
- **added** `specs/_shared/webhook-ack.tsp` (+8/-0)
- **modified** `specs/compatibility-api/calls/models/requests.tsp` (+0/-3)
- **modified** `specs/compatibility-api/calls/models/webhooks.tsp` (+0/-42)
- **modified** `specs/compatibility-api/incoming-phone-numbers/models/requests.tsp` (+0/-1)
- **modified** `specs/compatibility-api/incoming-phone-numbers/models/webhooks.tsp` (+0/-15)
- **modified** `specs/compatibility-api/main.tsp` (+1/-0)
- **modified** `specs/compatibility-api/messages/models/requests.tsp` (+0/-1)
- **modified** `specs/compatibility-api/messages/models/webhooks.tsp` (+0/-30)
- **modified** `specs/compatibility-api/transcriptions/main.tsp` (+0/-1)
- **modified** `specs/compatibility-api/transcriptions/models/webhooks.tsp` (+0/-14)
- **added** `specs/emitters/typespec-webhook/lib/decorators.tsp` (+62/-0)
- **added** `specs/emitters/typespec-webhook/lib/main.tsp` (+2/-0)
- **modified** `specs/signalwire-rest/calling-api/main.tsp` (+0/-1)
- **modified** `specs/signalwire-rest/webhooks/ai/models/debug.tsp` (+0/-17)
- **modified** `specs/signalwire-rest/webhooks/ai/models/post-prompt.tsp` (+0/-37)

And 9 more changed files, not shown individually:
- 2 files under `specs/signalwire-rest/webhooks/ai/models/`
- 2 files under `specs/signalwire-rest/webhooks/calling/models/`
- 2 files under `specs/signalwire-rest/webhooks/messaging/models/`
- 1 file under `specs/signalwire-rest/webhooks/calling/`
- 1 file under `specs/swml/calling/Methods/ai/swaig/functions/data_map/`
- 1 file under `specs/swml/calling/Methods/amazon_bedrock/swaig/`

---

### PR #575 — Webhooks: give webhooks their own top-level section

Author: Devon-White · Merged: 2026-08-13T16:05:52Z · 46 docs files changed

## Why

Webhook reference pages are filed under the resource whose OpenAPI tag they inherited, so all ten Calling webhooks sit under **Calls**. That never matched how the payloads are used: a SWAIG tool webhook fires for voice AI, Amazon Bedrock, sidecar agents, and — with the AI chat API (#572) — text conversations, all with the same body. Filing one shared payload under a single channel makes every other caller link sideways into Calls. `chat.mdx` on that branch already links `/docs/apis/rest/calls/webhooks/ai-swaig-tool-webhook` from a page about text conversations.

## What changed

Webhooks group by channel now, in the nav and on disk. Directory, tag, and nav section all carry the same name.

| Channel | Count | Pages |
|---|---|---|
| AI | 8 | SWAIG tool + signature request, post-prompt, debug, Bedrock tool + post-prompt, sidecar callback + sidecar tool |
| Calling | 3 | inbound call webhook, transcript status, stream status |
| Messaging | 3 | inbound message webhook, message status, 10DLC status |

AI is its own group because it spans the channels — that is the reason for the split. Everything else sits under the channel it serves, including the SWML document-fetch webhooks (a call fetch is Calling, a message fetch is Messaging).

**Source layout** — new `specs/signalwire-rest/webhooks/`, a peer of the service dirs, one directory per channel with its own tag. Replaces the four scattered `models/webhooks.tsp` files; the 2000-line calling one becomes five topical files 

Changed files:
- **removed** `specs/signalwire-rest/calling-api/calls/models/webhooks.tsp` (+0/-2000)
```diff
@@ -1,2000 +0,0 @@
-import "../../../../_shared/webhook/decorator.tsp";
-import "../../../types";
-
-namespace SignalWireAPI.Calling;
-
-@summary("Transcript status callback")
-@doc("""
-  Sent to your `status_url` when the call's transcription is ready.
-  `calling.transcript.completed` includes the transcribed text;
-  `calling.transcript.failed` means the call could not be transcribed.
-
-  Status callbacks are advisory, best-effort notifications — delivery can be delayed or fail silently, so don't gate time-critical actions on receiving one. See [Status callback reliability](/docs/platform/webhooks#status-callback-reliability).
-  """)
-model TranscribeStatusCallbackPayload {
-  @doc("Whether the transcription completed or failed.")
-  @example("calling.transcript.completed")
-  event_type: "calling.transcript.completed" | "calling.transcript.failed";
-
-  @doc("When the event was sent, as a Unix timestamp in seconds.")
-  @example(1777565701.5623918)
-  timestamp: float;
-
-  @doc("Your project ID.")
-  @example("4d0d6f16-5881-4fcc-92a4-02c51a91954d")
-  project_id: uuid;
-
-  @doc("Your Space ID.")
-  @example("451ed9ff-e568-4222-8af9-4f9ab7428d09")
-  space_id: uuid;
-
-  @d
```
- **added** `specs/signalwire-rest/webhooks/ai/models/debug.tsp` (+822/-0)
```diff
@@ -0,0 +1,822 @@
+import "./common.tsp";
+
+namespace SignalWireAPI.Webhooks.AI;
+
+@doc("Where in the agent's flow an event happened.")
+model AIDebugFlowLocation {
+  @doc("The context the agent was in. `default` when you define no contexts.")
+  @example("default")
+  context: string;
+
+  @doc("The step the agent was on. Included only when the context defines steps.")
+  @example("collect_address")
+  step?: string;
+
+  @doc("The step's index. Included only when the context defines steps.")
+  @example(2)
+  step_index?: integer;
+}
+
+@summary("AI debug webhook")
+@doc("""
+  A diagnostic feed for a call that is still in progress. Set `debug_webhook_url` on your agent and
+  every step it takes is posted to that URL as it happens: speech recognized, model called, tool
+  invoked, context switched, error hit. Use it to work out why a call went the way it did — which
+  tool the agent reached for, what came back, where a turn went wrong — or to react while the call is
+  still live, such as paging a supervisor.
+  
+  Each request carries `call_info` plus one or more event properties, where the property name is the
+  event. One moment can produce several: evaluating a `data_m
```
- **added** `specs/signalwire-rest/webhooks/ai/models/post-prompt.tsp` (+458/-0)
```diff
@@ -0,0 +1,458 @@
+import "./common.tsp";
+
+namespace SignalWireAPI.Webhooks.AI;
+
+@doc("""
+  The answer an AI agent gave to your
+  [`post_prompt`](/docs/swml/reference/calling/ai), in three forms.
+  """)
+model AIPostPromptData {
+  @doc("""
+    Every JSON object found in the answer, parsed. An empty array when the agent answered in prose.
+    Ask the post-prompt for named JSON keys when you want to count outcomes.
+    """)
+  @example(#[#{ intent: "book_ride", resolved: true }])
+  parsed: Record<unknown>[];
+
+  @doc("The answer exactly as the agent produced it.")
+  @example("{\"intent\":\"book_ride\",\"resolved\":true}")
+  raw: string;
+
+  @doc("""
+    The answer with the JSON removed, leaving only the surrounding prose. Omitted when the answer was
+    JSON and nothing followed it.
+    """)
+  @example("Caller booked a ride to the airport.")
+  substituted?: string;
+}
+
+@doc("""
+  One event on the call, in order. Beyond `type`, an entry carries the fields belonging to that type.
+  """)
+model AICallTimelineEntry is Record<unknown> {
+  @doc("""
+    What happened. `user_input`, `ai_response`, and `tool_result` cover the conversation; `pronounce`
+    and `text
```
- **added** `specs/signalwire-rest/webhooks/ai/models/sidecar.tsp` (+163/-0)
```diff
@@ -0,0 +1,163 @@
+import "./common.tsp";
+
+namespace SignalWireAPI.Webhooks.AI;
+
+@doc("""
+  The kind of AI sidecar callback. See the
+  [SWML ai_sidecar reference](/docs/swml/reference/calling/ai-sidecar#callback-types)
+  for the type-specific fields each one carries.
+  """)
+enum AISidecarCallbackType {
+  @doc("The sidecar attached to the call.")
+  start,
+
+  @doc("The customer finished a turn and an evaluation is about to run.")
+  turn,
+
+  @doc("The sidecar called the model.")
+  request,
+
+  @doc("The model produced intermediate reasoning text.")
+  thought,
+
+  @doc("The sidecar's advice for the agent.")
+  insight,
+
+  @doc("The model called the built-in `sidecar_skip` tool to stay silent for this turn.")
+  skip,
+
+  @doc("The model called one of your tools.")
+  tool_call,
+
+  @doc("One of your tools returned a result.")
+  tool_result,
+
+  @doc("A SWAIG action was returned (and, if enabled, executed).")
+  action,
+
+  @doc("A `set_global_data` / `unset_global_data` action changed `global_data`.")
+  global_data_change,
+
+  @doc("The conversation history was trimmed to fit the token budget.")
+  history_pruned,
+
+  @doc("Something failed, or an anti-loo
```
- **added** `specs/signalwire-rest/webhooks/ai/models/swaig.tsp` (+329/-0)
```diff
@@ -0,0 +1,329 @@
+import "./common.tsp";
+
+namespace SignalWireAPI.Webhooks.AI;
+
+@summary("SWAIG function signature request")
+@doc("""
+  Sent once per [`SWAIG.includes`](/docs/swml/reference/calling/ai/swaig/includes) entry when an AI
+  agent loads, to discover the functions your server hosts. Every way of building an agent sends it —
+  SWML you write yourself, SWML a Server SDK generates, or an agent you configure in your Dashboard —
+  because they all resolve `includes` the same way. Return a JSON array of function definitions, each
+  shaped like an entry in
+  [`SWAIG.functions`](/docs/swml/reference/calling/ai/swaig/functions#properties) — `function`,
+  `description`, and `parameters`. Functions the agent can call are the ones you return here.
+  
+  This is not the payload a function call sends. It goes to the `includes` entry's `url`, using
+  `auth_user` and `auth_password` when set. Your endpoint can also receive it outside of a call, as a
+  check that it answers, so answer it the same way. When your project has a signing key, the request
+  carries an `X-SignalWire-Signature` header you can verify.
+  """)
+model SwaigSignatureRequestPayload {
+  @doc("What the
```
- **modified** `fern/docs.yml` (+49/-0)
- **modified** `fern/products/apis/apis.yml` (+35/-28)
- **modified** `fern/products/platform/pages/ai/guides/tool-calling/index.mdx` (+2/-2)
- **modified** `fern/products/platform/pages/platform/core/webhooks/index.mdx` → /docs/platform/webhooks ("Webhooks") (+2/-2)
- **modified** `fern/products/swml/pages/reference/methods/calling/ai/ai_params/index.mdx` → /docs/swml/reference/calling/ai/params ("params") (+1/-1)
- **modified** `fern/products/swml/pages/reference/methods/calling/ai/ai_swaig/functions/index.mdx` → /docs/swml/reference/calling/ai/swaig/functions ("functions") (+2/-2)
- **modified** `fern/products/swml/pages/reference/methods/calling/ai/ai_swaig/includes/index.mdx` → /docs/swml/reference/calling/ai/swaig/includes ("includes") (+1/-1)
- **modified** `fern/products/swml/pages/reference/methods/calling/ai/index.mdx` → /docs/swml/reference/calling/ai ("ai") (+1/-1)
- **modified** `fern/products/swml/pages/reference/methods/calling/ai_sidecar/index.mdx` → /docs/swml/reference/calling/ai-sidecar ("ai_sidecar") (+2/-2)
- **modified** `fern/products/swml/pages/reference/methods/calling/bedrock/index.mdx` → /docs/swml/reference/calling/amazon-bedrock ("amazon_bedrock") (+1/-1)
- **modified** `fern/products/swml/pages/reference/methods/calling/bedrock/swaig/functions/index.mdx` → /docs/swml/reference/calling/amazon-bedrock/swaig/functions ("functions") (+2/-2)
- **modified** `fern/products/swml/pages/reference/methods/calling/send_sms.mdx` → /docs/swml/reference/calling/send-sms ("send_sms") (+1/-1)
- **modified** `fern/products/swml/pages/reference/methods/calling/stream.mdx` → /docs/swml/reference/calling/stream ("stream") (+1/-1)
- **modified** `fern/products/swml/pages/reference/methods/calling/transcribe.mdx` → /docs/swml/reference/calling/transcribe ("transcribe") (+1/-1)
- **modified** `fern/products/swml/pages/reference/methods/messaging/overview.mdx` → /docs/swml/reference/messaging ("Messaging SWML overview") (+1/-1)

And 26 more changed files, not shown individually:
- 2 files under `fern/products/swml/pages/reference/methods/messaging/`
- 2 files under `specs/signalwire-rest/fabric-api/swml-webhook/models/`
- 2 files under `specs/signalwire-rest/message-api/messages/models/`
- 2 files under `specs/signalwire-rest/relay-rest/campaign-registry/models/`
- 2 files under `specs/signalwire-rest/webhooks/calling/models/`
- 2 files under `specs/signalwire-rest/webhooks/`
- 2 files under `specs/signalwire-rest/webhooks/messaging/models/`
- 1 file under `specs/signalwire-rest/calling-api/calls/`
- 1 file under `specs/signalwire-rest/fabric-api/swml-webhook/`
- 1 file under `specs/signalwire-rest/`
- 1 file under `specs/signalwire-rest/message-api/messages/`
- 1 file under `specs/signalwire-rest/relay-rest/campaign-registry/`
- 1 file under `specs/signalwire-rest/webhooks/ai/`
- 1 file under `specs/signalwire-rest/webhooks/ai/models/`
- 1 file under `specs/signalwire-rest/webhooks/calling/`
- 1 file under `specs/signalwire-rest/webhooks/messaging/`
- 1 file under `specs/swml/calling/Methods/send_sms/`
- 1 file under `specs/swml/messaging/Methods/reply/`
- 1 file under `specs/swml/messaging/Methods/transfer/`

---

### PR #573 — remove Reo.dev tracking script

Author: hey-august · Merged: 2026-08-13T13:34:17Z · 1 docs files changed

## Description

per Adam, this tracker is not needed after all

Changed files:
- **modified** `fern/docs.yml` (+0/-3)
```diff
@@ -181,9 +181,6 @@ css:
   - components/skeleton/styles.css
   - components/voice-widget/styles.css
 
-js:
-  - reo.js
-
 redirects:
   - source: /docs/agents-sdk
     destination: /docs/server-sdks
```

---

### PR #572 — docs(ai): document the AI chat API

Author: Devon-White · Merged: 2026-08-17T20:08:37Z · 31 docs files changed

Closes #569.

Documents the AI chat API: the JSON-RPC endpoint, the guide around it, and the Python `ai_chat` module that speaks it.

## The endpoint lives in the spec, not MDX

`POST /api/ai/chat` is JSON-RPC — one path, one HTTP method, six RPC methods selected by a body field — so it follows the pattern the Calling API already uses for `POST /api/calling/calls`: a single operation whose request body is a union of per-method models, discriminated on `method`, with one titled `@opExample` per method.

New `specs/signalwire-rest/ai-api/` family, because `/api/ai` is a route prefix no existing family owns. It covers all six methods and their results, the JSON-RPC error envelope with the error-code table, and the two failures that are not JSON-RPC at all: a `401`, and a `502` when the front door cannot reach the chat service. The operation documents the required **`chat` scope** via the shared `tokenPermissions` alias.

Reference page: `/docs/apis/rest/ai-chat/chat-methods`

## Pages

| Page | Type |
|---|---|
| `/ai/chat` | How-to: both connection paths, prerequisites, the behavior that bites, and how to confirm a working setup |
| `/server-sdks/reference/python/ai-chat` | Module overview |
| `.../ai-chat/ai-chat-client` | `AIChatClient` |
| `.../ai-chat/chat-gateway` | `ChatGateway` |

## Webhooks: reused, not forked

A chat conversation delivers the same SWAIG and post-prompt payloads a voice session does, with different values — not different shapes — so no new webhook mode

Changed files:
- **added** `fern/products/server-sdks/pages/reference/python/agents/ai-chat-client/index.mdx` → /docs/server-sdks/reference/python/agents/ai-chat-client ("AIChatClient") (+173/-0)
```diff
@@ -0,0 +1,173 @@
+---
+title: "AIChatClient"
+slug: /reference/python/agents/ai-chat-client
+description: Async client for holding a text conversation with a SignalWire AI agent from your own server.
+max-toc-depth: 3
+---
+
+[chatgateway]: /docs/server-sdks/reference/python/agents/chat-gateway
+[chat-endpoint]: /docs/apis/rest/ai-chat/chat-methods
+[error-codes]: /docs/apis/error-codes
+[createconversation]: /docs/server-sdks/reference/python/agents/ai-chat-client/create-conversation
+[chat]: /docs/server-sdks/reference/python/agents/ai-chat-client/chat
+[end]: /docs/server-sdks/reference/python/agents/ai-chat-client/end
+[delete]: /docs/server-sdks/reference/python/agents/ai-chat-client/delete
+[log]: /docs/server-sdks/reference/python/agents/ai-chat-client/log
+[summarize]: /docs/server-sdks/reference/python/agents/ai-chat-client/summarize
+[rawpost]: /docs/server-sdks/reference/python/agents/ai-chat-client/raw-post
+[close]: /docs/server-sdks/reference/python/agents/ai-chat-client/close
+
+`AIChatClient` sends messages to an AI agent and returns its replies. The agent is the same one a
+phone call would reach, and each call to [`chat()`][chat] runs one full turn.
+
+It is asyn
```
- **added** `fern/products/server-sdks/pages/reference/python/agents/chat-gateway/index.mdx` → /docs/server-sdks/reference/python/agents/chat-gateway ("ChatGateway") (+209/-0)
```diff
@@ -0,0 +1,209 @@
+---
+title: "ChatGateway"
+slug: /reference/python/agents/chat-gateway
+description: Browser-facing proxy that lets a page chat with an AI agent without holding a SignalWire API token.
+max-toc-depth: 3
+---
+
+[aichatclient]: /docs/server-sdks/reference/python/agents/ai-chat-client
+[router]: /docs/server-sdks/reference/python/agents/chat-gateway/router
+[minthandle]: /docs/server-sdks/reference/python/agents/chat-gateway/mint-handle
+[readhandle]: /docs/server-sdks/reference/python/agents/chat-gateway/read-handle
+[prepare]: /docs/server-sdks/reference/python/agents/chat-gateway/prepare
+[visiblemessages]: /docs/server-sdks/reference/python/agents/chat-gateway/visible-messages
+[lastactivity]: /docs/server-sdks/reference/python/agents/chat-gateway/last-activity
+[close]: /docs/server-sdks/reference/python/agents/chat-gateway/close
+
+A chat widget in a page cannot hold a SignalWire API token: the token carries the whole project, and
+every visitor could read it. `ChatGateway` mounts inside a web application you already run, holds the
+credentials server-side, and forwards on the widget's behalf.
+
+The browser learns two things, the gateway's URL and a publisha
```
- **added** `specs/signalwire-rest/ai-api/chat/models/core.tsp` (+96/-0)
```diff
@@ -0,0 +1,96 @@
+import "@typespec/http";
+import "@typespec/openapi3";
+import "@typespec/json-schema";
+
+using TypeSpec.Http;
+using TypeSpec.OpenAPI;
+using TypeSpec.JsonSchema;
+
+namespace SignalWireAPI.AI;
+
+// ============================================
+// Reusable descriptions
+// ============================================
+
+const conversationIdDescription = "The conversation this method acts on. You choose the value when you create the conversation, and it is scoped to your project.";
+
+const configUrlDescription = """
+  The publicly reachable URL serving your agent's SWML. `localhost` and private network addresses
+  cannot be reached by SignalWire.
+  """;
+
+const conversationTimeoutDescription = "Seconds a conversation may sit idle before it ends.";
+
+const userMetaDataDescription = "Arbitrary data about the user, included in webhooks generated for this conversation.";
+
+const reinitDescription = "Reset an existing conversation instead of returning it as-is. Clears the message history.";
+
+const requestIdDescription = "Your identifier for this request, echoed back on the response so you can match the two.";
+
+// ===========================================
```
- **added** `specs/signalwire-rest/ai-api/chat/models/requests.tsp` (+235/-0)
```diff
@@ -0,0 +1,235 @@
+import "@typespec/http";
+import "@typespec/openapi3";
+import "@typespec/json-schema";
+import "./core.tsp";
+
+using TypeSpec.Http;
+using TypeSpec.OpenAPI;
+using TypeSpec.JsonSchema;
+
+namespace SignalWireAPI.AI;
+
+// ============================================
+// create_conversation
+// ============================================
+
+@summary("create_conversation")
+model ChatCreateConversationRequest {
+  ...JsonRpcRequestEnvelope;
+
+  @doc("Creates a conversation, or resets an existing one when `reinit` is set.")
+  @example("create_conversation")
+  method: "create_conversation";
+
+  @doc("The parameters for `create_conversation`.")
+  params: {
+    @doc(conversationIdDescription)
+    @example("conv-123")
+    id: string;
+
+    @doc(configUrlDescription)
+    @example("https://your-agent.example.com/swml")
+    config_url: url;
+
+    @doc("An opening message from the user, sent as part of creating the conversation.")
+    @example("I need help with an order")
+    user_message?: string;
+
+    @doc(conversationTimeoutDescription)
+    @example(1800)
+    conversation_timeout?: int32 = 3600;
+
+    @doc(userMetaDataDescription)
+    @example(#{ c
```
- **added** `specs/signalwire-rest/ai-api/chat/models/responses.tsp` (+234/-0)
```diff
@@ -0,0 +1,234 @@
+import "@typespec/http";
+import "@typespec/openapi3";
+import "@typespec/json-schema";
+import "./core.tsp";
+// A conversation entry is one contract however it is fetched, so the transcript this endpoint
+// returns reuses the model the AI webhooks already publish rather than forking a second one.
+import "../../../webhooks/ai/models/common.tsp";
+
+using TypeSpec.Http;
+using TypeSpec.OpenAPI;
+using TypeSpec.JsonSchema;
+
+namespace SignalWireAPI.AI;
+
+// ============================================
+// create_conversation
+// ============================================
+
+@summary("create_conversation result")
+model ChatConversationCreatedResponse {
+  ...JsonRpcResponseEnvelope;
+
+  @doc("The conversation that now exists.")
+  result: {
+    @doc("""
+      What happened. `created` for a new conversation, `reinitialized` when `reinit` reset an
+      existing one, and `exists` when one was already there and was left alone.
+      """)
+    @example("created")
+    status: "created" | "reinitialized" | "exists";
+
+    @doc("The conversation id.")
+    @example("conv-123")
+    id: string;
+
+    @doc("""
+      The agent's opening line, when the agent g
```
- **modified** `fern/products/apis/apis.yml` (+1/-0)
- **modified** `fern/products/apis/pages/core/error-codes.mdx` → /docs/apis/error-codes ("Error codes") (+56/-1)
- **added** `fern/products/server-sdks/pages/reference/python/agents/ai-chat-client/chat.mdx` → /docs/server-sdks/reference/python/agents/ai-chat-client/chat ("chat") (+86/-0)
- **added** `fern/products/server-sdks/pages/reference/python/agents/ai-chat-client/close.mdx` → /docs/server-sdks/reference/python/agents/ai-chat-client/close ("close") (+44/-0)
- **added** `fern/products/server-sdks/pages/reference/python/agents/ai-chat-client/create-conversation.mdx` → /docs/server-sdks/reference/python/agents/ai-chat-client/create-conversation ("create_conversation") (+76/-0)
- **added** `fern/products/server-sdks/pages/reference/python/agents/ai-chat-client/delete.mdx` → /docs/server-sdks/reference/python/agents/ai-chat-client/delete ("delete") (+39/-0)
- **added** `fern/products/server-sdks/pages/reference/python/agents/ai-chat-client/end.mdx` → /docs/server-sdks/reference/python/agents/ai-chat-client/end ("end") (+48/-0)
- **added** `fern/products/server-sdks/pages/reference/python/agents/ai-chat-client/log.mdx` → /docs/server-sdks/reference/python/agents/ai-chat-client/log ("log") (+53/-0)
- **added** `fern/products/server-sdks/pages/reference/python/agents/ai-chat-client/raw-post.mdx` → /docs/server-sdks/reference/python/agents/ai-chat-client/raw-post ("raw_post") (+53/-0)
- **added** `fern/products/server-sdks/pages/reference/python/agents/ai-chat-client/summarize.mdx` → /docs/server-sdks/reference/python/agents/ai-chat-client/summarize ("summarize") (+63/-0)
- **added** `fern/products/server-sdks/pages/reference/python/agents/chat-gateway/close.mdx` → /docs/server-sdks/reference/python/agents/chat-gateway/close ("close") (+43/-0)
- **added** `fern/products/server-sdks/pages/reference/python/agents/chat-gateway/last-activity.mdx` → /docs/server-sdks/reference/python/agents/chat-gateway/last-activity ("last_activity") (+50/-0)
- **added** `fern/products/server-sdks/pages/reference/python/agents/chat-gateway/mint-handle.mdx` → /docs/server-sdks/reference/python/agents/chat-gateway/mint-handle ("mint_handle") (+45/-0)
- **added** `fern/products/server-sdks/pages/reference/python/agents/chat-gateway/prepare.mdx` → /docs/server-sdks/reference/python/agents/chat-gateway/prepare ("prepare") (+72/-0)
- **added** `fern/products/server-sdks/pages/reference/python/agents/chat-gateway/read-handle.mdx` → /docs/server-sdks/reference/python/agents/chat-gateway/read-handle ("read_handle") (+59/-0)

And 11 more changed files, not shown individually:
- 3 files under `specs/signalwire-rest/webhooks/ai/models/`
- 2 files under `fern/products/server-sdks/pages/reference/python/agents/chat-gateway/`
- 2 files under `specs/signalwire-rest/ai-api/`
- 1 file under `fern/products/server-sdks/pages/reference/python/agents/`
- 1 file under `specs/signalwire-rest/ai-api/chat/`
- 1 file under `specs/signalwire-rest/ai-api/chat/models/`
- 1 file under `specs/signalwire-rest/`

---

### PR #571 — rest(calling): add AI post-prompt and debug webhook definitions

Author: Devon-White · Merged: 2026-08-13T12:29:26Z · 6 docs files changed

## What

Adds the two missing AI webhook definitions to the REST spec's **Calling → Calls → Webhooks** section, plus the Bedrock post-prompt variant:

| Webhook | Fields | Source |
|---|---|---|
| `aiPostPromptCallback` | 42 | `ai_utils.c:198-304` + `post_process.c:333-433` |
| `aiDebugWebhook` | `call_info` + **47 events** | `webhook.c:428-532` + 47 call sites |
| `bedrockPostPromptCallback` | 37 | `bedrock.c:1372-1496`, `:1607-1663` |

Every other AI callback (`aiSidecarCallback`, `aiSwaigToolWebhook`, `swaigSignatureRequest`, `bedrockSwaigToolWebhook`) was already modeled. These two carry the conversation itself and were not.

## Errors corrected

**The hand-maintained post-prompt field list was wrong in five places:**

| Documented | Actual | Source |
|---|---|---|
| `content_type: "text/swaig"` | `"text/json"` | `ai_utils.c:215` |
| `content_disposition: "Conversation Log"` | `"agent.summary"` | `post_process.c:339` |
| `caller_id_num` | `caller_id_number` | `ai_utils.c:298` |
| `version: "2.0"` | key does not exist — commented out | `ai_utils.c:216` |
| `call_log` typed `object` | array of objects | `ai_utils.c:246` |

It was also missing ~20 keys. Those lists are now `<WebhookPayloadSnippet>` embeds, so they track the spec instead of drifting.

**The debug envelope description was wrong on the one point a handler is built against.** The first commit claimed `call_info` plus *exactly one more key*, and told readers to "read the key that is not `call_info`". `send_debug_

Changed files:
- **modified** `fern/products/apis/apis.yml` (+3/-0)
```diff
@@ -83,6 +83,9 @@ navigation:
                   - subpackage_calls.ai_swaig_tool_webhook
                   - subpackage_calls.bedrock_swaig_tool_webhook
                   - subpackage_calls.swaig_signature_request
+                  - subpackage_calls.ai_post_prompt_callback
+                  - subpackage_calls.ai_debug_webhook
+                  - subpackage_calls.bedrock_post_prompt_callback
           - queues
           - queueMembers
           - recordings
```
- **modified** `fern/products/swml/pages/reference/methods/calling/ai/ai_params/index.mdx` → /docs/swml/reference/calling/ai/params ("params") (+21/-2)
```diff
@@ -492,12 +492,12 @@ Enable debugging tools, logging, and performance monitoring features to help dev
 
 
 <ParamField path="params.debug_webhook_level" type="integer" default="1" toc={true}>
-  Enables debugging to the set URL. Allowed values from `0`-`2`. Level 0 disables, 1 provides basic info, 2 provides verbose info.
+  How much the debug stream carries. Allowed values from `0`-`2`. Level 2 adds `conversation_add`, `llm_request`, and `llm_response`, which together are far higher volume than everything else combined. Setting `debug_webhook_url` is what turns the stream on, so lowering the level thins the stream rather than stopping it. See the [debug_webhook_url callback](#debug_webhook_url-callback) below.
 </ParamField>
 
 
 <ParamField path="params.debug_webhook_url" type="string" toc={true}>
-  Each interaction between the AI and end user is posted in real time to the established URL. Authentication can also be set in the url in the format of `username:password@url`.
+  Each interaction between the AI and end user is posted in real time to the established URL. Authentication can also be set in the url in the format of `username:password@url`. See the [debug_webhook_url cal
```
- **modified** `fern/products/swml/pages/reference/methods/calling/ai/index.mdx` → /docs/swml/reference/calling/ai ("ai") (+14/-258)
```diff
@@ -166,272 +166,28 @@ it is recommended to read the [Prompting Best Practices][Prompting Best Practice
 
 ## post_prompt_url callback
 
-SignalWire will make a request to the `post_prompt_url` with the following parameters:
+SignalWire sends the report to your `post_prompt_url` as an HTTP `POST`.
 
-<ParamField path="action" type="string" toc={true}>
-  Action that prompted this request. The value will be "post_conversation".
-</ParamField>
-
-
-<ParamField path="ai_end_date" type="integer" toc={true}>
-  Timestamp indicating when the AI session ended.
-</ParamField>
-
-
-<ParamField path="ai_session_id" type="string" toc={true}>
-  A unique identifier for the AI session.
-</ParamField>
-
-
-<ParamField path="ai_start_date" type="integer" toc={true}>
-  Timestamp indicating when the AI session started.
-</ParamField>
-
-
-<ParamField path="app_name" type="string" toc={true}>
-  Name of the application that originated the request.
-</ParamField>
-
-
-<ParamField path="call_answer_date" type="integer" toc={true}>
-  Timestamp indicating when the call was answered.
-</ParamField>
-
-
-<ParamField path="call_end_date" type="integer" toc={true}>
-  Timestamp indicating when the call en
```
- **modified** `fern/products/swml/pages/reference/methods/calling/bedrock/index.mdx` → /docs/swml/reference/calling/amazon-bedrock ("amazon_bedrock") (+6/-264)
```diff
@@ -115,275 +115,17 @@ The `post_prompt` object accepts either a plain text prompt or a structured POM
 
 ## post_prompt_url callback
 
-SignalWire will make a request to the `post_prompt_url` with the following parameters:
+SignalWire sends the report to your `post_prompt_url` as an HTTP `POST`.
 
-<ParamField path="action" type="string" toc={true}>
-  Action that prompted this request. The value will be "post_conversation".
-</ParamField>
-
-
-<ParamField path="ai_end_date" type="integer" toc={true}>
-  Timestamp indicating when the AI session ended.
-</ParamField>
-
-
-<ParamField path="ai_session_id" type="string" toc={true}>
-  A unique identifier for the AI session.
-</ParamField>
-
-
-<ParamField path="ai_start_date" type="integer" toc={true}>
-  Timestamp indicating when the AI session started.
-</ParamField>
-
-
-<ParamField path="app_name" type="string" toc={true}>
-  Name of the application that originated the request.
-</ParamField>
+<WebhookPayloadSnippet webhook="bedrockPostPromptCallback" />
 
-
-<ParamField path="call_answer_date" type="integer" toc={true}>
-  Timestamp indicating when the call was answered.
-</ParamField>
-
-
-<ParamField path="call_end_date" type=
```
- **modified** `specs/signalwire-rest/calling-api/calls/main.tsp` (+7/-0)
```diff
@@ -29,6 +29,13 @@ using Types.StatusCodes;
   BedrockSwaigToolWebhookPayload,
   CALLS_TAG
 )
+@webhook("aiPostPromptCallback", AiPostPromptCallbackPayload, CALLS_TAG)
+@webhook("aiDebugWebhook", AiDebugWebhookPayload, CALLS_TAG)
+@webhook(
+  "bedrockPostPromptCallback",
+  BedrockPostPromptCallbackPayload,
+  CALLS_TAG
+)
 namespace SignalWireAPI.Calling.Calls {
   @tag(CALLS_TAG)
   @friendlyName("Calls")
```
- **modified** `specs/signalwire-rest/calling-api/calls/models/webhooks.tsp` (+1458/-61)
```diff
@@ -168,62 +168,93 @@ enum AISidecarCallbackType {
   final,
 }
 
+@doc("""
+  Identifies the call an AI callback came from. `project_id` and `space_id` are included when
+  available.
+  """)
+model AICallInfo {
+  @doc("Your project ID.")
+  @example("4d0d6f16-5881-4fcc-92a4-02c51a91954d")
+  project_id?: uuid;
+
+  @doc("Your Space ID.")
+  @example("451ed9ff-e568-4222-8af9-4f9ab7428d09")
+  space_id?: uuid;
+
+  @doc("ID of the call.")
+  @example("2e1e66e5-5d07-413d-9668-55542992eec0")
+  call_id: uuid;
+
+  @doc("The content type of the POST body. Always `text/json`.")
+  @example("text/json")
+  content_type: string;
+
+  @doc("How the body is delivered. Always `post_data`.")
+  @example("post_data")
+  content_disposition: string;
+
+  @doc("The conversation type. Always `voice`.")
+  @example("voice")
+  conversation_type: string;
+}
+
 @summary("AI sidecar callback")
 @doc("""
   Sent to the sidecar's `url` as an HTTP `POST` whenever you set one. The same event is always
   published in real time on the SignalWire Relay event channel (`calling.ai.sidecar`), so the
   webhook is optional. Each event is wrapped under `sidecar_event` — read that before checking its
   `type`
```

## Output

Return one entry per pull request above, including `skip` entries — the tier
call is auditable, so nothing is silently dropped. Return only a JSON object
matching this shape, with no markdown fences around it:

{
  "entries": [
    {
      "pr": 123,
      "tier": "notable" | "minor" | "skip",
      "product": "calling" | "swml" | "platform" | "server-sdks" | "browser-sdks" | "apis" | "compatibility-api" | "call-flow-builder" | "other",
      "entry_title": "Sentence-case title naming the change, not the week. Null when tier is skip.",
      "entry_body": "1-3 sentences, second person, present tense. Customer-facing prose. Null when tier is skip.",
      "support_detail": "What specifically changed and what it means for a Support conversation. More detail than entry_body, internal audience. Null when tier is skip.",
      "pages": [{ "path": "fern/...", "url": "/docs/... or null", "status": "added" | "modified" | "removed" | "renamed" }],
      "confidence": 0.0,
      "reasoning": "Why this tier."
    }
  ]
}
