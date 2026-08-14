import "../../ai";
import "./data_map.tsp";

namespace SWML.Calling;

// `data_map` is picked apart from the rest: Bedrock's evaluator reads a narrower
// result than the `ai` one, so the property is re-declared per arm as a
// `BedrockDataMap` rather than inherited. Everything else is picked unchanged.
union PickedSWAIGFunctionProps {
  "function",
  "description",
  "parameters",
  "web_hook_url",
  "active",
  "meta_data",
  "meta_data_token",
}

union BedrockSWAIGFunction {
  {
    ...PickProperties<UserSWAIGFunction, PickedSWAIGFunctionProps>,
    data_map?: BedrockDataMap,
  },
  {
    ...PickProperties<StartUpHookSWAIGFunction, PickedSWAIGFunctionProps>,
    data_map?: BedrockDataMap,
  },
  {
    ...PickProperties<HangUpHookSWAIGFunction, PickedSWAIGFunctionProps>,
    data_map?: BedrockDataMap,
  },
  {
    ...PickProperties<
      SummarizeConversationSWAIGFunction,
      PickedSWAIGFunctionProps
    >,
    data_map?: BedrockDataMap,
  },
}
