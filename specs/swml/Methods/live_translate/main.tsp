import "@typespec/json-schema";
import "../../Shared/Types/main.tsp";
using TypeSpec.JsonSchema;

@summary("TranslateDirection enum")
enum TranslateDirection {
  @doc("Tranlate the remote caller.")
  `remote-caller`,

  @doc("Translate the local caller.")
  `local-caller`,
}

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

    @doc("Whether to enable live events.")
    live_events?: boolean | SWMLVar;

    @doc("Whether to enable AI summarization.")
    ai_summary?: boolean | SWMLVar;

    @doc("The timeout for speech recognition.")
    speech_timeout?: integer | SWMLVar;

    @doc("Voice activity detection silence time in milliseconds.")
    vad_silence_ms?: integer | SWMLVar;

    @doc("Voice activity detection threshold.")
    vad_thresh?: integer | SWMLVar;

    @doc("Debug level for logging")
    debug_level?: integer | SWMLVar;

    @doc("The direction of the call that should be translated.")
    direction: TranslateDirection[];

    @doc("The speech engine to be used.")
    speech_engine: string;

    @doc("The prompt for summarizaton.")
    summary_prompt?: string;
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

    @doc("The prompt for summarizaton.")
    prompt?: string;
  };
}

@summary("InjectAction object")
model InjectAction {
  @doc("Injects a message into the conversation.")
  inject: {
    @doc("The message to be injected")
    message: string;

    @doc("The direction of the message that should be injected.")
    direction: TranslateDirection[];
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
