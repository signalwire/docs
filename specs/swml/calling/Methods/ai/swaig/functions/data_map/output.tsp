import "@typespec/json-schema";
import "./actions";

using TypeSpec.JsonSchema;

namespace SWML.Calling;

// The SWAIG function result. Not a `data_map` concept despite living here: the
// platform expands a `data_map` output into exactly the object a `web_hook_url`
// handler returns over HTTP, then runs both through the same parser. So these
// models are also the contract a webhook endpoint answers with.
//
// The split is by agent surface, not by delivery. `ai` reads two things the
// other surfaces do not, so `Output` carries them and `OutputBase` is what
// `amazon_bedrock` and `ai_sidecar` actually read.

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

@summary("Output object (base)")
@doc("""
  The SWAIG function result every agent surface understands.
  
  Both fields are optional. An empty object is valid — the agent reads a default result and carries
  on — so a function that only needs to steer the call can set `action` alone.
  """)
model OutputBase {
  @doc("""
    A static response text or message returned to the AI agent's context. When it is absent the
    agent reads a default result and carries on.
    """)
  @example("Order placed")
  response?: string;

  // Worded for both pathways on purpose: this property is shared with the
  // webhook reply, so "upon matching" (a `data_map` expression concept) would
  // read wrong there.
  @doc("An action for the platform to perform on the live call, or a list of them.")
  action?: Action | Action[];
}

@summary("Output object")
@doc("""
  The SWAIG function result for an [`ai`](/docs/swml/reference/calling/ai) agent.
  
  This is the base result with two additions that only `ai` reads: `response` may be an object that
  separates data from steering, and `post_process` holds the actions until after the agent has
  spoken. [`amazon_bedrock`](/docs/swml/reference/calling/amazon-bedrock) and
  [`ai_sidecar`](/docs/swml/reference/calling/ai-sidecar) agents ignore both — see
  [`OutputBase`](/docs/swml/reference/calling/ai/swaig/functions/data-map) for what they read.
  """)
model Output {
  // `response` widens here, and a spread property cannot be re-typed — hence
  // omit-then-redeclare. Spread sits mid-model to keep the emitted field order.
  @doc("""
    The result the agent reads next. A plain string becomes the tool message as-is; the object form
    splits the data half from the steering half. Omit it to let the agent use a default result.
    """)
  @example("Order placed")
  response?: string | SwaigToolResult;

  ...OmitProperties<OutputBase, "response">;

  @doc("""
    Hold the actions until after the agent has spoken its reply, rather than running them
    immediately. **Default:** `false`.
    """)
  @example(true)
  post_process?: boolean = false;
}
