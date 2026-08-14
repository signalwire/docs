import "@typespec/json-schema";
import "../../../Shared/Types/main.tsp";
import "./ai_languages.tsp";
import "./_shared/fillers.tsp";

using TypeSpec.JsonSchema;

namespace SWML.Calling;

// A multilingual entry is flat: parse_multilingual reads only `language`, `voice`, `engine`,
// `model`, and `params`. The last four are shared with `languages[]` and picked from
// LanguagesBase so their descriptions live in one place. Anything added to LanguagesBase must
// be picked in here deliberately, or it would appear in the schema while the engine ignores it.
union PickedMultilingualLanguage {
  "voice",
  "engine",
  "model",
  "params",
}

@summary("MultilingualLanguage")
model MultilingualLanguage {
  @doc("""
    The language this voice applies to, as a code the ASR engine supports.
    Use `default` instead of a code to mark the catch-all entry, which speaks any
    detected language that has no entry of its own.
    """)
  @example("es")
  language: string;

  ...PickProperties<LanguagesBase, PickedMultilingualLanguage>;
}

@summary("multilingual")
model Multilingual {
  @doc("""
    An array of voices, one per language the agent speaks.
    At least one entry must supply a `voice`, either an entry with `language` set to
    `default` or the first language listed. Without one, multilingual mode does not
    start and the agent falls back to a single English voice.
    """)
  languages: MultilingualLanguage[];

  @doc("""
    Restricts detection to this set of language codes. Every code must be supported by
    the ASR engine and model in use, or multilingual mode does not start.
    Omit to let the ASR engine detect any language it supports.
    """)
  @example(#["en", "es", "fr"])
  allowed?: string[];

  @doc("""
    The ASR (Automatic Speech Recognition) engine used to detect the spoken language.
    This is separate from the TTS engine that speaks each voice.
    If you leave it unset, the engine already configured for the agent is used, falling back to
    `deepgram` when the agent has none.
    """)
  @example("deepgram")
  engine?: string;

  @doc("The ASR model used to detect the spoken language. The model must support code-switching, or multilingual mode does not start.")
  @example("nova-3")
  `model`?: string = "nova-3";

  @doc("""
    The ASR provider used to detect the spoken language.
    If you leave it unset, the provider already configured for the agent is used, falling back to
    `deepgram` when the agent has none. Setting it here also applies it to the recognizer.
    """)
  @example("deepgram")
  provider?: string;

  @doc("""
    The language the agent opens the conversation in, before the caller has said
    anything for the ASR engine to detect.
    """)
  @example("en")
  start_language?: string = "en";

  @doc("""
    How many words a caller must say before the agent will switch languages.
    A single word is often the same in several languages — a name, `no`, `ok` — so a
    one-word turn is an unreliable signal. Set to `1` to allow single-word switches.
    """)
  @minValue(1)
  @example(2)
  min_switch_words?: integer = 2;

  @doc("""
    Fillers used to break silence between turns.
    Supply an array to have the fillers translated into whichever language the caller
    is speaking, or an object keyed by language code to set them per language verbatim.
    An `auto` key inside the object is translated the same way an array is.
    """)
  @example(#["umm", "hmm"])
  fillers?: string[] | FunctionFillers;

  @doc("""
    Fillers used while a SWAIG function runs.
    Supply an array to have the fillers translated into whichever language the caller
    is speaking, or an object keyed by language code to set them per language verbatim.
    An `auto` key inside the object is translated the same way an array is.
    """)
  @example(#["great", "ok"])
  function_fillers?: string[] | FunctionFillers;

  @doc("""
    Fillers used to acknowledge the caller the moment they finish a turn.
    Supply an object keyed by language code, optionally with a `default` key for
    languages you have not listed. These fillers are never translated on the fly, so
    the `auto` key does not apply here — resolving them has to be fast enough to play
    immediately. An array is accepted and treated as the `default` set.
    """)
  turn_fillers?: string[] | FunctionFillers;
}
