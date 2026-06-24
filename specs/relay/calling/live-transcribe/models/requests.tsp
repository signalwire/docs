import "@signalwire/typespec-asyncapi";

import "../../models/core.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

// ─────────────────────────────────────────────────────────────────────────────
// calling.live_transcribe / calling.live_translate — shared sub-shapes
//
// `action` is a KEY-DISCRIMINATED union: exactly one of `start`/`stop`/
// `summarize` (+ `inject` for translate) is present, keyed by the action name
// (not a `type` field). The inner field shapes below are verified against the
// FreeSWITCH engine: the Relay JSON-RPC wire serializes `params` verbatim into
// the same C parser the SWML methods use, so the accepted inner fields are the
// SWML field set (minus SWML templating).
// ─────────────────────────────────────────────────────────────────────────────

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

@doc("A stop action takes no fields — pass an empty object.")
model LiveActionStop {}

@doc("Settings for starting live transcription. `lang` and `direction` are required.")
model LiveTranscribeStart {
  @doc("The language to transcribe, e.g. `en-US`.")
  lang: string;

  @doc("Which side(s) of the call to transcribe.")
  direction: TranscribeDirection[];

  @doc("An `http` or `https` URL to receive the transcription as it is produced.")
  webhook?: url;

  @doc("Generate an AI summary of the conversation. The summary is delivered when the call ends.")
  ai_summary?: boolean;

  @doc("Instructions telling the AI how to summarize, used when `ai_summary` is enabled.")
  ai_summary_prompt?: string;

  @doc("Deliver transcription results live as the conversation happens, rather than only at the end.")
  live_events?: boolean;

  @doc("Speech-recognition timeout in milliseconds. Default `60000`.")
  @minValue(0)
  speech_timeout?: int32 = 60000;

  @doc("""
    Voice-activity-detection silence time in milliseconds. The default is
    engine-dependent (Deepgram vs Google) and is not fixed by this method.
    """)
  @minValue(0)
  vad_silence_ms?: int32;

  @doc("Voice-activity-detection threshold (0-1800). Default `400`.")
  @minValue(0)
  vad_thresh?: int32 = 400;

  @doc("Debug log level (0-2). Default `0`.")
  @minValue(0)
  debug_level?: int32 = 0;

  @doc("Speech engine to use. Default `deepgram`.")
  speech_engine?: LiveSpeechEngine = "deepgram";
}

@doc("Settings for starting live translation. `from_lang`, `to_lang` and `direction` are required.")
model LiveTranslateStart {
  @doc("The language being spoken, e.g. `en-US`.")
  from_lang: string;

  @doc("The language to translate into, e.g. `es-ES`.")
  to_lang: string;

  @doc("Which side(s) of the call to translate.")
  direction: TranslateDirection[];

  @doc("An `http` or `https` URL to receive the translation as it is produced.")
  webhook?: url;

  @doc("The voice used to speak the source language.")
  from_voice?: string;

  @doc("The voice used to speak the translated language.")
  to_voice?: string;

  @doc("""
    Adjusts the tone or style applied when translating the source speaker — a
    preset, or a `prompt:`-prefixed custom instruction.
    """)
  filter_from?: TranslationFilterPreset | string;

  @doc("""
    Adjusts the tone or style applied when translating toward the target speaker
    — a preset, or a `prompt:`-prefixed custom instruction.
    """)
  filter_to?: TranslationFilterPreset | string;

  @doc("Deliver translation results live as the conversation happens, rather than only at the end.")
  live_events?: boolean;

  @doc("Generate an AI summary of the conversation. The summary is delivered when the call ends.")
  ai_summary?: boolean;

  @doc("Instructions telling the AI how to summarize, used when `ai_summary` is enabled.")
  ai_summary_prompt?: string;

  @doc("Speech-recognition timeout in milliseconds. Default `60000`.")
  @minValue(0)
  speech_timeout?: int32 = 60000;

  @doc("""
    Voice-activity-detection silence time in milliseconds. The default is
    engine-dependent (Deepgram vs Google) and is not fixed by this method.
    """)
  @minValue(0)
  vad_silence_ms?: int32;

  @doc("Voice-activity-detection threshold (0-1800). Default `400`.")
  @minValue(0)
  vad_thresh?: int32 = 400;

  @doc("Debug log level (0-2). Default `0`.")
  @minValue(0)
  debug_level?: int32 = 0;

  @doc("Speech engine to use. Default `deepgram`.")
  speech_engine?: LiveSpeechEngine = "deepgram";
}

@doc("Settings for generating a summary of the live transcription or translation so far.")
model LiveSummarize {
  @doc("An `http` or `https` URL to receive the summary.")
  webhook?: url;

  @doc("Instructions telling the AI how to summarize the conversation.")
  prompt?: string;
}

@doc("A message to insert into a live translation. It is translated and spoken into the call.")
model LiveTranslateInject {
  @doc("The text to translate and speak into the call.")
  message: string;

  @doc("Which side of the call to speak the message to.")
  direction: TranslateDirection;
}

@doc("""
  The live-transcribe action to perform. Set exactly one of `start`, `stop`, or
  `summarize`.
  """)
model LiveTranscribeAction {
  @doc("Start live transcription.")
  start?: LiveTranscribeStart;

  @doc("Stop live transcription.")
  stop?: LiveActionStop;

  @doc("Summarize the live transcription so far.")
  summarize?: LiveSummarize;
}

model LiveTranscribeParams {
  ...CallAddress;

  @doc("The action to perform. Set exactly one of `start`, `stop`, or `summarize`.")
  action: LiveTranscribeAction;
}
