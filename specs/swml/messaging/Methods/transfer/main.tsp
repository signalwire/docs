
namespace SWML.Messaging;

@summary("TransferTarget object")
model TransferTarget {
  @doc("""
    Where to transfer to. The value can be one of:
    - A section name — a section defined in the current document.
    - A URL (`http` or `https`) that returns a SWML document. SignalWire sends the
      [inbound message webhook payload](/docs/apis/rest/swml-webhook/webhooks/inbound-message-webhook)
      as the request body: `message` describes the original inbound message, `params` carries
      the values supplied here, and `vars` carries the runtime variables (`request_result`,
      `reply_result`, etc.) accumulated by the current document. Credentials embedded in the
      URL as `username:password@url` are sent as HTTP basic authentication; this relies on how
      the HTTP client handles credentials in a URL, so re-check it after a major platform
      update if you depend on it.
    - An inline SWML document, supplied as a JSON string. It may be a full document with
      `sections`, or a bare `reply` or `receive` document.

    A value that is not an `http`/`https` URL and does not parse as a JSON object is treated
    as a section name. A malformed inline document — a syntax error, a JSON array, or a value
    written as a native object rather than a string — therefore fails with
    `swml_section_not_found`, not a fetch or parse error.
    """)
  @example("https://example.com/handler")
  dest: string;

  @doc("""
    HTTP method for the fetch request. Applies only when `dest` is a URL; it is ignored for
    section and inline-document destinations. One of `GET`, `POST`, `PUT`, `PATCH`, or
    `DELETE` — any other value causes the fetch to fail with `swml_transfer_fetch_failed`.
    """)
  @example("POST")
  method?: "GET" | "POST" | "PUT" | "PATCH" | "DELETE" = "POST";

  @doc("""
    Parameters made available as `params.*` in the destination. Replaces (does not merge with)
    the caller's `params`. For a URL destination they are also sent in the request body.
    """)
  @example(#{ reason: "escalation" })
  params?: {
    ...TypeSpec.Record<unknown>;
  };
}

@summary("transfer Method")
model Transfer {
  @summary("transfer")
  @doc("""
    Hand execution to another SWML destination: a section in the current document, a URL that
    returns a SWML document, or an inline SWML document.

    This is a tail call — it replaces the current document and does not return. Steps after
    `transfer` are skipped, including steps in calling sections. A transfer that cannot be
    resolved ends the run rather than falling through to the next step.

    A section destination keeps the runtime variables accumulated so far. A URL or inline
    destination is a separate document: it sees only the `message` variables and the `params`
    you pass.

    Accepts either an object, or a string used directly as `dest`. `%{...}` placeholders are
    not expanded in the string form — use the object form for a computed destination.
    """)
  transfer: string | TransferTarget;
}
