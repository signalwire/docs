import "../../Methods";

@summary("ExecuteSwitch object")
model ExecuteSwitch {
  @doc("""
    Name of the variable whose value needs to be compared. If not provided, it will check the `return_value` variable.
    Can be one of the listed set of variables, or a string to represent a custom variable.
    """)
  variable?: string;

  @doc("Object of values mapped to array of instructions to execute")
  case: {
    ...TypeSpec.Record<SWMLMethod[]>;
  };

  @doc("Array of instructions to execute if no cases match")
  default?: SWMLMethod[];
}

@summary("Execute object")
model Execute {
  @doc("Execute a section or URL as a subroutine and return back to current document.")
  execute: {
    @doc("""
      Specifies what to execute. The value can be one of: 
      <section_name> - section in the current document to execute.
      https://<URL>" - URL pointing to the document to execute. Sends HTTP POST.
      """)
    dest: string;

    @doc("Named parameters to send to section or URL")
    params?: {
      ...TypeSpec.Record<unknown>;
    };

    @doc("User-defined metadata, ignored by SignalWire")
    meta?: {
      ...TypeSpec.Record<unknown>;
    };

    @doc("The list of SWML instructions to be executed when the executed section or URL returns")
    on_return?: SWMLMethod[];

    @doc("`switch` on `return_value` if result is an object (`{}`), or use as a cond if result is an array (`[]`)")
    result?: ExecuteSwitch | Cond.cond;
  };
}
