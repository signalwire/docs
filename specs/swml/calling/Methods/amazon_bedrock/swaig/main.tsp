import "../../ai";
import "./functions.tsp";

namespace SWML.Calling;

// Bedrock has its own SWAIG parser rather than sharing the `ai` verb's, and reads
// only `functions` and `defaults.web_hook_url`. `native_functions`, `includes`,
// `internal_fillers`, and `mcp_servers` are parsed on the `ai` path only, so they
// must not be picked in here — bedrock ignores them without raising an error. The
// same goes for the `ai` defaults' `web_hook_auth_user`/`web_hook_auth_password`:
// bedrock reads no auth keys from `defaults`, so it picks `web_hook_url` alone.
// Credentials go in the URL itself (`username:password@url`).
union PickedBedrockSWAIGDefaults {
  "web_hook_url",
}

@summary("defaults")
model BedrockSWAIGDefaults {
  ...PickProperties<SWAIGDefaults, PickedBedrockSWAIGDefaults>;
}

model BedrockSWAIG {
  @doc("""
    An array of JSON objects to define functions that can be executed during the interaction with the Bedrock AI. Default is not set.
    The fields of this object are the six following.
    """)
  functions?: BedrockSWAIGFunction[];

  @doc("Default settings for all SWAIG functions. If `defaults` is not set, settings may be set in each function object. Default is not set.")
  defaults?: BedrockSWAIGDefaults;
}
