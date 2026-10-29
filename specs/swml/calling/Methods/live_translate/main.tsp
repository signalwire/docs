import "@typespec/json-schema";
import "../../../Shared/Types/main.tsp";
using TypeSpec.JsonSchema;

namespace SWML.Calling;

@summary("TranslateDirection enum")
enum TranslateDirection {
  @doc("Translate the remote caller.")
  `remote-caller`,

  @doc("Translate the local caller.")
  `local-caller`,
}

@summary("Filter Presets")
@doc("""
  Preset translation filter values that adjust the tone or style of translated speech.
  
  - `polite` - Translates to a polite version, removing anything insulting while maintaining sentiment
  - `rude` - Translates to a rude and insulting version while maintaining sentiment
  - `professional` - Translates to sound professional, removing slang or lingo
  - `shakespeare` - Translates to sound like Shakespeare, speaking in iambic pentameter
  - `gen-z` - Translates to use Gen-Z slang and expressions
  """)
enum TranslationFilterPreset {
  polite,
  rude,
  professional,
  shakespeare,
  `gen-z`,
}

@summary("Custom Filter")
@doc("Custom translation filter with a prompt prefix. Use `prompt:` followed by your custom instructions (e.g., `prompt:Use formal business language`).")
@pattern("^prompt:.+$")
scalar CustomTranslationFilter extends string;

alias TranslationFilter = TranslationFilterPreset | CustomTranslationFilter;

@summary("StartAction object")
model StartAction {
  @doc("Starts live translation of the call. The translation will be sent to the specified URL.")
  start: {
    @doc("The webhook URL to be called.")
    @example("https://example.com/translation-webhook")
    webhook?: string;

    @doc("""
      One of the two languages in the translation. The first direction in `direction` is translated into this language; a second direction is translated from it.
      Use a code that `speech_engine` recognizes (with the default Deepgram engine, a code from Deepgram's Nova-3 language table)
      and that the voice speaking this language supports.
      """)
    @example("en-US")
    from_lang: string;

    @doc("""
      The other language in the translation. The first direction in `direction` is translated from this language; a second direction is translated into it.
      Use a code that `speech_engine` recognizes (with the default Deepgram engine, a code from Deepgram's Nova-3 language table)
      and that the voice speaking this language supports.
      """)
    @example("es-ES")
    to_lang: string;

    @doc("""
      The TTS voice that speaks translations into `from_lang` (the first direction in `direction`).
      Defaults to `azure.en-US-RyanMultilingualNeural`.
      A voice that doesn't start with a lowercase engine prefix live translation supports, such as `polly.`, `gcloud.`,
      `azure.` or `elevenlabs.`, is replaced by the default. For example, `rachel`, `amazon.Joanna` and `Polly.Joanna` are all spoken as `azure.en-US-RyanMultilingualNeural`.
      """)
    @example("polly.Joanna")
    from_voice?: string;

    @doc("""
      The TTS voice that speaks translations into `to_lang` (a second direction in `direction`).
      Defaults to `azure.en-US-RyanMultilingualNeural`.
      A voice that doesn't start with a lowercase engine prefix live translation supports, such as `polly.`, `gcloud.`,
      `azure.` or `elevenlabs.`, is replaced by the default. For example, `rachel`, `amazon.Joanna` and `Polly.Joanna` are all spoken as `azure.en-US-RyanMultilingualNeural`.
      """)
    @example("polly.Lucia")
    to_voice?: string;

    @doc("""
      Translation filter for translations into `to_lang` (a second direction in `direction`).
      Accepts a SWML variable reference that resolves to a preset or custom filter.
      """)
    filter_from?: TranslationFilter | SWMLVar;

    @doc("""
      Translation filter for translations into `from_lang` (the first direction in `direction`).
      Accepts a SWML variable reference that resolves to a preset or custom filter.
      """)
    filter_to?: TranslationFilter | SWMLVar;

    @doc("Whether to enable live events.")
    @example(true)
    live_events?: boolean | SWMLVar = false;

    @doc("Whether to enable AI summarization.")
    @example(true)
    ai_summary?: boolean | SWMLVar = false;

    @doc("The timeout for speech recognition in milliseconds.")
    @example(30000)
    speech_timeout?: integer | SWMLVar = 60000;

    @doc("""
      Voice activity detection silence time in milliseconds. Default depends on the speech engine: `700` for Deepgram, `500` for Google.
      Omitting the value or setting it to `0` uses the engine default.
      """)
    @example(500)
    vad_silence_ms?: integer | SWMLVar = 700;

    @doc("Voice activity detection threshold (0-1800).")
    @example(400)
    vad_thresh?: integer | SWMLVar = 400;

    @doc("""
      Debug level for logging (0-2).
      Ignored unless SignalWire has enabled debugging on its side, so you can leave it unset.
      """)
    @example(0)
    debug_level?: integer | SWMLVar = 0;

    @doc("""
      The call directions to translate, as an ordered array of at least one direction.
      The order matters: the first direction is translated from `to_lang` into `from_lang`, spoken with `from_voice`, and uses `filter_to`.
      A second direction is translated from `from_lang` into `to_lang`, spoken with `to_voice`, and uses `filter_from`.
      Reversing the order reverses these assignments.
      Accepts a SWML variable reference for the whole array or for each item; resolved values must be `remote-caller` or `local-caller`.
      """)
    @minItems(1)
    direction: (TranslateDirection | SWMLVar)[] | SWMLVar;

    @doc("""
      The speech engine to use for speech recognition.
      Accepts a SWML variable reference that resolves to `deepgram` or `google`.
      """)
    @example(SpeechEngine.google)
    speech_engine?: SpeechEngine | SWMLVar = SpeechEngine.deepgram;

    @doc("The AI prompt that instructs how to summarize the conversation when `ai_summary` is enabled.")
    @example("Summarize the key points of this bilingual conversation.")
    ai_summary_prompt?: string;
  };
}

@oneOf
@summary("SummarizeAction union")
union SummarizeActionUnion {
  SummarizeAction,

  @doc("Summarizes the conversation as a string value.")
  "summarize",
}

@summary("SummarizeAction object")
model SummarizeAction {
  @doc("Summarizes the conversation as an object, allowing you to specify the webhook url and prompt for the summary.")
  summarize: {
    @doc("The webhook URL to be called.")
    @example("https://example.com/summary-webhook")
    webhook?: string;

    @doc("The AI prompt that instructs how to summarize the conversation.")
    @example("Provide a brief summary of the translated conversation.")
    prompt?: string;
  };
}

@summary("InjectAction object")
model InjectAction {
  @doc("Injects a message into the conversation to be translated and spoken to the specified party.")
  inject: {
    @doc("The message to be injected")
    @example("Please hold while I transfer you to a specialist.")
    message: string;

    @doc("""
      The direction of the message.
      Accepts a SWML variable reference that resolves to `remote-caller` or `local-caller`.
      """)
    direction: TranslateDirection | SWMLVar;
  };
}

@oneOf
@summary("TranslateAction union")
union TranslateAction {
  StartAction,

  @doc("Stops live translation of the call.")
  "stop",

  SummarizeActionUnion,
  InjectAction,
}

@summary("live_translate Method")
model LiveTranslate {
  @summary("live_translate")
  @doc("Start live translation of the call. The translation will be sent to the specified webhook URL.")
  live_translate: {
    @doc("""
      The action to perform during live translation.
      Accepts a SWML variable reference that resolves to one of the supported actions.
      """)
    action: TranslateAction | SWMLVar;
  };
}
