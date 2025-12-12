import "@typespec/json-schema";

using TypeSpec.JsonSchema;

@summary("LanguagesBase")
model LanguagesBase {
  @doc("Any arbirary name for the language object.")
  name: string;

  @doc("The language code for the ai to hear. For example, 'fr-FR'.")
  code: string;

  @doc("Voice to use for the language. For example, 'fr-FR-Neural2-B'.")
  voice: string;

  @doc("The model to use for the specified TTS engine. For example, 'arcana'.")
  _model?: string;

  @doc("""
    Enables emotion detection for the set TTS engine. This allows the AI to express emotions when speaking.
    A global emotion or specific emotions for certain topics can be set within the prompt of the AI.
    IMPORTANT: Only works with [`Cartesia`](/voice/getting-started/voice-and-languages#cartesia) TTS engine.
    """)
  emotion?: "auto";

  @doc("""
    The speed to use for the specified TTS engine. This allows the AI to speak at a different speed at different points in the conversation.
    The speed behavior can be defined in the prompt of the AI.
    IMPORTANT: Only works with [`Cartesia`](/voice/getting-started/voice-and-languages#cartesia) TTS engine.
    """)
  speed?: "auto";

  #deprecated "The `engine` property is deprecated. Please include the engine in the voice field."
  @doc("The engine to use for the language. For example, 'elevenlabs'.")
  engine?: string;

  @doc("TTS engine-specific parameters for this language.")
  params?: LanguageParams;
}

@summary("LanguageParams")
model LanguageParams {
  @doc("The stability slider determines how stable the voice is and the randomness between each generation. Lowering this slider introduces a broader emotional range for the voice. IMPORTANT: Only works with ElevenLabs TTS engine.")
  @minValue(0.0)
  @maxValue(1.0)
  stability?: float | SWMLVar = 0.50;

  @doc("The similarity slider dictates how closely the AI should adhere to the original voice when attempting to replicate it. The higher the similarity, the closer the AI will sound to the original voice. IMPORTANT: Only works with ElevenLabs TTS engine.")
  @minValue(0.0)
  @maxValue(1.0)
  similarity?: float | SWMLVar = 0.75;
}

@summary("LanguagesWithSoloFillers")
model LanguagesWithSoloFillers is LanguagesBase {
  #deprecated "The `fillers` property is deprecated. Please use `function_fillers` and `speech_fillers` instead."
  @doc("An array of strings to be used as fillers in the conversation. This will be used for both speech and function fillers if provided.")
  fillers?: string[];
}

@summary("LanguagesWithFillers")
model LanguagesWithFillers is LanguagesBase {
  @doc("An array of strings to be used as fillers in the conversation when calling a `swaig function`. This helps the AI break silence between responses. The filler is played asynchronously during the function call.")
  function_fillers?: string[];

  @doc("An array of strings to be used as fillers in the conversation. This helps the AI break silence between responses.")
  speech_fillers?: string[];
}

@summary("languages")
union Languages {
  LanguagesWithSoloFillers,
  LanguagesWithFillers,
}
