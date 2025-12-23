import "../../Methods";

@summary("Request object")
model Request {
  @summary("request")
  @doc("Send a GET, POST, PUT, or DELETE request to a remote URL.")
  request: {
    @doc("The URL to which the request is to be sent.")
    url: string;

    @doc("The HTTP method to be used for the request. Can be `GET`, `POST`, `PUT`, or `DELETE`.")
    method: "GET" | "POST" | "PUT" | "DELETE";

    @doc("An object representing the headers to be included in the request.")
    headers?: {
      ...TypeSpec.Record<unknown>;
    };

    @doc("The body of the request. Can be a `string` or an `object`.")
    body?: string | {
      ...TypeSpec.Record<unknown>;
    };

    @doc("""
      Maximum time in seconds to wait for a response.
      Default is `5.0` seconds.
      """)
    timeout?: float | SWMLVar;

    @doc("""
      Maximum time in seconds to wait for a connection.
      Default is `5.0` seconds.
      """)
    connect_timeout?: float | SWMLVar;

    @doc("`switch` on `return_value` if result is an object (`{}`), or use as a cond if result is an array (`[]`).")
    result?: Switch | Cond[];

    @doc("""
      Store parsed JSON response as variables.
      Default is `false`.
      """)
    save_variables?: boolean | SWMLVar;
  };
}
