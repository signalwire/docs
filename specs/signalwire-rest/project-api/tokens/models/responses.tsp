import "@typespec/http";

using TypeSpec.Http;

@doc("Validation error response for token operations.")
@error
model TokenValidationError {
  @statusCode statusCode: 422;

  @doc("Error type.")
  @example("validation_error")
  type: string;

  @doc("Error code.")
  @example("invalid_auth_token_permissions")
  code: string;

  @doc("Error details.")
  @example("Permissions contains invalid selections (valid permissions are: calling, chat, fax, management, messaging, numbers, pubsub, storage, tasking, and video)")
  message: string;

  @doc("Request parameter associated with this error.")
  @example("permissions")
  attribute?: string;

  @doc("Link to developer resource for this error.")
  @example("https://developer.signalwire.com/rest/overview/error-codes/#invalid_auth_token_permissions")
  url: string;
}
