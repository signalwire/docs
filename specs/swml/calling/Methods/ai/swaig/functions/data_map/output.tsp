import "@typespec/json-schema";
import "./actions";

using TypeSpec.JsonSchema;

namespace SWML.Calling;

// The SWAIG function result. Not a `data_map` concept despite living here: the
// platform expands a `data_map` output into exactly the object a `web_hook_url`
// handler returns over HTTP, then runs both through the same parser. So this
// model is also the contract a webhook endpoint answers with.
//
// `Output` is the canonical result — the `ai` agent's, which is where SWAIG
// features land first — and is declared plainly, with no derivation machinery.
// Surfaces that read less derive from it and own the Pick list that says so;
// see `BedrockOutput` and `AISidecarOutput`. Picking rather than omitting is
// deliberate: an allowlist fails closed, so a property added here for `ai`
// cannot silently appear on a surface that ignores it.

@summary("SWAIG tool result")
@doc("""
  Splits the result into the data half and the steering half.
  
  `tool_result` becomes the tool message the agent reads. `tool_prompt` is injected as a separate
  system message immediately after it, to steer what the agent does with that data. Use the split
  when the two are genuinely different things — you know which half is data and which half is
  instruction; the agent does not.
  
  Read only by [`ai`](/docs/swml/reference/calling/ai) agents.
  """)
model SwaigToolResult {
  @doc("The data half — becomes the tool message the agent reads.")
  @example("status: on hold")
  tool_result?: string;

  @doc("The steering half — injected as a system message right after the tool message.")
  @example("Tell the caller their order is delayed and offer to text updates.")
  tool_prompt?: string;
}

@summary("Output object")
@doc("""
  The result of a SWAIG function, returned either as a `data_map` output or by your `web_hook_url`
  endpoint — the platform reads both the same way.
  
  Every field is optional. An empty object is valid — the agent reads a default result and carries
  on — so a function that only needs to steer the call can set `action` alone.
  
  [`amazon_bedrock`](/docs/swml/reference/calling/amazon-bedrock) and
  [`ai_sidecar`](/docs/swml/reference/calling/ai-sidecar) agents read a narrower result: `response`
  must be a plain string there, and `post_process` has no effect.
  """)
model Output {
  @doc("""
    The result the agent reads next. A plain string becomes the tool message as-is; the object form
    splits the data half from the steering half. Omit it to let the agent use a default result.
    """)
  @example("Order placed")
  response?: string | SwaigToolResult;

  // Worded for both pathways on purpose: this property is shared with the
  // webhook reply, so "upon matching" (a `data_map` expression concept) would
  // read wrong there.
  @doc("An action for the platform to perform on the live call, or a list of them.")
  action?: Action | Action[];

  @doc("""
    Hold the actions until after the agent has spoken its reply, rather than running them
    immediately. **Default:** `false`.
    """)
  @example(true)
  post_process?: boolean = false;
}
