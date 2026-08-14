import "@typespec/json-schema";
import "../../../Shared/Types/main.tsp";
import "./ai_pronounce.tsp";

using TypeSpec.JsonSchema;

namespace SWML.Calling;

@summary("LanguagesBase")
model LanguagesBase {
  @doc("Name of the language (e.g., 'French', 'English'). This value is used in the system prompt to instruct the LLM what language is being spoken.")
  @example("French")
  name: string;

  @doc("""
    The language code for ASR (Automatic Speech Recognition) purposes. By default, SignalWire uses Deepgram's
    Nova-3 STT engine, so this value should match a code from Deepgram's Nova-3 language codes.
    If a different STT model was selected using the `openai_asr_engine` parameter, you must select a code supported by that engine.

    Supply an array to have this voice listen for up to three codes at once.

    Set it to `multi` to have the engine transcribe whichever of its supported languages the caller
    speaks, rather than one fixed language. The agent still answers in this entry's single `voice`.
    To answer in the caller's language as well, use [`ai.multilingual`](/docs/swml/reference/calling/ai/multilingual)
    instead, which builds on the same code-switching mode and adds a voice per language.
    """)
  @example("fr-FR")
  code: string | string[];

  @doc("""
    An alias for `code`, read only when `code` is absent. Prefer `code`.
    """)
  @example("fr-FR")
  listen_language?: string | string[];

  @doc("""
    Voice to use for the language. String format: `<engine id>.<voice id>`, with an optional
    `:<model id>` suffix for engines that offer a choice of model.
    Select engine from `gcloud`, `polly`, `amazon`, `azure`, `openai`, `elevenlabs`, `cartesia`, `deepgram`, `rime`,
    `inworld`, `minimax`, `groq-tts`, `mistral`, `grok`, `smallest`, `fish`, or `speechify`.
    For example, `gcloud.fr-FR-Neural2-B` or `elevenlabs.rachel:eleven_flash_v2_5`.
    Always name the engine: a bare voice id resolves against a default engine that can change.
    """)
  @example("gcloud.fr-FR-Neural2-B")
  voice: string;

  @doc("""
    The model to use for the specified TTS engine. For example, `coda`.
    Set this only if the `voice` string does not already carry a `:<model id>` suffix.
    """)
  @example("coda")
  `model`?: string;

  @doc("""
    Lets the AI vary its emotion as it speaks. A global emotion, or specific emotions for certain
    topics, can be set within the prompt of the AI.
    IMPORTANT: Only works with the [`Cartesia`](/docs/platform/voice/tts/cartesia) and [`MiniMax`](/docs/platform/voice/tts/minimax) TTS engines.
    For a fixed (non-automatic) MiniMax emotion, use [`params.emotion`](#languagesparams) instead.
    """)
  @example(true)
  auto_emotion?: boolean = false;

  @doc("""
    Lets the AI vary its speaking speed during the conversation. The speed behavior can be defined
    in the prompt of the AI.
    IMPORTANT: Only works with the [`Cartesia`](/docs/platform/voice/tts/cartesia),
    [`ElevenLabs`](/docs/platform/voice/tts/elevenlabs), [`MiniMax`](/docs/platform/voice/tts/minimax),
    [`Rime`](/docs/platform/voice/tts/rime), [`Inworld`](/docs/platform/voice/tts/inworld),
    [`Smallest`](/docs/platform/voice/tts/smallest), and [`Fish`](/docs/platform/voice/tts/fish) TTS engines.
    """)
  @example(true)
  auto_speed?: boolean = false;

  // Deprecated so SWML voice IDs are written the same way as voice IDs elsewhere on the
  // platform, cXML included: one `engine.voice` string rather than a separate engine field.
  // The engine still reads this key, so it is a style deprecation, not a behavior change.
  // `MultilingualLanguage` picks this property and inherits the deprecation with it.
  #deprecated "The `engine` property is deprecated. Please include the engine in the voice field."
  @doc("The engine to use for the language. For example, `elevenlabs`.")
  @example("elevenlabs")
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

  @doc("Adjusts how quickly the voice speaks. Values below `1.0` slow the voice down; values above `1.0` speed it up. IMPORTANT: Only works with the Inworld TTS engine.")
  @minValue(0.5)
  @maxValue(1.5)
  speakingRate?: float | SWMLVar = 1.0;

  @doc("Controls the randomness and expressiveness of the generated speech. Lower values produce a more consistent, predictable delivery; higher values introduce more variation. IMPORTANT: Only works with the Inworld TTS engine.")
  @minValue(0.0)
  @maxValue(2.0)
  temperature?: float | SWMLVar = 1.0;

  @doc("How quickly the voice speaks. Values below `1.0` slow the voice down; values above `1.0` speed it up. IMPORTANT: Only works with the MiniMax TTS engine.")
  @minValue(0.5)
  @maxValue(2.0)
  speed?: float | SWMLVar = 1.0;

  @doc("The speaking volume. Lower values are quieter. IMPORTANT: Only works with the MiniMax TTS engine.")
  @minValue(0.1)
  @maxValue(1.0)
  vol?: float | SWMLVar = 1.0;

  @doc("The pitch shift in semitones. Negative values lower the pitch; positive values raise it. IMPORTANT: Only works with the MiniMax TTS engine.")
  @minValue(-12)
  @maxValue(12)
  pitch?: int32 | SWMLVar = 0;

  @doc("""
    A fixed emotional tone for the generated speech.
    To vary the emotion automatically during a conversation, use [`languages[].emotion`](#languagesemotion) set to `auto` instead.
    IMPORTANT: Only works with the MiniMax TTS engine.
    """)
  @example("happy")
  emotion?: "happy" | "sad" | "angry" | "fearful" | "disgusted" | "surprised" | "neutral";
}

// One model rather than the two-variant union this used to be. The union made `fillers` and
// `speech_fillers` mutually exclusive, which the engine never enforced — it reads all of these
// keys off the same entry.
@summary("languages")
model Languages is LanguagesBase {
  #deprecated "The `fillers` property is deprecated. Please use `function_fillers` instead."
  @doc("""
    A deprecated spelling of `function_fillers`, and never used for speech fillers.
    An explicit `function_fillers` on the same entry takes precedence over it.
    """)
  @example(#["umm", "let me check"])
  fillers?: string[];

  @doc("An array of strings to be used as fillers in the conversation when calling a `swaig function`. This helps the AI break silence between responses. The filler is played asynchronously during the function call.")
  @example(#["great", "ok"])
  function_fillers?: string[];

  @doc("""
    An array of strings to be used as fillers in the conversation. This helps the AI break silence between responses.
    Note: `speech_fillers` are used between every 'turn' taken by the LLM, including at the beginning of the call.
    For more targeted fillers, consider using `function_fillers`.
    """)
  @example(#["umm", "hmm"])
  speech_fillers?: string[];

  @doc("""
    Short backchannels played while the caller still has the floor and the agent is deliberately
    waiting, as when they spell a name or read out a number, to signal it is still listening.
    Unlike the language-keyed map on [`ai.multilingual`](/docs/swml/reference/calling/ai/multilingual),
    this is a plain array, because the entry already fixes the language.
    Which waits earn one is set by [`params.turn_filler_sources`](/docs/swml/reference/calling/ai/params#paramsturn_filler_sources).
    """)
  @example(#["mhm", "go on"])
  turn_fillers?: string[];

  @doc("""
    Pronunciation replacements applied only while this language is active.
    For replacements that apply to the whole call, use [`ai.pronounce`](/docs/swml/reference/calling/ai#aipronounce) instead.
    """)
  pronounce?: Pronounce[];
}
