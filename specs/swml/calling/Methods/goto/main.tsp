import "../label";
import "../../../Shared/Types/main.tsp";

namespace SWML.Calling;

@summary("GotoTarget object")
model GotoTarget {
  label: Label.label;

  @doc("A JavaScript condition that determines whether to perform the jump. If the condition evaluates to true, the jump is executed. If omitted, the jump is unconditional.")
  @example("vars.retry_count < 3")
  when?: string;

  @doc("The maximum number of times to perform the jump. Must be a number between 1 and 100. Default `100`.")
  @minValue(1)
  @maxValue(100)
  @example(3)
  max?: integer | SWMLVar = 100;
}

@summary("goto Method")
model Goto {
  @doc("""
    Jump to a label within the current section, optionally based on a condition.
    The goto method will only navigate to a label within the same section.

    Jumps count against the same per-call budget as `transfer` — 32 combined, or 8 without
    caller interaction. Exceeding it ends the call with
    [`relay_script_too_many_transfers`](/docs/swml/reference/errors).

    Accepts either an object, or a string used directly as `label`.
    """)
  goto: string | GotoTarget;
}
