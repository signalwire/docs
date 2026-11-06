import "../../ai";
import "./functions.tsp";

namespace SWML.Calling;

// Bedrock's SWAIG supports only `functions` and `defaults.web_hook_url`.
// `native_functions`, `includes`, `internal_fillers`, and `mcp_servers` work on `ai`
// only, so they are not offered here — Bedrock ignores them without raising an error.
// The `ai` defaults' `web_hook_auth_user`/`web_hook_auth_password` and their fallback
// are not supported either, so `web_hook_url` is re-declared without that fallback:
// credentials go in the URL itself (`username:password@url`).
@summary("defaults")
model BedrockSWAIGDefaults {
  @doc("""
    Default URL that receives calls to every function without its own `web_hook_url`.
    Authentication can also be set in the url in the format of `username:password@url`.
    """)
  @example("https://username:password@example.com")
  web_hook_url?: string;
}

model BedrockSWAIG {
  @doc("An array of functions the agent can call during the conversation. Default is not set.")
  functions?: BedrockSWAIGFunction[];

  @doc("Default settings for all SWAIG functions. If `defaults` is not set, settings may be set in each function object. Default is not set.")
  defaults?: BedrockSWAIGDefaults;
}
