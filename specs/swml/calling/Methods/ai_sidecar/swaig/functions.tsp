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

  @doc("Webhook URL for this function. Falls back to `defaults.web_hook_url`. Basic auth can be embedded as `username:password@url`.")
  @example("https://example.com/sidecar/swaig")
  web_hook_url?: string;

  @doc("Basic-auth username for this function's webhook. Falls back to `defaults.web_hook_auth_user`.")
  @example("user")
  web_hook_auth_user?: string;

  @doc("Basic-auth password for this function's webhook. Falls back to `defaults.web_hook_auth_password`.")
  @example("pass")
  web_hook_auth_password?: string;
}
