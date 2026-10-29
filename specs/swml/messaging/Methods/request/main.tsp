namespace SWML.Messaging;
@summary("request Method")
model Request {
  @summary("request")
  @doc("""
    Make an HTTP request from inside your SWML document — useful for looking up
    records, calling your own API, or fetching data to use later in the message flow.
    
    After the request, the `%{request_result}` variable tells you the outcome:
    
    - `"success"` — the URL returned a 2xx response.
    - `"failed"` — the URL returned a response outside the 2xx range, such as a 4xx
      or 5xx.
    - `"timeout"` — the request didn't get a response within `timeout` seconds, or
      the connection to the URL failed.
    - `"limit_exceeded"` — your document already made the maximum of 10 requests;
      this call was skipped.
    
    Timeouts, connection failures, and unsuccessful HTTP responses don't stop your
    document — the next steps still run, so you can branch on `%{request_result}` to
    handle each outcome. Omitting `url`, or a `url` that expands to an empty value,
    is a fatal error that stops the document.
    
    When `save_variables` is `true` and the URL returns a 2xx response whose body is
    a JSON object, the parsed fields are available as `%{request_response.<field>}`.
    The response status code is in `%{request_response_code}` as a string (for
    example `"200"`) and the response body in `%{request_response_body}`. The stored
    body is a string, truncated to its first 65,536 characters after the response
    is received; responses with a JSON content type are stored as re-serialized
    JSON, so formatting can differ from what the server sent.
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

    @doc("""
      Request body, always sent JSON-encoded. An object is sent as a JSON object. A
      string is sent as a JSON string value, with quotes and escaping, not as raw text.
      """)
    @example(#{ phone: "%{message.from}" })
    body?: string | {
      ...TypeSpec.Record<unknown>;
    };

    @doc("Timeout in seconds. Clamped to a maximum of `5.0`.")
    @minValue(0)
    @maxValue(5)
    @example(3)
    timeout?: float = 5.0;

    @doc("""
      If `true`, parse the response into `request_response.*` variables. Fields are
      saved when the URL returns a 2xx response whose body is a JSON object; nothing is
      saved from 4xx or 5xx responses.
      """)
    @example(true)
    save_variables?: boolean = false;
  };
}
