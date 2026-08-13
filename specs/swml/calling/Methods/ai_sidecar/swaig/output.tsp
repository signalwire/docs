import "@typespec/json-schema";
import "../../ai/swaig/functions/data_map";

using TypeSpec.JsonSchema;

namespace SWML.Calling;

// A sidecar agent has no `data_map` — this is only ever a webhook reply. It
// dispatches through its own path (`sidecar_dispatch_webhook`), separate from
// both the `ai` and Bedrock evaluators, and reads the result with a string-only
// accessor.
//
// The Pick list is this surface's to maintain. It currently matches
// `BedrockOutput` property for property, but the two are separate deliberately:
// they are separate code paths that happen to agree today, so a change to one
// must not silently redefine the other.

@summary("AI sidecar output object")
@doc("""
  The result of a SWAIG function run by an
  [`ai_sidecar`](/docs/swml/reference/calling/ai-sidecar) agent.
  
  Narrower than the canonical [`Output`](/docs/swml/reference/calling/ai/swaig/functions/data-map):
  a sidecar reads `response` as a plain string, and `post_process` does not apply.
  """)
model AISidecarOutput {
  @doc("""
    The result the agent reads next. When absent, the agent reads a default result and carries on.
    """)
  @example("Order placed")
  response?: string;

  ...PickProperties<Output, "action">;
}
