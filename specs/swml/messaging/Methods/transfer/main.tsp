
namespace SWML.Messaging;
@summary("transfer Method")
model Transfer {
  @summary("transfer")
  @doc("""
    Fetch and execute a new SWML document from a URL. This is a tail call —
    it replaces the current document and does not return. Steps after `transfer`
    are skipped, including steps in calling sections.
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
