import "@typespec/json-schema";
import "../../Shared/Types/main.tsp";
using TypeSpec.JsonSchema;

@summary("TranscribeDirection enum")
enum TranscribeDirection {
  @doc("Transcribe the remote caller.")
  `remote-caller`,

  @doc("Transcribe the local caller.")
  `local-caller`,
}

@summary("TranscribeStartAction object")
model TranscribeStartAction {
  @doc("Starts live transcription of the call. The transcription will be sent to the specified URL.")
  start: {
    @doc("Enables AI summarization of the transcription. The summary will be sent to the specified URL at the end of the conversation.")
    ai_summary?: boolean | SWMLVar;

    @doc("The webhook URL the transcription will be sent to.")
    webhook?: string;

    @doc("The language to transcribe.")
    lang: string;

    @doc("Whether to enable live events.")
    live_events?: boolean | SWMLVar;

    @doc("The timeout for speech recognition.")
    speech_timeout?: integer | SWMLVar;

    @doc("Voice activity detection silence time in milliseconds.")
    vad_silence_ms?: integer | SWMLVar;

    @doc("Voice activity detection threshold.")
    vad_thresh?: integer | SWMLVar;

    @doc("Debug level for logging")
    debug_level?: integer | SWMLVar;

    @doc("The direction of the call that should be transcribed.")
    direction: TranscribeDirection[];

    @doc("The speech engine to be used.")
    speech_engine: string;

    @doc("The prompt for summarizaton.")
    summary_prompt?: string;
  };
}

@oneOf
@summary("TranscribeSummarizeAction union")
union TranscribeSummarizeActionUnion {
  TranscribeSummarizeAction,

  @doc("Summarizes the conversation as a string value.")
  "summarize",
}

@summary("TranscribeSummarizeAction object")
model TranscribeSummarizeAction {
  @doc("Summarizes the conversation as an object, allowing you to specify the webhook url and prompt for the summary.")
  summarize: {
    @doc("The webhook URL to be called.")
    webhook?: string;

    @doc("The prompt for summarizaton.")
    prompt?: string;
  };
}

@oneOf
@summary("TranscribeAction union")
union TranscribeAction {
  TranscribeStartAction,

  @doc("Stops live transcription of the call.")
  "stop",

  TranscribeSummarizeActionUnion,
}

@summary("LiveTranscribe object")
model LiveTranscribe {
  @summary("live_transcribe")
  @doc("Starts live transcription of the call. The transcription will be sent to the specified URL.")
  live_transcribe: {
    @doc("The action to perform during live transcription.")
    action: TranscribeAction;
  };
}
