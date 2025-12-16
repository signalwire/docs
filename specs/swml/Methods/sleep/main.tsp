import "@typespec/json-schema";
import "../../Shared/Types/main.tsp";
using TypeSpec.JsonSchema;

@summary("Sleep object")
model Sleep {
  @summary("sleep")
  @doc("""
    The amount of time to sleep in milliseconds before continuing to the next action.
    Must be a positive integer. Can also be set to `-1` for the sleep to never end.
    """)
  @oneOf
  @minValue(-1)
  @example(5000)
  sleep: integer | SWMLVar;
}
