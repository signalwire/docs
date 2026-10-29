import "@typespec/json-schema";

import "../..";

using TypeSpec.JsonSchema;

namespace SWML.Calling;

@summary("Condition with When/Then")
model CondReg {
  @doc("The JavaScript condition to act on.")
  @example("vars.digit == '1'")
  when: string;

  @doc("Sequence of SWML methods to execute when the condition evaluates to true.")
  then: SWMLMethod[];
}

@summary("Else Fallback")
model CondElse {
  @doc("Sequence of SWML methods to execute when none of the other conditions evaluate to true.")
  `else`: SWMLMethod[];
}

@oneOf
@summary("CondParams union")
union CondParams {
  CondReg,
  CondElse,
}

@summary("cond Method")
model Cond {
  @summary("cond")
  @doc("""
    Execute a sequence of instructions depending on the value of a JavaScript condition.
    Conditions are checked in array order. The first condition whose `when` evaluates to true runs its `then` instructions,
    and the remaining conditions are skipped. The `else` entry runs only when no condition evaluates to true.
    At most one `else` entry is allowed, and it doesn't have to be the last entry.
    When no condition matches and there is no `else` entry, execution continues with the next method after `cond`.
    """)
  @contains(CondElse)
  @minContains(0)
  @maxContains(1)
  cond: CondParams[];
}
