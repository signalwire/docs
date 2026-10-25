import "@signalwire/typespec-emit-filter";
import "../label";

using SignalWire.EmitFilter;

namespace SWML.Messaging;

// Messaging counterpart of the shared SWMLVar scalar, whose description covers calling
// and AI variables. Markup-only, so it is excluded from filter-honoring emitters like SWMLVar.
@excludeFromEmit
@doc("""
  A messaging SWML variable reference, such as `%{params.max_retries}`. It is replaced with
  the variable's value from the inbound message (`message.*`), the current `params`, or a
  variable set by an earlier step before the method uses it.
  """)
@pattern("^[\\$%]\\{.*\\}$")
@summary("Messaging variable reference")
scalar MessagingVariableReference extends string;

@summary("goto Method")
model Goto {
  @summary("goto")
  @doc("""
    Jump to a named label in the current section. Used for retry loops and conditional
    repetition. `goto` does not cross subroutine boundaries.
    
    Accepts a label name as a string (shorthand) or an object with `label` and `max`.
    The shorthand jumps to the label exactly as written, without variable expansion,
    with the default `max` of 100.
    """)
  goto: string | {
    @doc("Label to jump to. Must reference a `label` step in the current section.")
    @example("greeting")
    label: string;

    @doc("""
      Maximum number of jumps to `label`. Accepts an integer or a `%{...}` variable
      reference; a reference is expanded and then converted to an integer. A reference
      that doesn't resolve allows no jumps — it does not fall back to 100.
      
      Jumps are counted per target label for the whole run, not per `goto` step: every
      `goto` that targets the same label name shares one count, including `goto` steps
      in other sections and in documents reached through `execute` or `transfer`. Each
      jump attempt adds one to the count and is allowed while the count is at most this
      step's `max`.
      
      When an attempt exceeds `max`, the jump doesn't happen and the steps array that
      contains the label ends without running its remaining steps. Execution continues
      with whatever ran that array, such as the steps after an enclosing `switch` or
      the caller of an `execute`.
      
      `max` cannot raise the document's limit of 100 steps, which counts every step
      including each `label` passed. That limit can stop execution before `max` jumps
      are reached.
      """)
    @example(3)
    max?: integer | MessagingVariableReference = 100;
  };
}
