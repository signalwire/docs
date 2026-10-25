import "@typespec/json-schema";
import "./output.tsp";
import "./expression.tsp";
import "./webhook.tsp";

using TypeSpec.JsonSchema;

namespace SWML.Calling;

@summary("DataMap object")
model DataMap {
  @doc("""
    An object that contains a response and a list of actions to be performed upon a SWAIG function call.
    This functions like a return statement in a function.
    """)
  output?: Output;

  @doc("An array of objects that have pattern matching logic to process the user's input data. A user can define multiple expressions to match against the user's input data.")
  expressions?: DataMapExpression[];

  @doc("""
    An array of objects that define external API calls. Webhooks are tried in order, skipping any whose
    `require_args` aren't met. The first webhook that returns a response is the only one used, even if
    `error_keys` then marks that response as failed; later webhooks are not called.
    """)
  webhooks?: DataMapWebhook[];
}
