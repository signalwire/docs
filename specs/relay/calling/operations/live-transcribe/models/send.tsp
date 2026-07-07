import "@signalwire/typespec-asyncapi";

import "../../../models/core.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

@doc("The speech-recognition engine used to convert speech to text for live transcribe and translate.")
union LiveSpeechEngine {
  "deepgram",
  "google",
}

@doc("Which side of the call to transcribe: `local-caller` (your side) or `remote-caller` (the other party).")
union TranscribeDirection {
  "local-caller",
  "remote-caller",
}

@doc("Which side of the call to translate: `local-caller` (your side) or `remote-caller` (the other party).")
union TranslateDirection {
  "local-caller",
  "remote-caller",
}

@doc("""
  Translation mode. `classic` (default) translates in discrete turns; `realtime`
  translates continuously as the speaker talks. In `realtime` mode several
  `classic`-only parameters are ignored.
  """)
union LiveTranslateMode {
  "classic",
  "realtime",
}

@doc("""
  Built-in tone/style presets for translation. To use your own style instead,
  pass a string prefixed with `prompt:`, e.g. `prompt:Use formal business language`.
  """)
union TranslationFilterPreset {
  "polite",
  "rude",
  "professional",
  "shakespeare",
  "gen-z",
}

@summary("Stop action")
@doc("A stop action takes no fields — pass an empty object.")
model LiveActionStop {}

@summary("Live transcribe start settings")
@doc("Settings for starting live transcription. `lang` and `direction` are required.")
model LiveTranscribeStart {
  @doc("The language to transcribe, e.g. `en-US`.")
  @example("en-US")
  lang: string;

  @doc("Which side(s) of the call to transcribe.")
  @example(#["remote-caller"])
  direction: TranscribeDirection[];

  @doc("An `http` or `https` URL to receive the transcription as it is produced.")
  @example("https://example.com/webhooks/relay")
  webhook?: url;

  @doc("Generate an AI summary of the conversation. The summary is delivered when the call ends.")
  @example(true)
  ai_summary?: boolean;

  @doc("Instructions telling the AI how to summarize, used when `ai_summary` is enabled.")
  @example("Summarize the key points and any action items discussed on this call.")
  ai_summary_prompt?: string;

  @doc("Deliver transcription results live as the conversation happens, rather than only at the end.")
  @example(true)
  live_events?: boolean;

  @doc("Speech-recognition timeout in milliseconds. Default `60000`.")
  @minValue(0)
  @example(60000)
  speech_timeout?: int32 = 60000;

  @doc("""
    Voice-activity-detection silence time in milliseconds. The default is
    engine-dependent (Deepgram vs Google) and is not fixed by this method.
    """)
  @minValue(0)
  @example(500)
  vad_silence_ms?: int32;

  @doc("Voice-activity-detection threshold (0-1800). Default `400`.")
  @minValue(0)
  @example(400)
  vad_thresh?: int32 = 400;

  @doc("Debug log level (0-2). Default `0`.")
  @minValue(0)
  @example(0)
  debug_level?: int32 = 0;

  @doc("Speech engine to use. Default `deepgram`.")
  @example("deepgram")
  speech_engine?: LiveSpeechEngine = "deepgram";

  @doc("Words or phrases to bias speech recognition toward, improving accuracy for names, jargon, or uncommon terms.")
  @example(#["SignalWire", "Relay", "webhook"])
  hints?: string[];

  @doc("Emit verbose, word-level utterance detail in the transcription results rather than only finalized segments.")
  @example(false)
  verbose_utterances?: boolean;
}

@summary("Live translate start settings")
@doc("Settings for starting live translation. `from_lang`, `to_lang` and `direction` are required.")
model LiveTranslateStart {
  @doc("The language being spoken, e.g. `en-US`.")
  @example("en-US")
  from_lang: string;

  @doc("The language to translate into, e.g. `es-ES`.")
  @example("es-ES")
  to_lang: string;

  @doc("Which side(s) of the call to translate.")
  @example(#["remote-caller"])
  direction: TranslateDirection[];

  @doc("An `http` or `https` URL to receive the translation as it is produced.")
  @example("https://example.com/webhooks/relay")
  webhook?: url;

  @doc("The voice used to speak the source language.")
  @example("en-US-Neural2-A")
  from_voice?: string;

  @doc("The voice used to speak the translated language.")
  @example("es-ES-Neural2-A")
  to_voice?: string;

  @doc("""
    Adjusts the tone or style applied when translating the source speaker — a
    preset, or a `prompt:`-prefixed custom instruction.
    """)
  @example("professional")
  filter_from?: TranslationFilterPreset | string;

  @doc("""
    Adjusts the tone or style applied when translating toward the target speaker
    — a preset, or a `prompt:`-prefixed custom instruction.
    """)
  @example("polite")
  filter_to?: TranslationFilterPreset | string;

  @doc("Deliver translation results live as the conversation happens, rather than only at the end.")
  @example(true)
  live_events?: boolean;

  @doc("Generate an AI summary of the conversation. The summary is delivered when the call ends.")
  @example(true)
  ai_summary?: boolean;

  @doc("Instructions telling the AI how to summarize, used when `ai_summary` is enabled.")
  @example("Summarize the key points and any action items discussed on this call.")
  ai_summary_prompt?: string;

  @doc("Speech-recognition timeout in milliseconds. Default `60000`.")
  @minValue(0)
  @example(60000)
  speech_timeout?: int32 = 60000;

  @doc("""
    Voice-activity-detection silence time in milliseconds. The default is
    engine-dependent (Deepgram vs Google) and is not fixed by this method.
    """)
  @minValue(0)
  @example(500)
  vad_silence_ms?: int32;

  @doc("Voice-activity-detection threshold (0-1800). Default `400`.")
  @minValue(0)
  @example(400)
  vad_thresh?: int32 = 400;

  @doc("Debug log level (0-2). Default `0`.")
  @minValue(0)
  @example(0)
  debug_level?: int32 = 0;

  @doc("Speech engine to use. Default `deepgram`.")
  @example("deepgram")
  speech_engine?: LiveSpeechEngine = "deepgram";

  @doc("""
    Translation mode. `classic` (default) translates in discrete turns;
    `realtime` translates continuously. In `realtime` mode several `classic`-only
    parameters are ignored.
    """)
  @example("classic")
  mode?: LiveTranslateMode = "classic";
}

@summary("Summarize settings")
@doc("Settings for generating a summary of the live transcription or translation so far.")
model LiveSummarize {
  @doc("An `http` or `https` URL to receive the summary.")
  @example("https://example.com/webhooks/relay")
  webhook?: url;

  @doc("Instructions telling the AI how to summarize the conversation.")
  @example("Summarize the key points and any action items discussed on this call.")
  prompt?: string;
}

@summary("Translate inject message")
@doc("A message to insert into a live translation. It is translated and spoken into the call.")
model LiveTranslateInject {
  @doc("The text to translate and speak into the call.")
  @example("Please hold while I transfer your call.")
  message: string;

  @doc("Which side of the call to speak the message to.")
  @example("remote-caller")
  direction: TranslateDirection;
}

@doc("""
  The live-transcribe action to perform. Set exactly one of `start`, `stop`, or
  `summarize`.
  """)
@summary("Live transcribe action")
model LiveTranscribeAction {
  @doc("Start live transcription.")
  start?: LiveTranscribeStart;

  @doc("Stop live transcription.")
  stop?: LiveActionStop;

  @doc("Summarize the live transcription so far.")
  summarize?: LiveSummarize;
}

@summary("Live transcribe params")
model LiveTranscribeParams {
  ...CallAddress;

  @doc("""
    The action to perform. Pass the object form and set exactly one of `start`,
    `stop`, or `summarize`. As a shorthand you may instead pass the bare string
    `"stop"` or `"summarize"` (the object form is required to `start`).
    """)
  action: LiveTranscribeAction | "stop" | "summarize";
}
