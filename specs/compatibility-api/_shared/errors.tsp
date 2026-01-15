using TypeSpec.Http;

@doc("Error response model.")
model ErrorResponse {
  @doc("Error code.")
  @example(20003)
  code: int32;

  @doc("Error message.")
  @example("Authentication failed")
  message: string;

  @doc("URL for more information about the error.")
  @example("https://developer.signalwire.com/compatibility-api/reference/errors")
  more_info: string;

  @doc("HTTP status code.")
  @example(401)
  status: int32;
}

@doc("400 Bad Request response.")
model StatusCode400 {
  @statusCode statusCode: 400;
  @body error: ErrorResponse;
}

@doc("401 Unauthorized response.")
model StatusCode401 {
  @statusCode statusCode: 401;
  @body error: ErrorResponse;
}

@doc("404 Not Found response.")
model StatusCode404 {
  @statusCode statusCode: 404;
  @body error: ErrorResponse;
}

@doc("422 Unprocessable Entity response.")
model StatusCode422 {
  @statusCode statusCode: 422;
  @body error: ErrorResponse;
}

@doc("204 No Content response.")
model StatusCode204 {
  @statusCode statusCode: 204;
}
