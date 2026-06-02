import "@typespec/json-schema";
import "./actions";

using TypeSpec.JsonSchema;

namespace SWML.Calling;

@summary("Output object")
model Output {
  @doc("A static response text or message returned to the AI agent's context.")
  @example("Order placed")
  response: string;

  @doc("A list of actions to be performed upon matching.")
  action?: Action[];
}
