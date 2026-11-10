import "@typespec/json-schema";
import "./parameters.tsp";

using TypeSpec.JsonSchema;

namespace SWML.Calling;

@summary("AISidecarSWAIGFunction object")
model AISidecarSWAIGFunction {
  @doc("The name of the function. This is the only required field; the model calls the function by this name.")
  @example("lookup_competitor")
  function: string;

  @doc("A description of what the function does, sent to the model so it knows when to call it.")
  @example("Look up a competitor by name.")
  description?: string;

  @doc("Fallback for `description` — used only when `description` is not set.")
  @example("Look up a competitor by name.")
  purpose?: string;

  @doc("The JSON-Schema object describing the function's arguments. When omitted, the function takes no arguments.")
  parameters?: AISidecarFunctionParameters;

  @doc("Webhook URL for this function. Falls back to `defaults.web_hook_url`. Authentication can also be set in the url in the format of `username:password@url`. Credentials embedded in the URL take precedence over `web_hook_auth_user` and `web_hook_auth_password`.")
  @example("https://example.com/sidecar/swaig")
  web_hook_url?: string;

  @doc("Username for basic auth on this function's webhook. Falls back to `defaults.web_hook_auth_user`.")
  @example("username")
  web_hook_auth_user?: string;

  @doc("Password for basic auth on this function's webhook. Falls back to `defaults.web_hook_auth_password`.")
  @example("password")
  web_hook_auth_password?: string;
}
