import "@typespec/json-schema";

using TypeSpec.JsonSchema;

@summary("GotoHash object")
model GotoHash {
  @doc("Name of the label to jump to. The label must exist in the current section.")
  @example("retry")
  label: string;

  @doc("Maximum number of jumps before stopping execution. Default `100`.")
  @minValue(1)
  @maxValue(100)
  @example(3)
  max?: integer = 100;
}

@summary("goto Method")
model Goto {
  @oneOf
  @summary("goto")
  @doc("""
    Jump to a named label in the current section. Used for retry loops and conditional
    repetition. `goto` does not cross subroutine boundaries.
    """)
  goto: string | GotoHash;
}
