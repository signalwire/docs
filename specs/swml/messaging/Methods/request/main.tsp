
namespace SWML.Messaging;
@summary("request Method")
model Request {
  @summary("request")
  @doc("""
    Make an HTTP request to an external URL. The response can optionally be parsed and
    stored as variables for use in subsequent steps. Request failures are soft —
    they set `request_result` but do not stop execution.
    """)
  request: {
    @doc("URL to send the request to.")
    @example("https://api.example.com/lookup")
    url: url;

    @doc("HTTP method. Default `POST`.")
    @example("POST")
    method?: "GET" | "POST" | "PUT" | "PATCH" | "DELETE" = "POST";

    @doc("HTTP headers to include with the request. Each value must be a string.")
    @example(#{ Authorization: "Bearer token" })
    headers?: {
      ...TypeSpec.Record<string>;
    };

    @doc("Request body. Hashes are JSON-encoded automatically.")
    @example(#{ phone: "%{message.from}" })
    body?: string | {
      ...TypeSpec.Record<unknown>;
    };

    @doc("Timeout in seconds. Default `5.0`. Clamped to a maximum of `5.0`.")
    @minValue(0)
    @maxValue(5)
    @example(3)
    timeout?: float = 5.0;

    @doc("If `true`, parse the JSON response into `request_response.*` variables. Default `false`.")
    @example(true)
    save_variables?: boolean = false;
  };
}
