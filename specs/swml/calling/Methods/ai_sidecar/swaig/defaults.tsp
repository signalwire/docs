import "@typespec/json-schema";

using TypeSpec.JsonSchema;

namespace SWML.Calling;

@summary("AISidecarSWAIGDefaults object")
model AISidecarSWAIGDefaults {
  @doc("Default webhook URL for functions that do not set their own `web_hook_url`. Basic auth can be embedded as `username:password@url`.")
  @example("https://example.com/sidecar/swaig")
  web_hook_url?: string;

  @doc("Default basic-auth username for the function webhook.")
  @example("user")
  web_hook_auth_user?: string;

  @doc("Default basic-auth password for the function webhook.")
  @example("pass")
  web_hook_auth_password?: string;
}
