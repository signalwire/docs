namespace SWML.Messaging;
@summary("execute Method")
model Execute {
  @summary("execute")
  @doc("""
    Run a section, a SWML document fetched from a URL, or an inline SWML document as a
    subroutine. Execution continues in the called section or document, then returns to
    the caller when it completes — either via `return` or by reaching the end. A called
    document starts at its `sections.main`.
    
    Accepts either a destination string (shorthand) or an object with `dest` and
    `params`. The shorthand calls the destination with empty `params`, and `%{...}`
    references in it are not expanded; use the object form to build the destination
    or pass parameters from variables.
    """)
  execute: string | {
    @doc("""
      Where to execute. One of:
      
      - The name of a section in the current document.
      - A URL (`http` or `https`) that returns a messaging SWML document.
        SignalWire fetches it with a `POST` request.
      - An inline messaging SWML document, supplied as a JSON string that contains
        a JSON object.
      """)
    @example("greet")
    dest: string;

    @doc("Parameters accessible as `params.*` in the called section or document. Replaces (does not merge with) any outer `params` from the caller.")
    @example(#{ name: "%{message.from}" })
    params?: {
      ...TypeSpec.Record<unknown>;
    };
  };
}
