import "../ai";

namespace SWML.Calling;

union OmittedPromptProps {
  "contexts",
}

model BedrockPromptText is AIPromptText;

model BedrockPromptPom is AIPostPromptPom;

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
