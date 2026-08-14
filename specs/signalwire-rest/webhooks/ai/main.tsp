import "@typespec/http";
import "@typespec/openapi";
import "../tags.tsp";
import "./models/common.tsp";
import "./models/swaig.tsp";
import "./models/post-prompt.tsp";
import "./models/debug.tsp";
import "./models/sidecar.tsp";
import "@signalwire/typespec-webhook";
import "../../../_shared/webhook-ack.tsp";

using TypeSpec.Http;
using TypeSpec.OpenAPI;
using SignalWire.Webhook;

// SignalWire is the caller here, not the callee — these operations describe
// requests we send to the customer's endpoint, so the service's own auth scheme
// does not apply to them.
@tag(AI_WEBHOOKS_TAG)
@useAuth(NoAuth)
namespace SignalWireAPI.Webhooks.AI;

@summary("AI SWAIG tool webhook")
@doc("""
  Sent to a tool's `web_hook_url` (or the SWAIG `defaults.web_hook_url`) when an
  [`ai`](/docs/swml/reference/calling/ai) agent calls one of your functions.
  
  Your endpoint runs the function and replies with an
  [`Output`](/docs/swml/reference/calling/ai/swaig/functions/data-map) object — the same shape a
  `data_map` produces, because the platform reads both the same way. Every field is optional, so
  `{}` is a valid reply and a handler that only steers the call can return `action` alone:
  
  - `response` — the result the agent reads next, written to the AI rather than spoken to the
    caller. A plain string becomes the tool message as-is; the object form
    `{tool_result, tool_prompt}` splits the data half from the steering half. Omit it and the agent
    reads a default result.
  - `action` — a single action object or an array of them, executed on the live call.
  - `post_process` — hold the actions until after the agent has spoken. **Default:** `false`.
  """)
@webhook
@operationId("ai_swaig_tool_webhook")
@post
op aiSwaigToolWebhook(@body payload: AiSwaigToolWebhookPayload): WebhookAck;

@summary("SWAIG function signature request")
@doc("""
  Sent once per [`SWAIG.includes`](/docs/swml/reference/calling/ai/swaig/includes) entry when an AI
  agent loads, to discover the functions your server hosts. Every way of building an agent sends it —
  SWML you write yourself, SWML a Server SDK generates, or an agent you configure in your Dashboard —
  because they all resolve `includes` the same way.
  
  Reply with the function definitions you host, each shaped like an entry in
  [`SWAIG.functions`](/docs/swml/reference/calling/ai/swaig/functions#properties) — `function`,
  `description`, and `parameters`. Three forms are accepted:
  
  - an array of definitions, the usual one;
  - a single definition on its own;
  - an object `{functions, defaults}`, where `defaults` sets
    [`SWAIG.defaults`](/docs/swml/reference/calling/ai/swaig#swaigdefaults) across the definitions it
    carries — useful when they share a `web_hook_url` or auth.
  
  Every definition you return is registered, whether or not it was named in the request's
  `functions` list.
  
  This is not the payload a function call sends. It goes to the `includes` entry's `url`, using
  `auth_user` and `auth_password` when set. Your endpoint can also receive it outside of a call, as a
  check that it answers, so answer it the same way. When your project has a signing key, the request
  carries an `X-SignalWire-Signature` header you can verify.
  """)
@webhook
@operationId("swaig_signature_request")
@post
op swaigSignatureRequest(
  @body payload: SwaigSignatureRequestPayload,
): WebhookAck;

@summary("AI post-prompt callback")
@doc("""
  Sent to your [`ai.post_prompt_url`](/docs/swml/reference/calling/ai) when the AI session ends. It
  carries the agent's answer to your [`post_prompt`](/docs/swml/reference/calling/ai)
  alongside the full record of the call: the conversation, the tool calls, the timings, and the
  token counts. This is the one report you get per call, so store the body verbatim and extract only
  the fields you query. Nothing you return in the response is read.
  
  Read `action` first. It is `post_conversation` on the end-of-call report described here. The same
  URL also receives `fetch_conversation` when the agent starts with a stored conversation
  ([`save_conversation`](/docs/swml/reference/calling/ai/params#paramssave_conversation) with a
  `conversation_id`), asking your endpoint to return that conversation; that request carries the
  call and session fields but none of the summary fields. Answer it with the stored
  `conversation_summary`.
  
  The conversation appears three times. `call_log` is the filtered view, with interrupted segments
  consolidated. `raw_call_log` is unfiltered and append-only, and is the only place barge-in detail
  survives. `call_timeline` is a flat stream of typed events aligned to `raw_call_log`.
  
  [`amazon_bedrock`](/docs/swml/reference/calling/amazon-bedrock) agents send a different report.
  Write your handler against the
  [Bedrock post-prompt callback](#tag/calls/webhook/bedrockPostPromptCallback) instead.
  """)
@webhook
@operationId("ai_post_prompt_callback")
@post
op aiPostPromptCallback(@body payload: AiPostPromptCallbackPayload): WebhookAck;

@summary("AI debug webhook")
@doc("""
  A diagnostic feed for a call that is still in progress. Set `debug_webhook_url` on your agent and
  every step it takes is posted to that URL as it happens: speech recognized, model called, tool
  invoked, context switched, error hit. Use it to work out why a call went the way it did — which
  tool the agent reached for, what came back, where a turn went wrong — or to react while the call is
  still live, such as paging a supervisor.
  
  Each request carries `call_info` plus one or more event properties, where the property name is the
  event. One moment can produce several: evaluating a `data_map` webhook sends `webhook`, `input`,
  `output`, `error_keys`, and `match` together. Handle the properties you recognize and ignore the
  rest, since the set grows over time.
  
  Setting the URL is what enables the feed. `debug_webhook_level` only widens it: at `2` it also
  carries `conversation_add`, `llm_request`, and `llm_response`, which fire on every turn and every
  model call.
  """)
@webhook
@operationId("ai_debug_webhook")
@post
op aiDebugWebhook(@body payload: AiDebugWebhookPayload): WebhookAck;

@summary("Amazon Bedrock SWAIG tool webhook")
@doc("""
  Sent to a tool's `web_hook_url` (or the SWAIG `defaults.web_hook_url`) when an
  [`amazon_bedrock`](/docs/swml/reference/calling/amazon-bedrock) agent calls one of your functions.
  Your endpoint runs the function and replies with a
  [`BedrockOutput`](/docs/swml/reference/calling/amazon-bedrock/swaig/functions/data-map) object.
  Both fields are optional, so `{}` is a valid reply:
  
  - `response` — the result the agent reads next. A plain string only here; the
    `{tool_result, tool_prompt}` object form that [`ai`](/docs/swml/reference/calling/ai) agents
    accept is not read. Omit it and the agent reads a default result.
  - `action` — a single action object or an array of them, executed on the live call.
  
  There is no `post_process`: a Bedrock agent always defers actions until after it has spoken.
  
  Bedrock agents send a different payload from [`ai`](/docs/swml/reference/calling/ai) agents. Notably
  `content_type` is `text/json` rather than `text/swaig`, `argument` carries no `substituted` value,
  there is no `version`, `description`, or `argument_desc`, and the call's timing and caller fields
  are named differently. Write your handler against this payload, not the
  [AI SWAIG tool webhook](#tag/calls/webhook/aiSwaigToolWebhook).
  """)
@webhook
@operationId("bedrock_swaig_tool_webhook")
@post
op bedrockSwaigToolWebhook(
  @body payload: BedrockSwaigToolWebhookPayload,
): WebhookAck;

@summary("Amazon Bedrock post-prompt callback")
@doc("""
  Sent to your [`amazon_bedrock.post_prompt_url`](/docs/swml/reference/calling/amazon-bedrock) when
  the agent's session ends, carrying its answer to your `post_prompt` alongside the record of the
  call. Nothing you return in the response is read.
  
  Bedrock agents send a different report from [`ai`](/docs/swml/reference/calling/ai) agents. There
  is no `call_timeline`, `previous_contexts`, `hard_timeout`, `call_ended_by`, or `ai_id_tag`;
  `raw_call_log` is a copy of `call_log` rather than a separate unfiltered view; `swaig_log` is
  always empty; `conversation_summary` is always present; and the `total_*` fields arrive without
  your having to enable accounting. `post_prompt_url` also takes no separate credentials here — put
  them in the URL as `username:password@url`. Write your handler against this payload, not the
  [AI post-prompt callback](#tag/calls/webhook/aiPostPromptCallback).
  """)
@webhook
@operationId("bedrock_post_prompt_callback")
@post
op bedrockPostPromptCallback(
  @body payload: BedrockPostPromptCallbackPayload,
): WebhookAck;

@summary("AI sidecar callback")
@doc("""
  Sent to the sidecar's `url` as an HTTP `POST` whenever you set one. The same event is always
  published in real time on the SignalWire Relay event channel (`calling.ai.sidecar`), so the
  webhook is optional. Each event is wrapped under `sidecar_event` — read that before checking its
  `type` and fields.
  
  This payload covers the envelope shared by every callback. For the fields specific to each `type`
  (such as `insight.raw`, `turn.transcript_delta`, or `final.summary`), see the
  [SWML ai_sidecar reference](/docs/swml/reference/calling/ai-sidecar#callback-types).
  """)
@webhook
@operationId("ai_sidecar_callback")
@post
op aiSidecarCallback(@body payload: AISidecarCallbackPayload): WebhookAck;

@summary("AI sidecar SWAIG tool webhook")
@doc("""
  Sent to a sidecar tool's `web_hook_url` (or the SWAIG `defaults.web_hook_url`) when the sidecar
  calls one of your functions.
  
  Your endpoint runs the function and replies with a JSON object. Both fields are optional, so `{}`
  is a valid reply:
  
  - `response` — the result the model reads next. A plain string only; the
    `{tool_result, tool_prompt}` object form that [`ai`](/docs/swml/reference/calling/ai) agents
    accept is not read. Omit it and the model reads a default result.
  - `action` — a single action object or an array of them. See
    [Supported SWAIG actions](/docs/swml/reference/calling/ai-sidecar#supported-swaig-actions) for
    what you can return.
  
  There is no `post_process` on a sidecar reply.
  
  The sidecar only listens to the call and never speaks on it, so a `say` action is reported back to
  you as a callback rather than being spoken aloud.
  """)
@webhook
@operationId("ai_sidecar_swaig_tool_webhook")
@post
op aiSidecarSwaigToolWebhook(
  @body payload: AISidecarSwaigToolWebhookPayload,
): WebhookAck;
