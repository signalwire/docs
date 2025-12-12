alias number = integer | float;

@pattern("^[\\$%]\\{.*\\}$")
scalar SWMLVar extends string;

alias SupportedAIModels = "gpt-4o-mini" | "gpt-4.1-mini" | "gpt-4.1-nano" | string;

@doc("Speech recognition engine options.")
enum SpeechEngine {
  @doc("Use Deepgram for speech recognition.")
  deepgram,

  @doc("Use Google for speech recognition.")
  google,
}
