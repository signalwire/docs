import "@typespec/openapi";
import "../../../../swml/calling";

namespace SignalWireAPI.Webhooks.AI;

// What your endpoint sends *back*. Webhook request payloads live alongside this
// file; these are the replies SignalWire parses and acts on, which is what makes
// them worth modelling — a status callback's reply is ignored beyond its status
// code, but everything here changes what the agent does next.
//
// The action and function vocabularies are the SWML ones: these models reference
// `SWML.Calling.Action`, `SWAIGDefaults` and `UserSWAIGFunction` rather than
// restating them, so the contract stays defined in exactly one place.
//
// Shapes here were verified against the platform's own parser rather than
// inferred from the prose — the three agent surfaces do not accept the same
// reply, and the differences are load-bearing.

@summary("SWAIG tool result")
@doc("""
  Splits the reply into the data half and the steering half.
  
  `tool_result` becomes the tool message the agent reads. `tool_prompt` is injected as a separate
  system message immediately after it, to steer what the agent does with that data. Use the split
  when the two are genuinely different things — you know which half is data and which half is
  instruction; the agent does not.
  """)
model SwaigToolResult {
  @doc("The data half — becomes the tool message the agent reads.")
  @example("status: on hold")
  tool_result?: string;

  @doc("The steering half — injected as a system message right after the tool message.")
  @example("Tell the caller their order is delayed and offer to text updates.")
  tool_prompt?: string;
}

// `amazon_bedrock` and `ai_sidecar` handlers answer with plain
// `SWML.Calling.Output` — the same object a `data_map` produces — so there is no
// model for them here. Only the `ai` surface reads more than that, and only the
// difference is declared below.

@summary("SWAIG tool webhook response")
@doc("""
  What your endpoint returns after running a SWAIG function for an
  [`ai`](/docs/swml/reference/calling/ai) agent.
  
  This is [`SWAIG.data_map.output`](/docs/swml/reference/calling/ai/swaig/functions/data-map) with
  two additions the `ai` surface reads and the others ignore: `response` may be an object that
  separates data from steering, and `post_process` defers the actions. A handler that needs neither
  can answer with a plain output object.
  
  Every field is optional. Returning `{}` is valid — the agent reads a default result and carries
  on — so a handler that only needs to steer the call can return `action` alone.
  
  `response` is written to the AI, not spoken to the caller: it is the result the agent reads
  before deciding what to say next. `action` steers the call itself — transfer it, send an SMS,
  play audio, update `global_data`, or move to a different context or step. Both can appear
  together, and that is the ordinary case.
  
  Every object `action` accepts is documented in the
  [`SWAIG.functions`](/docs/swml/reference/calling/ai/swaig/functions#properties) reference.
  """)
model SwaigToolWebhookResponse {
  // Only `response` diverges — it widens here, and TypeSpec cannot re-type a
  // spread property — so omit that one and inherit the rest. `action` stays
  // defined once in SWML, and anything added to `Output` later arrives here for
  // free. The spread sits between the two declared properties to keep the
  // emitted order response / action / post_process.
  @doc("""
    The result the agent reads next. A plain string becomes the tool message as-is; the object form
    splits the data half from the steering half. Omit it to let the agent use a default result.
    """)
  response?: string | SwaigToolResult;

  ...OmitProperties<SWML.Calling.Output, "response">;

  @doc("""
    Hold the actions until after the agent has spoken its reply, rather than running them
    immediately. **Default:** `false`.
    """)
  @example(true)
  post_process?: boolean = false;
}

@summary("SWAIG function signature envelope")
@doc("""
  The object form of a signature response, which additionally lets you set
  [`SWAIG.defaults`](/docs/swml/reference/calling/ai/swaig#swaigdefaults) for the functions it carries.
  
  Use this when the functions you are returning share a `web_hook_url`, auth, or other defaults —
  it saves repeating them on every definition.
  """)
model SwaigSignatureEnvelope {
  @doc("The function definitions your server hosts.")
  functions: SWML.Calling.UserSWAIGFunction[];

  @doc("Defaults applied to every function in `functions`.")
  defaults?: SWML.Calling.SWAIGDefaults;
}

@summary("SWAIG function signature response")
@doc("""
  The function definitions your server hosts, returned to the agent that asked for them.
  
  Three forms are accepted: an array of definitions (the usual one), a single definition on its own,
  or an envelope object carrying `functions` alongside shared `defaults`. Each definition is shaped
  like an entry in
  [`SWAIG.functions`](/docs/swml/reference/calling/ai/swaig/functions#properties) — `function`,
  `description`, and `parameters`.
  
  Every definition you return is registered, whether or not it was named in the request's
  `functions` list.
  """)
union SwaigSignatureResponse {
  SWML.Calling.UserSWAIGFunction[],
  SWML.Calling.UserSWAIGFunction,
  SwaigSignatureEnvelope,
}
