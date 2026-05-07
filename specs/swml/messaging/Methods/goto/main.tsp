import "../label";

@summary("goto Method")
model Goto {
  @summary("goto")
  @doc("""
    Jump to a named label in the current section. Used for retry loops and conditional
    repetition. `goto` does not cross subroutine boundaries.
    """)
  goto: {
    label: Label.label;

    @doc("Maximum number of jumps before stopping execution. Default `100`.")
    @minValue(1)
    @maxValue(100)
    @example(3)
    max?: integer = 100;
  };
}
