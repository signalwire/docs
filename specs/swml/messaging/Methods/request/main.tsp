
namespace SWML.Messaging;
@summary("request Method")
model Request {
  @summary("request")
  @doc("""
    Make an HTTP request from inside your SWML document — useful for looking up
    records, calling your own API, or fetching data to use later in the message flow.

    After the request, the `%{request_result}` variable tells you the outcome:

    - `"success"` — the URL returned a 2xx response.
    - `"failed"` — the URL returned a 4xx or 5xx, or the network call failed.
    - `"timeout"` — the request didn't respond within `timeout` seconds.
    - `"limit_exceeded"` — your document already made the maximum of 10 requests;
      this call was skipped.

    Network and HTTP errors don't stop your document — the next steps still run,
    so you can branch on `%{request_result}` to handle each outcome. The only
    fatal error is omitting `url`.

    When `save_variables` is `true` and the response body is JSON, the parsed
    fields are available as `%{request_response.<field>}`. The raw response
    status code is in `%{request_response_code}` and the raw body in
    `%{request_response_body}` (capped at 64 KB).
    """)
  request: {
    @doc("Endpoint to call. Must be a publicly reachable URL.")
    @example("https://api.example.com/lookup")
    url: url;

    @doc("HTTP method.")
    @example("POST")
    method?: "GET" | "POST" | "PUT" | "PATCH" | "DELETE" = "POST";

    @doc("HTTP headers to include with the request, as a map of header name to value. Each value must be a string.")
    @example(#{ Authorization: "Bearer token" })
    headers?: {
      ...TypeSpec.Record<string>;
    };

    @doc("Request body. Objects are JSON-encoded automatically.")
    @example(#{ phone: "%{message.from}" })
    body?: string | {
      ...TypeSpec.Record<unknown>;
    };

    @doc("Timeout in seconds. Clamped to a maximum of `5.0`.")
    @minValue(0)
    @maxValue(5)
    @example(3)
    timeout?: float = 5.0;

    @doc("If `true`, parse the JSON response into `request_response.*` variables.")
    @example(true)
    save_variables?: boolean = false;
  };
}
