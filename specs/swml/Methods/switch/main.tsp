import "../../Methods";

@summary("Switch object")
model Switch {
  @summary("switch")
  @doc("Execute a sequence of instructions depending on which value matches a variable.")
  switch: {
    @doc("Name of the variable whose value needs to be compared")
    @example("prompt_result")
    variable: string;

    @doc("Object of values mapped to array of instructions to execute")
    case: {
      ...TypeSpec.Record<SWMLMethod[]>;
    };

    @doc("Array of instructions to execute if no cases match")
    default?: SWMLMethod[];
  };
}
