import "@typespec/http";

using TypeSpec.Http;

namespace Types.StatusCodes {
  @doc("Bad request error response.")
  @error
  model StatusCode400 {
    @statusCode statusCode: 400;

    @doc("Error type.")
    @example("validation_error")
    type: string;

    @doc("Error code.")
    @example("invalid_parameter")
    code: string;

    @doc("Error details.")
    @example("Name must be present")
    message: string;

    @doc("Request parameter associated with this error.")
    @example("name")
    attribute?: string;

    @doc("Link to developer resource for this error.")
    @example("https://developer.signalwire.com/rest/signalwire-rest/overview/error-codes#field-invalid-parameter")
    url: string;
  }

  @error
  model StatusCode404 {
    @statusCode statusCode: 404;
    error: "Not Found";
  }

  @error
  model StatusCode401 {
    @statusCode statusCode: 401;
    error: "Unauthorized";
  }

  model StatusCode422Error {
    @doc("Error type.")
    type: string;

    @doc("Error code.")
    code: string;

    @doc("Error details.")
    message: string;

    @doc("Request parameter associated with this error.")
    attribute: string;

    @doc("Link to developer resource for this error.")
    url: string;
  }

  @error
  model StatusCode422 {
    @statusCode statusCode?: 422;
    errors: StatusCode422Error[];
  }

  @doc("Flat validation error response (not wrapped in errors array).")
  @error
  model ValidationError {
    @statusCode statusCode: 422;

    @doc("Error type.")
    @example("validation_error")
    type: string;

    @doc("Error code.")
    @example("invalid_parameter")
    code: string;

    @doc("Error details.")
    @example("A required parameter is missing or invalid.")
    message: string;

    @doc("Request parameter associated with this error.")
    @example("parameter_name")
    attribute?: string;

    @doc("Link to developer resource for this error.")
    @example("https://developer.signalwire.com/rest/overview/error-codes")
    url: string;
  }

  @error
  model StatusCode403 {
    @statusCode statusCode: 403;
    error: "Forbidden";
  }

  @error
  model StatusCode500 {
    @statusCode statusCode: 500;
    error: "Internal Server Error";
  }
}
