@summary("LanguageParams")
model LanguageParams {
  @doc("The stability slider determines how stable the voice is and the randomness between each generation. Lowering this slider introduces a broader emotional range for the voice. IMPORTANT: Only works with ElevenLabs TTS engine.")
  @minValue(0.0)
  @maxValue(1.0)
  stability?: float = 0.50;

  @doc("The similarity slider dictates how closely the AI should adhere to the original voice when attempting to replicate it. The higher the similarity, the closer the AI will sound to the original voice. IMPORTANT: Only works with ElevenLabs TTS engine.")
  @minValue(0.0)
  @maxValue(1.0)
  similarity?: float = 0.75;
}

@summary("LanguagesBase")
model LanguagesBase {
  @doc("Name of the language ('French', 'English', etc).")
  @example("French")
  name: string;

  @doc("Language code. For example, 'fr-FR'.")
  @example("fr-FR")
  code: string;

  @doc("Voice to use for the language. For example, 'fr-FR-Neural2-B'.")
  @example("fr-FR-Neural2-B")
  voice: string;
}

@summary("LanguagesWithFillers")
model LanguagesWithFillers is LanguagesBase {
  @doc("An array of strings to be used as fillers in the conversation when calling a `swaig function`. This helps the AI break silence between responses.")
  @example(#["great", "ok"])
  function_fillers?: string[];

  @doc("An array of strings to be used as fillers in the conversation. This helps the AI break silence between responses.")
  @example(#["umm", "hmm"])
  speech_fillers?: string[];

  @doc("ElevenLabs voice parameters for this language.")
  params?: LanguageParams;
}

@summary("languages")
union Languages {
  LanguagesWithFillers,
}
