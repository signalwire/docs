import "@typespec/json-schema";
import "./contexts";
import "../_shared/pom.tsp";
import "../../../../Shared/Types/main.tsp";

using TypeSpec.JsonSchema;

namespace SWML.Calling;

model AIPromptBase {
  // Read by the `ai` verb only. Bedrock does not select a model from its prompt objects;
  // its prompt models are expected to omit this (see handoffs for amazon_bedrock).
  @doc("""
    The AI model to use for this prompt. On `prompt`, it takes precedence over `params.ai_model`.
    On `post_prompt`, it selects the model that writes the summary; when omitted, the agent's model is used.
    A model that isn't available is replaced with a default model where possible.
    """)
  @example("gpt-4.1-mini")
  `model`?: string;

  @doc("Limits the amount of tokens that the AI agent may generate when creating its response")
  @minValue(0)
  @maxValue(4096)
  @example(256)
  max_tokens?: int32 = 256;

  @doc("Randomness setting. Float value between 0.0 and 1.5. Closer to 0 will make the output less random. **Default:** `1.0`.")
  @minValue(0.0)
  @maxValue(1.5)
  @example(0.7)
  temperature?: float | SWMLVar = 1.0;

  @doc("Randomness setting. Alternative to `temperature`. Float value between 0.0 and 1.0. Closer to 0 will make the output less random. **Default:** `1.0`.")
  @minValue(0.0)
  @maxValue(1.0)
  @example(0.9)
  top_p?: float | SWMLVar = 1.0;

  #deprecated "`confidence` has no effect and can be omitted."
  @doc("Has no effect and can be omitted. Setting it does not change speech detection.")
  @minValue(0.0)
  @maxValue(1.0)
  confidence?: float | SWMLVar;

  @doc("Aversion to staying on topic. Float value between -2.0 and 2.0. Positive values increase the model's likelihood to talk about new topics. **Default:** `0`.")
  @minValue(-2.0)
  @maxValue(2.0)
  @example(0.0)
  presence_penalty?: float | SWMLVar = 0;

  @doc("Aversion to repeating lines. Float value between -2.0 and 2.0. Positive values decrease the model's likelihood to repeat the same line verbatim. **Default:** `0`.")
  @minValue(-2.0)
  @maxValue(2.0)
  @example(0.0)
  frequency_penalty?: float | SWMLVar = 0;
}

const aiPromptStepsDescription: string = """
  An array of steps for a conversation that needs only one context. It works like the `steps` of a
  `default` context. Ignored when `contexts` is set.
  """;

@summary("Prompt with POM")
model AIPromptPom is AIPromptBase {
  @doc("""
    Prompt Object Model (POM) is a structured data format for composing, organizing, and rendering prompt instructions for AI agents.
    POM ensures that the prompt is structured in a way that is best for the AI agent to understand and execute.
    Each section in the array, at any position, has an optional `title` and needs a `body`, `bullets`, or both;
    sections can nest further sections under `subsections`.
    """)
  @minItems(1)
  pom: POM[];

  @doc("""
    An object that defines the context steps for the AI. The context steps are used to define the flow of the conversation.
    Every context object requires a `default` key, which is the default context to use at the beginning of the conversation.
    Additionally, more context steps can be defined as any other key in the object.
    """)
  contexts?: Contexts;

  @doc(aiPromptStepsDescription)
  steps?: ContextSteps[];
}

@summary("Prompt with Text")
model AIPromptText is AIPromptBase {
  @doc("The instructions to send to the agent.")
  @example("Your name is Franklin and you are taking orders for Franklin's Pizza. Begin by greeting the caller, and ask if they'd like to place an order for pickup or delivery.")
  text: string;

  @doc("""
    An object that defines the context steps for the AI. The context steps are used to define the flow of the conversation.
    Every context object requires a `default` key, which is the default context to use at the beginning of the conversation.
    Additionally, more context steps can be defined as any other key in the object.
    """)
  contexts?: Contexts;

  @doc(aiPromptStepsDescription)
  steps?: ContextSteps[];
}

@summary("Post-Prompt with Text")
model AIPostPromptText is AIPromptBase {
  @doc("The instructions to send to the agent.")
  @example("Summarize the conversation and provide any follow-up action items.")
  text: string;
}

@summary("Post-Prompt with POM")
model AIPostPromptPom is AIPromptBase {
  @doc("The instructions to send to the agent.")
  @minItems(1)
  pom: POM[];
}

@oneOf
union AIPrompt {
  AIPromptText,
  AIPromptPom,
}

union AIPostPrompt {
  AIPostPromptText,
  AIPostPromptPom,
}
