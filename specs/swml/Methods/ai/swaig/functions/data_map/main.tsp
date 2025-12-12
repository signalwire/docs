import "@typespec/json-schema";
import "./output.tsp";
import "./expression.tsp";
import "./webhook.tsp";

using TypeSpec.JsonSchema;

@summary("DataMap object")
model DataMap {
  @doc("""
    An object that contains a response and a list of actions to be performed upon a SWAIG function call.
    This functions like a return statement in a function.
    """)
  output?: Output;

  @doc("An array of objects that define patterns and corresponding actions.")
  expressions?: Expression[];

  @doc("An array of objects that define external API calls.")
  webhooks?: Webhook[];
}
