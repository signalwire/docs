import "../ai";

namespace SWML.Calling;

// A Bedrock prompt uses only `text` or `pom`, `voice_id`, `temperature` and `top_p`.
// The rest of the `ai` prompt (`model`, `max_tokens`, `confidence`, `presence_penalty`,
// `frequency_penalty`, `contexts`, `steps`) has no effect, so the Bedrock prompts pick
// their content member rather than spreading `AIPromptText`/`AIPromptPom`.
//
// `temperature` and `top_p` are re-declared rather than picked: Bedrock has its own
// defaults (0.7 and 0.9) and accepts them as numbers or numeric strings, with no variable expansion.
@summary("Bedrock prompt settings")
model BedrockPromptBase {
  @doc("The voice the agent speaks with. **Default:** `matthew`.")
  @example("matthew")
  voice_id?: "tiffany" | "matthew" | "amy" | "lupe" | "carlos" = "matthew";

  @doc("Randomness setting. Float value between 0.0 and 1.5. Closer to 0 will make the output less random. **Default:** `0.7`.")
  @minValue(0.0)
  @maxValue(1.5)
  @example(0.5)
  temperature?: float = 0.7;

  @doc("Randomness setting. Alternative to `temperature`. Float value between 0.0 and 1.0. Closer to 0 will make the output less random. **Default:** `0.9`.")
  @minValue(0.0)
  @maxValue(1.0)
  @example(0.9)
  top_p?: float = 0.9;
}

@summary("Bedrock prompt with text")
model BedrockPromptText {
  ...PickProperties<AIPromptText, "text">;
  ...BedrockPromptBase;
}

@summary("Bedrock prompt with POM")
@doc("A prompt written as a Prompt Object Model (POM). Set either `text` or `pom`, not both. If a document sets both at runtime, `text` is used.")
model BedrockPromptPom {
  ...PickProperties<AIPromptPom, "pom">;
  ...BedrockPromptBase;
}

union BedrockPrompt {
  BedrockPromptText,
  BedrockPromptPom,
}

// A Bedrock `post_prompt` uses only `text` or `pom`, and the summary is written with fixed
// model settings, so none of the `ai` post-prompt tuning members are offered here.
@summary("Bedrock post-prompt with text")
model BedrockPostPromptText {
  ...PickProperties<AIPostPromptText, "text">;
}

@summary("Bedrock post-prompt with POM")
@doc("Summary instructions written as a Prompt Object Model (POM). Set either `text` or `pom`, not both. If a document sets both at runtime, `text` is used.")
model BedrockPostPromptPom {
  ...PickProperties<AIPostPromptPom, "pom">;
}

union BedrockPostPrompt {
  BedrockPostPromptText,
  BedrockPostPromptPom,
}
