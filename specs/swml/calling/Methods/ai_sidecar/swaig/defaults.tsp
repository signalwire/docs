import "@typespec/json-schema";

using TypeSpec.JsonSchema;

namespace SWML.Calling;

@summary("AISidecarSWAIGDefaults object")
model AISidecarSWAIGDefaults {
  @doc("Default webhook URL for functions that do not set their own `web_hook_url`. Authentication can also be set in the url in the format of `username:password@url`. Credentials embedded in the URL take precedence over `web_hook_auth_user` and `web_hook_auth_password`.")
  @example("https://example.com/sidecar/swaig")
  web_hook_url?: string;

  @doc("Default username for basic auth on the function webhook, for functions that don't set their own `web_hook_auth_user`.")
  @example("username")
  web_hook_auth_user?: string;

  @doc("Default password for basic auth on the function webhook, for functions that don't set their own `web_hook_auth_password`.")
  @example("password")
  web_hook_auth_password?: string;
}
