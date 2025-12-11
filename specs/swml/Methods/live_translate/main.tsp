import "@typespec/json-schema";
import "../../Shared/Types/main.tsp";
using TypeSpec.JsonSchema;

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
    webhook?: string;

    @doc("The language to translate from.")
    from_lang: string;

    @doc("The language to translate to.")
    to_lang: string;

    @doc("The TTS voice you want to use for the source language.")
    from_voice?: string;

    @doc("The TTS voice you want to use for the target language.")
    to_voice?: string;

    @doc("Translation filter for the source language direction.")
    filter_from?: TranslationFilter;

    @doc("Translation filter for the target language direction.")
    filter_to?: TranslationFilter;

    @doc("Whether to enable live events.")
    live_events?: boolean | SWMLVar;

    @doc("Whether to enable AI summarization.")
    ai_summary?: boolean | SWMLVar;

    @doc("Speech timeout in milliseconds.")
    speech_timeout?: integer | SWMLVar = 60000;

    @doc("Voice activity detection silence time in milliseconds. Default depends on speech engine: `300` for Deepgram, `500` for Google.")
    vad_silence_ms?: integer | SWMLVar;

    @doc("Voice activity detection threshold (0-1800).")
    vad_thresh?: integer | SWMLVar = 400;

    @doc("Debug level for logging (0-2).")
    debug_level?: integer | SWMLVar = 0;

    @doc("The direction of the call that should be translated.")
    direction: TranslateDirection[];

    @doc("The speech engine to use for speech recognition.")
    speech_engine?: SpeechEngine = SpeechEngine.deepgram;

    @doc("The AI prompt that instructs how to summarize the conversation when `ai_summary` is enabled.")
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
    webhook?: string;

    @doc("The AI prompt that instructs how to summarize the conversation.")
    prompt?: string;
  };
}

@summary("InjectAction object")
model InjectAction {
  @doc("Injects a message into the conversation to be translated and spoken to the specified party.")
  inject: {
    @doc("The message to be injected.")
    message: string;

    @doc("The direction of the message.")
    direction: TranslateDirection;
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

@summary("LiveTranslate object")
model LiveTranslate {
  @summary("live_translate")
  @doc("Starts a live translation session of the call. The translation will be sent to the specified URL.")
  live_translate: {
    @doc("The action to perform during live translation.")
    action: TranslateAction;
  };
}
