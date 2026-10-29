import "../../ai";
import "./data_map.tsp";

namespace SWML.Calling;

// A Bedrock function supports `function`, `description`, `parameters`, `web_hook_url`,
// `meta_data`, `meta_data_token` and `data_map`. Only `description` and `parameters` behave
// as they do on `ai`, so only those are picked. The rest are re-declared because Bedrock
// differs:
// - it runs no lifecycle hooks, so `startup_hook`/`hangup_hook` are ordinary names and there
//   are no hook variants; only `summarize_conversation` is special.
// - it ignores `active`, so that property is not offered.
// - it has no separate webhook auth fields; credentials go in the URL.
// - without `meta_data_token`, metadata is scoped to the function name, not the URL.
// - `data_map` results are `BedrockOutput`, not `Output` (see data_map.tsp).
union PickedSWAIGFunctionProps {
  "description",
  "parameters",
}

@summary("Bedrock SWAIG function")
model BedrockSWAIGFunction {
  @doc("""
    A unique name for the function. The agent calls the function by this name.
    The name `summarize_conversation` is reserved for the summary written when the conversation ends:
    a function with that name is not offered to the agent during the call.
    """)
  @example("get_weather")
  function: string;

  ...PickProperties<SWAIGFunctionBase, PickedSWAIGFunctionProps>;

  @doc("""
    Function-specific URL that receives calls to this function. Takes precedence over `defaults.web_hook_url`.
    Authentication can also be set in the url in the format of `username:password@url`.
    """)
  @example("https://username:password@example.com")
  web_hook_url?: string;

  @doc("""
    Data for this function. It is sent with each call to the function's `web_hook_url` and is available to its
    `data_map` templates under `session_data.meta_data`. Functions that share a `meta_data_token` share one set of
    metadata.
    """)
  @example(#{ api_key: "key_123", endpoint: "https://api.example.com" })
  meta_data?: {
    ...TypeSpec.Record<unknown>;
  };

  @doc("""
    Scoping token for `meta_data`. Functions that set the same token share their metadata. When omitted, the
    metadata is scoped to this function's name, so it is not shared with other functions.
    """)
  @example("my-function-scope")
  meta_data_token?: string;

  @doc("""
    Processes the function's input without a `web_hook_url`, through `expressions`, `webhooks`, and `output`,
    tried in that order. The first one that produces a result ends the evaluation.
    """)
  data_map?: BedrockDataMap;
}
