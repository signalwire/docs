import "../label";
import "../../../Shared/Types/main.tsp";

namespace SWML.Calling;
@summary("goto Method")
model Goto {
  @doc("""
    Jump to a label within the current section, optionally based on a condition.
    The goto method will only navigate to a label within the same section.
    """)
  goto: {
    @doc("""
      Name of the label to jump to. It must match a label defined with the label method.
      A SWML variable reference is resolved when the goto runs.
      """)
    label: Label.label;

    @doc("A JavaScript condition that determines whether to perform the jump. If the condition evaluates to true, the jump is executed. If omitted, the jump is unconditional.")
    @example("vars.retry_count < 3")
    when?: string;

    @doc("""
      The maximum number of times to perform the jump. Must be a number between 1 and 100, or a SWML variable reference that resolves to one. Default `100`.
      The jump count belongs to the target label: every goto in the current execution that jumps to the same label adds to that count,
      and each goto compares its own `max` against it. Once the count reaches `max`, the jump is skipped and execution continues with the next method.
      """)
    @minValue(1)
    @maxValue(100)
    @example(3)
    max?: integer | SWMLVar = 100;
  };
}
