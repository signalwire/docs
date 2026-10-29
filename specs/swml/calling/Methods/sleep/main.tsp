import "@typespec/json-schema";
import "../../../Shared/Types/main.tsp";
using TypeSpec.JsonSchema;

namespace SWML.Calling;

@doc("A positive number of milliseconds.")
@minValue(1)
scalar SleepPositiveDuration extends integer;

@doc("""
  A sleep duration in milliseconds: a positive integer, `-1` to sleep indefinitely,
  or a SWML variable reference that resolves to one of these.
  """)
union SleepDuration {
  SleepPositiveDuration,
  -1,
  SWMLVar,
}

@summary("sleep Method")
model Sleep {
  @summary("sleep")
  @doc("Pause execution for a specified duration.")
  sleep: {
    @doc("""
      The amount of time to sleep in milliseconds.
      Must be a positive integer. Can also be set to `-1` for the sleep to never end.
      """)
    @example(5000)
    duration: SleepDuration;
  } | SleepDuration;
}
