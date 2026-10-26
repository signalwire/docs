namespace SWML.Messaging;
@summary("transfer Method")
model Transfer {
  @summary("transfer")
  @doc("""
    Hand processing over to another section, another SWML document fetched from a URL,
    or an inline SWML document. `dest` selects which.
    
    This is a tail call: it does not return, and steps after `transfer`, including
    steps in calling sections, are skipped. A URL or inline destination also replaces
    the current document.
    
    When `dest` is a URL, SignalWire sends the
    [inbound message webhook payload](/docs/apis/rest/webhooks/inbound-message-webhook)
    in the request body to `dest`, using `method` (`POST` by default): `message`
    describes the original inbound message, `params` carries the values supplied here,
    and `vars` carries the propagated runtime variables (`request_result`,
    `reply_result`, etc.) accumulated by the current document.
    """)
  transfer: {
    @doc("""
      Where to transfer. One of:
      
      - The name of a section in the current document.
      - A URL (`http` or `https`) to fetch the new SWML document from. Authentication
        can be embedded in the URL as `username:password@url`.
      - An inline SWML document, supplied as a string that holds the whole document
        serialized as a JSON object. A YAML or JSON object nested directly under `dest`
        is not accepted, and a string that isn't a valid JSON object is treated as a
        section name. Execution starts at its `sections.main`.
      
      `%{...}` variable references in `dest` are expanded before the destination is
      resolved.
      """)
    @example("https://example.com/handler")
    dest: string;

    @doc("HTTP method for the fetch request. Used only when `dest` is a URL.")
    @example("POST")
    method?: "GET" | "POST" | "PUT" | "PATCH" | "DELETE" = "POST";

    @doc("""
      Parameters for the transferred section or document, available there as `params.*`.
      When `dest` is a URL, they are also sent in the request body. They replace the
      current `params` rather than merging with them; when omitted, the target receives
      an empty object.
      
      String values are expanded for `%{...}` variable references at every depth,
      including inside nested objects and arrays. Keys are not expanded. Each
      substitution produces a string, a reference to a path that doesn't exist becomes
      an empty string, and expressions are not evaluated.
      """)
    @example(#{ reason: "escalation", customer: "%{message.from}" })
    params?: {
      ...TypeSpec.Record<unknown>;
    } = #{};
  };
}
