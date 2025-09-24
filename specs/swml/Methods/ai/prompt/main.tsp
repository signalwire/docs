import "@typespec/json-schema";
import "./contexts";
import "../_shared/pom.tsp";
import "../../../Shared/Types/main.tsp";

using TypeSpec.JsonSchema;

@summary("AIPromptBase")
model AIPromptBase {
  @doc("Limits the amount of tokens that the AI agent may generate when creating its response")
  @minValue(0)
  @maxValue(4096)
  max_tokens?: int32 = 256;

  @doc("Randomness setting. Float value between 0.0 and 1.5. Closer to 0 will make the output less random.")
  @minValue(0.0)
  @maxValue(1.5)
  temperature?: float | SWMLVar;

  @doc("Randomness setting. Alternative to `temperature`. Float value between 0.0 and 1.0. Closer to 0 will make the output less random.")
  @minValue(0.0)
  @maxValue(1.0)
  top_p?: float | SWMLVar;

  @doc("""
    Threshold to fire a speech-detect event at the end of the utterance. Float value between 0.0 and 1.0. 
    Decreasing this value will reduce the pause after the user speaks, but may introduce false positives.
    """)
  @minValue(0.0)
  @maxValue(1.0)
  confidence?: float | SWMLVar;

  @doc("Aversion to staying on topic. Float value between -2.0 and 2.0. Positive values increase the model's likelihood to talk about new topics.")
  @minValue(-2.0)
  @maxValue(2.0)
  presence_penalty?: float | SWMLVar;

  @doc("Aversion to repeating lines. Float value between -2.0 and 2.0. Positive values decrease the model's likelihood to repeat the same line verbatim.")
  @minValue(-2.0)
  @maxValue(2.0)
  frequency_penalty?: float | SWMLVar;
}

model AIPromptPom is AIPromptBase {
  @doc("""
    Prompt Object Model (POM) is a structured data format for composing, organizing, and rendering prompt instructions for AI agents.
    POM ensures that the prompt is structured in a way that is best for the AI agent to understand and execute.
    The first item in the array MUST be FirstPOMSection (with optional title).
    All subsequent items MUST be PomSection (with required title and body).
    """)
  @minItems(1)
  pom: POM[];

  @doc("""
    An object that defines the context steps for the AI. The context steps are used to define the flow of the conversation.
    Every context object requires a `default` key, which is the default context to use at the beginning of the conversation.
    Additionally, more context steps can be defined as any other key in the object.
    """)
  contexts?: Contexts;
}

model AIPromptText is AIPromptBase {
  @doc("The instructions to send to the agent.")
  text: string;

  @doc("""
    An object that defines the context steps for the AI. The context steps are used to define the flow of the conversation.
    Every context object requires a `default` key, which is the default context to use at the beginning of the conversation.
    Additionally, more context steps can be defined as any other key in the object.
    """)
  contexts?: Contexts;
}

model AIPostPromptText is AIPromptBase {
  @doc("The instructions to send to the agent.")
  text: string;
}

model AIPostPromptPom is AIPromptBase {
  @doc("The instructions to send to the agent.")
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
