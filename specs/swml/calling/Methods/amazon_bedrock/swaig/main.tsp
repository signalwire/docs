import "../../ai";
import "./functions.tsp";

namespace SWML.Calling;

// Bedrock has its own SWAIG parser rather than sharing the `ai` verb's, and reads
// only `functions` and `defaults.web_hook_url`. `native_functions`, `includes`,
// `internal_fillers`, and `mcp_servers` are parsed on the `ai` path only, so they
// are not offered here — bedrock ignores them without raising an error. The `ai`
// defaults' `web_hook_auth_user`/`web_hook_auth_password` and their fallback are not
// read either, so `web_hook_url` is re-declared without that fallback: credentials go
// in the URL itself (`username:password@url`).
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
