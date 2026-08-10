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

@summary("ExecuteTarget object")
model ExecuteTarget {
  @doc("""
    Specifies what to execute. The value can be one of:
    - `<section_name>` - section in the current document to execute
    - A URL (http or https) that returns a SWML document - Sends HTTP POST
    - An inline SWML document, as a JSON or YAML string. A JSON string may be either a full
      document with `version` and `sections` or a bare array of instructions; a YAML string
      must be a full document.
    """)
  @example("https://example.com/swml-handler")
  dest: string;

  @doc("Named parameters to send to section or URL")
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
    Action to take based on the result of the call. This will run once the peer leg of the call has ended.
    The form of this block selects how it runs: an array of instructions runs as a `cond`, and an
    object runs as a `switch` matched against `return_value`.
    """)
  result?: ExecuteSwitch | Cond.cond;
}

@summary("execute Method")
model Execute {
  @doc("""
    Execute a specified section, URL, or inline document as a subroutine, and upon completion, return to the current document.
    Use the return statement to pass any return values or objects back to the current document.

    Accepts either an object, or a string used directly as `dest`.
    """)
  execute: string | ExecuteTarget;
}
