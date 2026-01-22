import "@typespec/http";
import "../../../types/status-codes";

using TypeSpec.Http;

model PubSubToken422Error {
  @doc("Error type.")
  @example("validation_error")
  type: string;

  @doc("Error code.")
  @example("not_a_valid_json")
  code: string;

  @doc("Error details.")
  @example("Permissions must be valid JSON")
  message: string;

  @doc("Request parameter associated with this error.")
  @example("permissions")
  attribute: string;

  @doc("Link to developer resource for this error.")
  @format("uri")
  @example("https://developer.signalwire.com/rest/overview/error-codes/#not_a_valid_json")
  url: string;
}