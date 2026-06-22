import "../ai";

namespace SWML.Calling;

union OmittedPromptProps {
  "contexts",
}

model BedrockPromptBase {
  @example("matthew")
  voice_id?: "tiffany" | "matthew" | "amy" | "lupe" | "carlos" = "matthew";
}

model BedrockPromptText is BedrockPromptBase {
  ...AIPromptText;
}

model BedrockPromptPom is BedrockPromptBase {
  ...AIPostPromptPom;
}

union BedrockPrompt {
  OmitProperties<BedrockPromptText, OmittedPromptProps>,
  OmitProperties<BedrockPromptPom, OmittedPromptProps>,
}

model BedrockPostPromptText is AIPostPromptText;

model BedrockPostPromptPom is AIPostPromptPom;

union BedrockPostPrompt {
  OmitProperties<BedrockPostPromptText, OmittedPromptProps>,
  OmitProperties<BedrockPostPromptPom, OmittedPromptProps>,
}
