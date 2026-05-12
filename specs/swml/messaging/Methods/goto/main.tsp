import "../label";

namespace SWML.Messaging;

@summary("goto Method")
model Goto {
  @summary("goto")
  @doc("""
    Jump to a named label in the current section. Used for retry loops and conditional
    repetition. `goto` does not cross subroutine boundaries.
    """)
  goto: {
    @doc("Label to jump to. Must reference a `label` step in the current section.")
    @example("greeting")
    label: string;

    @doc("""
      Maximum number of times this `goto` can jump to its label. Once the limit is reached,
      the section ends without running any further steps.
      """)
    @example(3)
    max?: integer = 100;
  };
}
