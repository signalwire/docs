
namespace SWML.Messaging;
@summary("transfer Method")
model Transfer {
  @summary("transfer")
  @doc("""
    Fetch and execute a new SWML document from a URL. SignalWire POSTs the
    [inbound message webhook payload](/docs/apis/rest/swml-webhook/webhooks/inbound-message-webhook)
    to `dest`: `message` describes the original inbound message, `params` carries
    the values supplied here, and `vars` carries the propagated runtime variables
    (`request_result`, `reply_result`, etc.) accumulated by the current document.

    This is a tail call — it replaces the current document and does not return.
    Steps after `transfer` are skipped, including steps in calling sections. In the
    messaging context, `transfer.dest` must be a URL — section names and inline
    documents are not accepted.
    """)
  transfer: {
    @doc("""
      URL (`http` or `https`) to fetch the new SWML document from. Authentication can
      be embedded in the URL as `username:password@url`.
      """)
    @example("https://example.com/handler")
    dest: url;

    @doc("HTTP method for the fetch request.")
    @example("POST")
    method?: "GET" | "POST" | "PUT" | "PATCH" | "DELETE" = "POST";

    @doc("Parameters to include in the request body of the fetch. Available as `params.*` in the transferred document.")
    @example(#{ reason: "escalation" })
    params?: {
      ...TypeSpec.Record<unknown>;
    };
  };
}
