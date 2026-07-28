
namespace SWML.Messaging;

@summary("ExecuteTarget object")
model ExecuteTarget {
  @doc("""
    What to execute. The value can be one of:
    - A section name — a section defined in the current document.
    - A URL (`http` or `https`) that returns a SWML document. SignalWire always sends an HTTP
      POST; there is no `method` parameter on `execute`.
    - An inline SWML document, supplied as a JSON string. It may be a full document with
      `sections`, or a bare `reply` or `receive` document.

    A value that is not an `http`/`https` URL and does not parse as a JSON object is treated
    as a section name. A malformed inline document — a syntax error, a JSON array, or a value
    written as a native object rather than a string — therefore fails with
    `swml_section_not_found`, not `swml_execute_document_invalid`.
    """)
  @example("greet")
  dest: string;

  @doc("Parameters accessible as `params.*` in the destination. Replaces (does not merge with) any outer `params` from the caller.")
  @example(#{ name: "%{message.from}" })
  params?: {
    ...TypeSpec.Record<unknown>;
  };
}

@summary("execute Method")
model Execute {
  @summary("execute")
  @doc("""
    Call a section, a URL, or an inline document as a subroutine. Execution continues in the
    destination, then returns to the caller when it completes — either via `return` or by
    reaching the end. `return_value` and the propagated `reply_*` and `request_*` variables
    come back with it.

    Every destination reads the inbound `message` and this step's `params`, which replace the
    caller's `params` rather than merging with them. A section destination also reads everything
    the caller can, including every runtime variable set so far. A URL or inline destination
    reads the runtime variables of the top-level flow, the ones your `main` steps set, which is
    the same thing whenever the step itself sits in `main`. Once the step is nested the two
    differ: variables set inside a section or document that `execute` or `transfer` entered do
    not reach a URL or inline destination until control returns to the top level, so pass those
    in `params`.

    A URL or inline destination is a separate document and cannot reach the caller's sections.

    Accepts either an object, or a string used directly as `dest`. `%{...}` placeholders are
    not expanded in the string form — use the object form for a computed destination.
    """)
  execute: string | ExecuteTarget;
}
