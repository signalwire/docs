import "@typespec/json-schema";
import "./actions";

using TypeSpec.JsonSchema;

namespace SWML.Calling;

// This is the SWAIG function result, not just a `data_map` concept: the platform
// expands a `data_map` output into exactly the object a `web_hook_url` handler
// would have returned over HTTP, then runs both through the same parser. So the
// shape here is also the contract your webhook endpoint answers with.
@summary("Output object")
model Output {
  @doc("""
    A static response text or message returned to the AI agent's context. Optional — when it is
    absent the agent reads a default result and carries on, so an output that only needs to steer
    the call can set `action` alone.
    """)
  @example("Order placed")
  response?: string;

  @doc("An action to perform upon matching, or a list of them.")
  action?: Action | Action[];
}
