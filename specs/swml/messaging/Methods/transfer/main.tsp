
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
    Steps after `transfer` are skipped, including steps in calling sections.
    """)
  transfer: {
    @doc("URL to fetch the new SWML document from.")
    @example("https://example.com/handler")
    dest: url;

    @doc("HTTP method for the fetch request. Default `POST`.")
    @example("POST")
    method?: "GET" | "POST" | "PUT" | "PATCH" | "DELETE" = "POST";

    @doc("Parameters to include in the request body of the fetch.")
    @example(#{ reason: "escalation" })
    params?: {
      ...TypeSpec.Record<unknown>;
    };
  };
}
