import "@typespec/json-schema";

using TypeSpec.JsonSchema;

namespace SWML.Calling;

@summary("defaults")
model SWAIGDefaults {
  @doc("Default URL to send status callbacks and reports to. Authentication can also be set in the url in the format of `username:password@url`. Credentials embedded in the URL take precedence over `web_hook_auth_user` and `web_hook_auth_password`.")
  @example("https://username:password@example.com")
  web_hook_url?: string;

  @doc("Default username for basic auth on the function webhook, for functions that don't set their own `web_hook_auth_user`.")
  @example("username")
  web_hook_auth_user?: string;

  @doc("Default password for basic auth on the function webhook, for functions that don't set their own `web_hook_auth_password`.")
  @example("password")
  web_hook_auth_password?: string;

  @doc("Metadata shared by every SWAIG function. A function's own `meta_data` is merged over this, so a key set in both places takes the function's value.")
  @example(#{ customer_id: "cust_123" })
  meta_data?: {
    ...TypeSpec.Record<unknown>;
  };

  @doc("Default scoping token for `meta_data`, for functions that don't set their own `meta_data_token`.")
  @example("support_desk")
  meta_data_token?: string;
}
