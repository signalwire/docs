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

@doc("Error item in the errors array format.")
model ErrorArrayItem {
  @doc("The numeric string identifying the API error code")
  @example("30010")
  code?: string;

  @doc("Error text")
  @example("Maxpriceperminute was exceeded. This call's cost is 0.008 per minute.")
  message?: string;

  @doc("Url for more information on error code")
  @example("https://developer.signalwire.com/rest/compatibility-api/error-codes")
  more_info?: string;
}

@doc("Error response with errors array format.")
model ErrorArrayResponse {
  @doc("A list of errors")
  errors?: ErrorArrayItem[];
}

@doc("400 Bad Request response.")
model StatusCode400 {
  @statusCode statusCode: 400;
  @body error: ErrorResponse;
}

@doc("400 Bad Request response with errors array format.")
model StatusCode400Array {
  @statusCode statusCode: 400;
  @body body: ErrorArrayResponse;
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

@doc("422 Unprocessable Entity response with errors array format.")
model StatusCode422Array {
  @statusCode statusCode: 422;
  @body body: ErrorArrayResponse;
}

@doc("204 No Content response.")
model StatusCode204 {
  @statusCode statusCode: 204;
}

@doc("Token validation error response model.")
model TokenValidationError {
  @doc("Error type.")
  type?: string;

  @doc("Error code.")
  code?: string;

  @doc("Error message.")
  message?: string;

  @doc("Request parameter associated with this error.")
  attribute?: string;

  @doc("Link to developer resource for this error.")
  @format("uri")
  url?: string;
}

@doc("422 Unprocessable Entity response for token validation errors.")
model StatusCode422Token {
  @statusCode statusCode: 422;
  @body body: TokenValidationError;
}
