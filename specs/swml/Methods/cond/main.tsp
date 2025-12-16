import "@typespec/json-schema";

import "../../Methods";

using TypeSpec.JsonSchema;

@summary("CondReg object")
model CondReg {
  @doc("The condition to be evaluated and act on.")
  @example("vars.digit == '1'")
  when: string;

  @doc("The list of SWML instructions to be executed if the condition is `true`")
  then: SWMLMethod[];

  @doc("The list of SWML instructions to be executed if the condition is `false`.")
  `else`?: SWMLMethod[];
}

@summary("CondElse object")
model CondElse {
  @doc("The list of SWML instructions to be executed if the condition is `false`.")
  `else`: SWMLMethod[];
}

@oneOf
@summary("CondParams union")
union CondParams {
  CondReg,
  CondElse,
}

@summary("Cond object")
model Cond {
  @summary("cond")
  @doc("Execute a sequence of instructions depending on the value of a JavaScript condition.")
  cond: CondParams[];
}
