import "../..";

namespace SWML.Calling;

@summary("switch Method")
model Switch {
  @summary("switch")
  @doc("Execute different instructions based on a variable's value.")
  switch: {
    @doc("""
      Name of the variable whose value needs to be compared.
      The value is converted to a string before it is looked up in `case`: strings are used as is, booleans become `true` or `false`,
      and numbers and other JSON values use their compact JSON text, so a value of `5` matches the key `"5"`.
      A SWML variable reference in `variable` must resolve to a variable name.
      """)
    @example("prompt_result")
    variable: string;

    @doc("""
      Object of key-mapped values to array of SWML methods to execute.
      Each key is a value to match, and its array of SWML methods runs when the variable's value matches the key.
      When no key matches and there is no `default`, no branch runs, a warning is reported, and execution continues with the next method while the call is still active.
      """)
    case: {
      ...TypeSpec.Record<SWMLMethod[]>;
    };

    @doc("Array of SWML methods to execute if no cases match.")
    default?: SWMLMethod[];
  };
}
