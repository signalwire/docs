import "../label";
import "../../Shared/Types/main.tsp";
@summary("Goto object")
model Goto {
  @doc("""
    Jump to a label within the current section, optionally based on a condition.
    The goto method will only navigate to a label within the same section.
    """)
  goto: {
    label: Label.label;

    @doc("JavaScript expression to evaluate. When the condition evaluates to true, the goto jump is triggered.")
    @example("vars.retry_count < 3")
    when?: string;

    @doc("The maximum number of times to perform the jump. Must be a number between 1 and 100.")
    @minValue(1)
    @maxValue(100)
    @example(3)
    max?: integer | SWMLVar;

    @doc("""
      User-defined metadata to be stored with the jump. This metadata is ignored by SignalWire and the
      default is not set.
      """)
    @example(#{ retry_reason: "timeout", timestamp: "2024-01-15T10:30:00Z" })
    meta?: {
      ...TypeSpec.Record<unknown>;
    };
  };
}
