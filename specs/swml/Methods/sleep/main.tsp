import "@typespec/json-schema";
import "../../Shared/Types/main.tsp";
using TypeSpec.JsonSchema;

@summary("Sleep object")
model Sleep {
  @summary("sleep")
  @doc("The amount of time to sleep in milliseconds. Must be a `positive integer`. Can also be set to a `-1` integer for the sleep to never end.")
  @oneOf
  @minValue(-1)
  sleep: integer | SWMLVar;
}
