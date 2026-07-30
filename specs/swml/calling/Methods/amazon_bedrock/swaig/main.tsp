import "../../ai";
import "./functions.tsp";

namespace SWML.Calling;

// Bedrock has its own SWAIG parser rather than sharing the `ai` verb's, and reads
// only `functions` and `defaults.web_hook_url`. `native_functions`, `includes`,
// `internal_fillers`, and `mcp_servers` are parsed on the `ai` path only, so they
// must not be picked in here — bedrock ignores them without raising an error.
union PickedBedrockSWAIG {
  "defaults",
}

model BedrockSWAIG {
  @doc("""
    An array of JSON objects to define functions that can be executed during the interaction with the Bedrock AI. Default is not set.
    The fields of this object are the six following.
    """)
  functions?: BedrockSWAIGFunction[];

  ...PickProperties<SWAIG, PickedBedrockSWAIG>;
}
