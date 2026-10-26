namespace SWML.Messaging;
@summary("execute Method")
model Execute {
  @summary("execute")
  @doc("""
    Run a section, a SWML document fetched from a URL, or an inline SWML document as a
    subroutine. Execution continues in the called section or document, then returns to
    the caller when it completes — either via `return` or by reaching the end. A called
    document starts at its `sections.main`.
    
    A called section runs with the caller's variables, with `params` replaced. A called
    URL or inline document starts fresh: it sees the inbound `message` and the `params`
    supplied here, but not the caller's other variables, such as `request_result`.
    
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
        SignalWire fetches it with a `POST` request carrying the inbound message
        webhook payload, with `params` set to the values supplied here and `vars` set
        to the caller's current variables.
      - An inline messaging SWML document, supplied as a string that holds the whole
        document serialized as a JSON object. A string that isn't a valid JSON object
        is treated as a section name.
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
