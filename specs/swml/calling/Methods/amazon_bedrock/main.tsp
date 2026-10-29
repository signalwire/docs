import "../ai";
import "./prompt.tsp";
import "./swaig";
import "./params.tsp";

namespace SWML.Calling;

@summary("Ommited properties from AI Type")
union AmazonBedrockOmitProps {}

model AmazonBedrockObject {
  @doc("""
    Initial data shared by all of the agent's SWAIG functions. It is sent with every function call to your
    `web_hook_url`, is available to `data_map` templates under `session_data.global_data`, and is included in the
    post-prompt summary report. The `set_global_data` and `unset_global_data` actions change it during the call.
    """)
  @example(#{ company_name: "Acme Corp", support_hours: "9am-5pm EST" })
  global_data?: {
    ...TypeSpec.Record<unknown>;
  };

  @doc("A JSON object containing parameters as key-value pairs.")
  params?: BedrockParams;

  @doc("""
    Optional instructions for the summary written when the conversation ends, as `text` or `pom`.
    When omitted, a default summary instruction is used. Has no effect unless `post_prompt_url` is set.
    """)
  post_prompt?: BedrockPostPrompt;

  @doc("""
    The URL that receives the conversation summary report when the conversation ends. The summary is written
    only when this is set. Authentication can also be set in the url in the format of `username:password@url`.
    """)
  @example("https://example.com/bedrock-callback")
  post_prompt_url?: url;

  @doc("Establishes the initial set of instructions and settings to configure the agent.")
  prompt: BedrockPrompt;

  @doc("An object containing the user-defined `functions` the agent can call during the dialogue and their `defaults`.")
  SWAIG?: BedrockSWAIG;
}

@summary("amazon_bedrock Method")
model AmazonBedrock {
  @doc("Creates a new Bedrock AI Agent")
  amazon_bedrock: AmazonBedrockObject;
}
