import "../label";
import "../../Shared/Types/main.tsp";
@summary("Goto object")
model Goto {
  @doc("Jump to a specified label in the current SWML document.")
  goto: {
    label: Label.label;

    @doc("The condition that triggers the `goto` jump.")
    when?: string;

    @doc("The maximum number of times to perform the jump. Must be a number between 1 and 100.")
    @minValue(1)
    @maxValue(100)
    max?: integer | SWMLVar;

    @doc("""
      User-defined metadata to be stored with the jump. This metadata is ignored by SignalWire and the
      default is not set.
      """)
    meta?: {
      ...TypeSpec.Record<unknown>;
    };
  };
}
