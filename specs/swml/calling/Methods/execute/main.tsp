import "../..";

namespace SWML.Calling;

@summary("ExecuteSwitch object")
model ExecuteSwitch {
  @doc("""
    Name of the variable whose value needs to be compared. If not provided, it will check the `return_value` variable.
    Can be one of the listed set of variables, or a string to represent a custom variable.
    """)
  @example("return_value")
  variable?: string;

  @doc("Object of values mapped to array of instructions to execute")
  case: {
    ...TypeSpec.Record<SWMLMethod[]>;
  };

  @doc("Array of instructions to execute if no cases match")
  default?: SWMLMethod[];
}

@summary("execute Method")
model Execute {
  @doc("""
    Execute a specified section or URL as a subroutine, and upon completion, return to the current document.
    Use the return statement to pass any return values or objects back to the current document.
    """)
  execute: {
    @doc("""
      Specifies what to execute. The value can be one of:
      - `<section_name>` - section in the current document to execute
      - A URL (http or https) that returns a SWML document - Sends HTTP POST
      - An inline SWML document (as a JSON string)
      """)
    @example("https://example.com/swml-handler")
    dest: string;

    @doc("""
      Named parameters to send to section or URL.
      After variable expansion, `params` can nest objects and arrays at most 63 levels deep, counting the `params` object itself.
      If `params` is nested deeper, the section or URL is not executed.
      """)
    @example(#{ caller_id: "+15551234567", language: "en-US" })
    params?: {
      ...TypeSpec.Record<unknown>;
    };

    @doc("User-defined metadata, ignored by SignalWire")
    @example(#{ request_id: "req_abc123", source: "ivr" })
    meta?: {
      ...TypeSpec.Record<unknown>;
    };

    @doc("The list of SWML instructions to be executed when the executed section or URL returns")
    on_return?: SWMLMethod[];

    @doc("""
      Instructions to run based on the value returned by the executed section or URL.
      `result` is processed after the section or URL returns and before `on_return`, and only when the section or URL set a `return_value` (for example, with the return method).
      An object-shaped `result` is handled like the switch method: its `case` keys are matched against `return_value`.
      An array-shaped `result` is handled like the cond method: a list of conditions checked in order.
      """)
    result?: ExecuteSwitch | Cond.cond;
  };
}
