import "@typespec/http";

using TypeSpec.Http;

namespace Types.StatusCodes {
  // ============================================================================
  // Base Error Models (reusable across all APIs)
  // ============================================================================

  @doc("Unauthorized error response.")
  @error
  model StatusCode401 {
    @statusCode statusCode: 401;
    error: "Unauthorized";
  }

  @doc("Forbidden error response.")
  @error
  model StatusCode403 {
    @statusCode statusCode: 403;
    error: "Forbidden";
  }

  @doc("Not found error response.")
  @error
  model StatusCode404 {
    @statusCode statusCode: 404;
    error: "Not Found";
  }

  @doc("Internal server error response.")
  @error
  model StatusCode500 {
    @statusCode statusCode: 500;
    error: "Internal Server Error";
  }

  @doc("Bad request error response.")
  @error
  model StatusCode400 {
    @statusCode statusCode: 400;
    error: "Bad Request";
  }

  // ============================================================================
  // Space API / Applications Error Format
  // Used by: /api/relay/rest, /api/rest/applications
  // Format: { errors: [{ detail, status, title, code }] }
  // ============================================================================

  @doc("Individual error item for Space API format.")
  model SpaceApiErrorItem {
    @doc("Human-readable error message describing what went wrong.")
    @example("Label can't be blank")
    detail: string;

    @doc("HTTP status code as a string.")
    @example("422")
    status: string;

    @doc("Error category title.")
    @example("Invalid Attribute")
    title: string;

    @doc("Error code matching the HTTP status.")
    @example("422")
    code: string;
  }

  @doc("Validation error response using Space API ErrorSerializer format.")
  @error
  model ValidationError {
    @statusCode statusCode: 422;

    @doc("Array of validation errors.")
    errors: SpaceApiErrorItem[];
  }

  // ============================================================================
  // REST/Fabric API Error Format (APIErrors::GenerateResponse)
  // Used by: /api/rest/*, /api/fabric/*, /api/private/*
  // Format: { errors: [{ type, code, message, attribute, url }] }
  // ============================================================================

  @doc("Individual error item for REST/Fabric API format.")
  model RestApiErrorItem {
    @doc("Error category type.")
    @example("validation_error")
    type: string;

    @doc("Error code identifier.")
    @example("invalid_parameter")
    code: string;

    @doc("Human-readable error message.")
    @example("Name must be present")
    message: string;

    @doc("Request parameter associated with this error. Null for base errors.")
    @example("name")
    attribute?: string | null;

    @doc("Link to error documentation.")
    @example("https://developer.signalwire.com/rest/signalwire-rest/overview/error-codes#invalid_parameter")
    url: string;
  }

  @doc("Validation error response using REST/Fabric API format.")
  @error
  model RestApiValidationError {
    @statusCode statusCode: 422;

    @doc("Array of validation errors.")
    errors: RestApiErrorItem[];
  }

  @doc("Alias for RestApiValidationError for backward compatibility.")
  model StatusCode422 is RestApiValidationError;

  // ============================================================================
  // Compatibility API Error Format (Twilio-compatible)
  // Used by: /api/laml
  // Format: { code, message, more_info, status } (flat, no array)
  // ============================================================================

  @doc("Error response for Compatibility API (Twilio-compatible format).")
  @error
  model CompatibilityApiError {
    @statusCode statusCode: 400;

    @doc("Numeric error code.")
    @example("10000")
    code: string;

    @doc("Human-readable error message.")
    @example("A required parameter is missing.")
    message: string;

    @doc("Link to error documentation.")
    @example("https://developer.signalwire.com/compatibility-api/reference/error-codes")
    more_info: string;

    @doc("HTTP status code.")
    @example(400)
    status: int32;
  }
}
