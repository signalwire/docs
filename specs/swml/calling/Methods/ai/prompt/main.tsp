import "@typespec/json-schema";
import "./contexts";
import "../_shared/pom.tsp";
import "../../../../Shared/Types/main.tsp";

using TypeSpec.JsonSchema;

namespace SWML.Calling;

model AIPromptBase {
  // Read by the `ai` verb only, and only on `ai.prompt` and `ai.post_prompt`. Bedrock's prompt
  // models pick their properties without it, and a context's `post_prompt` omits it.
  @doc("""
    The AI model to use for this prompt. On `prompt`, it takes precedence over `params.ai_model`.
    On `post_prompt`, it selects the model that writes the summary; when omitted, the agent's model is used.
    Name a model on the supported list, optionally with its provider as `model@provider`, where the provider
    is `openai`, `azure-openai`, or `anthropic` (`gpt-6-luna@azure-openai`). Any other name runs as `gpt-4o-mini`, and the
    call gets a non-fatal `calling.error` whose `error` is `model_substituted` (`post_model_substituted` for
    `post_prompt`). If no model is available at all, the agent doesn't start.
    """)
  @example("gpt-6-luna")
  `model`?: SupportedAIModels;

  @doc("""
    How much the model reasons before it replies. Applies to `gpt-5-mini`, `gpt-5-nano`, `gpt-5.4-mini`,
    `gpt-5.4-nano`, `gpt-5.6-luna`, and `gpt-6-luna`, and is ignored on other models.
    `gpt-5.4-mini`, `gpt-5.4-nano`, `gpt-5.6-luna`, and `gpt-6-luna` accept `none`, `low`, `medium`, `high`,
    and `xhigh`, and default to `none`. `gpt-5-mini` and `gpt-5-nano` accept `minimal`, `low`, `medium`,
    and `high`, and default to `minimal`. A value the model doesn't accept is refused by the model provider.
    """)
  @example("low")
  reasoning_effort?: "none" | "minimal" | "low" | "medium" | "high" | "xhigh";

  @doc("""
    How long the model's replies are. Applies to `gpt-5-mini`, `gpt-5-nano`, `gpt-5.4-mini`, `gpt-5.4-nano`,
    `gpt-5.6-luna`, and `gpt-6-luna`, and is ignored on other models. Any other value uses the default.
    **Default:** `low`.
    """)
  @example("medium")
  verbosity?: "low" | "medium" | "high" = "low";

  @doc("Limits the amount of tokens that the AI agent may generate when creating its response")
  @minValue(0)
  @maxValue(4096)
  @example(256)
  max_tokens?: int32 = 256;

  @doc("""
    Randomness setting. Float value between 0.0 and 1.5. Closer to 0 will make the output less random.
    On a model that takes `reasoning_effort`, it applies only when `reasoning_effort` is `none`, and
    `gpt-5.6-luna` and `gpt-6-luna` default to `0.3`. **Default:** `1.0`.
    """)
  @minValue(0.0)
  @maxValue(1.5)
  @example(0.7)
  temperature?: float | SWMLVar = 1.0;

  @doc("""
    Randomness setting. Alternative to `temperature`. Float value between 0.0 and 1.0. Closer to 0 will make
    the output less random. On a model that takes `reasoning_effort`, it applies only when `reasoning_effort`
    is `none`, and `gpt-5.6-luna` and `gpt-6-luna` default to `0.9`. **Default:** `1.0`.
    """)
  @minValue(0.0)
  @maxValue(1.0)
  @example(0.9)
  top_p?: float | SWMLVar = 1.0;

  #deprecated "`confidence` has no effect and can be omitted."
  @doc("Has no effect and can be omitted. Setting it does not change speech detection.")
  @minValue(0.0)
  @maxValue(1.0)
  confidence?: float | SWMLVar;

  @doc("Aversion to staying on topic. Float value between -2.0 and 2.0. Positive values increase the model's likelihood to talk about new topics. Not used on `gpt-6-luna`. **Default:** `0`.")
  @minValue(-2.0)
  @maxValue(2.0)
  @example(0.0)
  presence_penalty?: float | SWMLVar = 0;

  @doc("Aversion to repeating lines. Float value between -2.0 and 2.0. Positive values decrease the model's likelihood to repeat the same line verbatim. Not used on `gpt-6-luna`. **Default:** `0`.")
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

// A context's `post_prompt` is parsed like `ai.post_prompt`, but its `model` is never read:
// only `ai.post_prompt.model` selects the model that writes the summary.
@summary("Context Post-Prompt with Text")
model ContextPostPromptText {
  ...OmitProperties<AIPostPromptText, "model">;
}

@summary("Context Post-Prompt with POM")
model ContextPostPromptPom {
  ...OmitProperties<AIPostPromptPom, "model">;
}

union ContextPostPrompt {
  ContextPostPromptText,
  ContextPostPromptPom,
}
