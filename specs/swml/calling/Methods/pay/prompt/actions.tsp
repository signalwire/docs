import "@typespec/json-schema";

using TypeSpec.JsonSchema;

namespace SWML.Calling;

model PayPromptSayAction {
  @doc("The action to perform. `Say` speaks `phrase` using text-to-speech.")
  type: "Say";

  @doc("The phrase to speak")
  @example("Please enter your 16-digit card number.")
  phrase: string;
}

model PayPromptPlayAction {
  @doc("The action to perform. `Play` plays the audio file at the URL in `phrase`.")
  type: "Play";

  @doc("The URL of the audio file to play")
  @pattern("^(http|https)://")
  @example("https://example.com/audio/enter-card-number.mp3")
  phrase: url;
}

union PayPromptAction {
  PayPromptSayAction,
  PayPromptPlayAction,
}
