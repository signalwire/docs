import "../..";

namespace SWML.Calling;

@summary("request Method")
model Request {
  @summary("request")
  @doc("Send a GET, POST, PUT, or DELETE request to a remote URL.")
  request: {
    @doc("URL to send the HTTPS request to. Authentication can also be set in the URL in the format of username:password@url.")
    @example("https://api.example.com/webhook")
    url: string;

    @doc("""
      The HTTP method to be used for the request. Can be `GET`, `POST`, `PUT`, or `DELETE`.
      A SWML variable reference is also accepted; it must resolve to one of these methods.
      """)
    @example("POST")
    method: "GET" | "POST" | "PUT" | "DELETE" | SWMLVar;

    @doc("""
      Object mapping HTTP header names to string values.
      Valid header names are `Accept`, `Authorization`, `Content-Type`, and `Range` (case-insensitive), and custom headers
      that start with `X-` (or `x-`) followed by one or more ASCII letters, digits, hyphens, or underscores.
      Header values support variable substitution. After substitution, a value must be non-empty and contain only printable
      ASCII characters (spaces included) other than the backslash; tabs, line breaks, and non-ASCII characters are not allowed.
      Entries with an invalid name, a non-string value, or an invalid value are skipped with a warning, and the request is
      still sent.
      """)
    @example(#{
      `Content-Type`: "application/json",
      Authorization: "Bearer token123",
    })
    headers?: {
      ...TypeSpec.Record<string>;
    };

    @doc("""
      Request body. Content-Type header should be explicitly set, but if not set, the most likely type
      will be set based on the first non-whitespace character.
      """)
    @example(#{ action: "notify", message: "Call completed" })
    body?: string | {
      ...TypeSpec.Record<unknown>;
    };

    @doc("""
      Maximum time in seconds to wait for a response. The value is applied in whole seconds.
      Default is `5`. A value of `0` uses the default, and values above `30` are capped at 30 seconds.
      """)
    @example(10.0)
    timeout?: float | SWMLVar = 5;

    @doc("""
      Maximum time in seconds to wait for a connection. The value is applied in whole seconds.
      Default is `5`. A value of `0` uses the default, and values above `30` are capped at 30 seconds.
      """)
    @example(5.0)
    connect_timeout?: float | SWMLVar = 5;

    @doc("""
      Store parsed JSON response as variables.
      Default is `false`.
      """)
    @example(true)
    save_variables?: boolean | SWMLVar = false;
  };
}
