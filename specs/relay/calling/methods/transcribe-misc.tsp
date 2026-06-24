import "@signalwire/typespec-asyncapi";
import "../common.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

// ─────────────────────────────────────────────────────────────────────────────
// calling.transcribe
// ─────────────────────────────────────────────────────────────────────────────

model TranscribeParams {
  ...CallAddress;

  /** Your identifier for this transcription. Use the same `control_id` with `calling.transcribe.stop` to stop it. */
  control_id: string;

  /** An `http` or `https` URL to receive transcription status updates as the transcription starts, runs, and ends. */
  status_url?: url;
}

model TranscribeResult {
  ...RelayResult;

  /** Path of the audio recording captured for this transcription, e.g. `recordings/<UUID>.wav`. */
  url?: string;
}

/**
 * Starts transcribing speech on a call to text. SignalWire records the call audio
 * and transcribes it in the background. Transcription results are not returned
 * here — they arrive as `calling.call.transcribe` events keyed on your `control_id`.
 * Only one transcription can run on a call at a time; starting another while one
 * is active returns `"409"` "Transcribe is already in progress". Stop it with
 * `calling.transcribe.stop`.
 */
@rpcMethod("calling.transcribe")
@summary("Start transcribing a call")
@opExample(#{
  parameters: #{
    node_id: "a3e1b2c4-...",
    call_id: "c7f9d2e1-...",
    control_id: "transcribe-1",
    status_url: "https://example.com/transcribe-callback",
  },
  returnType: #{ code: "200", message: "Transcribing", url: "recordings/<UUID>.wav" },
})
op transcribe(...TranscribeParams): TranscribeResult | CallTranscribeEvent;

// ─────────────────────────────────────────────────────────────────────────────
// calling.transcribe.stop
// ─────────────────────────────────────────────────────────────────────────────

model TranscribeStopParams {
  ...CallAddress;

  /** The `control_id` you passed to `calling.transcribe` when you started this transcription. */
  control_id: string;
}

model TranscribeStopResult {
  ...RelayResult;
}

/** Stops a transcription that is currently running on a call. */
@rpcMethod("calling.transcribe.stop")
@summary("Stop an active call transcription")
@opExample(#{
  parameters: #{ node_id: "a3e1b2c4-...", call_id: "c7f9d2e1-...", control_id: "transcribe-1" },
  returnType: #{ code: "200", message: "Stopping transcribe" },
})
op transcribeStop(...TranscribeStopParams): TranscribeStopResult;

// ─────────────────────────────────────────────────────────────────────────────
// calling.echo
// ─────────────────────────────────────────────────────────────────────────────

model EchoParams {
  ...CallAddress;

  /** How long to keep echoing, in seconds. Use `0` to echo until the call ends. */
  @minValue(0)
  timeout?: int32;

  /** An `http` or `https` URL to receive echo status updates. */
  status_url?: url;
}

model EchoResult {
  ...RelayResult;
}

/**
 * Echoes the caller's audio back to them — whatever they say is played straight
 * back. Handy for testing that audio is flowing in both directions on a call.
 * Echo stops on its own when the `timeout` expires or the call ends.
 */
@rpcMethod("calling.echo")
@summary("Echo audio back to the caller")
@opExample(#{
  parameters: #{ node_id: "a3e1b2c4-...", call_id: "c7f9d2e1-...", timeout: 30 },
  returnType: #{ code: "200", message: "Echo started" },
})
op echo(...EchoParams): EchoResult | CallEchoEvent;

// ─────────────────────────────────────────────────────────────────────────────
// calling.bind_digit
// ─────────────────────────────────────────────────────────────────────────────

model BindDigitParams {
  ...CallAddress;

  /** The DTMF digit sequence the caller must press to trigger this binding, e.g. `"*1"`. */
  digits: string;

  /** The call method to run when the digits are pressed, e.g. `calling.play`. */
  bind_method: string;

  /** Parameters to pass to `bind_method` when it runs. Use the same shape that method expects for its parameters. */
  params?: Record<unknown>;

  /** A label that groups this binding with others, so you can clear them together later. */
  realm?: string;

  /** How many times this binding can fire before it stops working. Use `0` for no limit. */
  @minValue(0)
  max_triggers?: int32;
}

model BindDigitResult {
  ...RelayResult;
}

/** Runs a call method automatically when the caller presses a specific DTMF digit sequence — for example, play a message when they press `*1`. */
@rpcMethod("calling.bind_digit")
@summary("Trigger a call method when a DTMF sequence is pressed")
@opExample(#{
  parameters: #{
    node_id: "a3e1b2c4-...",
    call_id: "c7f9d2e1-...",
    digits: "*1",
    bind_method: "calling.play",
    params: #{ play: #[#{ type: "tts", text: "You pressed star one" }] },
    realm: "menu",
    max_triggers: 0,
  },
  returnType: #{ code: "200", message: "Digit binding created" },
})
op bindDigit(...BindDigitParams): BindDigitResult;

// ─────────────────────────────────────────────────────────────────────────────
// calling.clear_digit_bindings
// ─────────────────────────────────────────────────────────────────────────────

model ClearDigitBindingsParams {
  ...CallAddress;

  /** Clear only the bindings with this `realm` label. Omit to clear every digit binding on the call. */
  realm?: string;
}

model ClearDigitBindingsResult {
  ...RelayResult;
}

/** Removes digit bindings previously set with `calling.bind_digit`. Clears every binding on the call, or only those in a given `realm`. */
@rpcMethod("calling.clear_digit_bindings")
@summary("Clear digit bindings")
@opExample(#{
  parameters: #{ node_id: "a3e1b2c4-...", call_id: "c7f9d2e1-...", realm: "menu" },
  returnType: #{ code: "200", message: "Digit bindings cleared" },
})
op clearDigitBindings(...ClearDigitBindingsParams): ClearDigitBindingsResult;

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

/** The speech-recognition engine used to convert speech to text for live transcribe and translate. */
union LiveSpeechEngine {
  "deepgram",
  "google",
}

/** Which side of the call to transcribe: `local-caller` (your side) or `remote-caller` (the other party). */
union TranscribeDirection {
  "local-caller",
  "remote-caller",
}

/** Which side of the call to translate: `local-caller` (your side) or `remote-caller` (the other party). */
union TranslateDirection {
  "local-caller",
  "remote-caller",
}

/**
 * Built-in tone/style presets for translation. To use your own style instead,
 * pass a string prefixed with `prompt:`, e.g. `prompt:Use formal business language`.
 */
union TranslationFilterPreset {
  "polite",
  "rude",
  "professional",
  "shakespeare",
  "gen-z",
}

/** A stop action takes no fields — pass an empty object. */
model LiveActionStop {}

/** Settings for starting live transcription. `lang` and `direction` are required. */
model LiveTranscribeStart {
  /** The language to transcribe, e.g. `en-US`. */
  lang: string;

  /** Which side(s) of the call to transcribe. */
  direction: TranscribeDirection[];

  /** An `http` or `https` URL to receive the transcription as it is produced. */
  webhook?: url;

  /** Generate an AI summary of the conversation. The summary is delivered when the call ends. */
  ai_summary?: boolean;

  /** Instructions telling the AI how to summarize, used when `ai_summary` is enabled. */
  ai_summary_prompt?: string;

  /** Deliver transcription results live as the conversation happens, rather than only at the end. */
  live_events?: boolean;

  /** Speech-recognition timeout in milliseconds. Default `60000`. */
  @minValue(0)
  speech_timeout?: int32 = 60000;

  /**
   * Voice-activity-detection silence time in milliseconds. The default is
   * engine-dependent (Deepgram vs Google) and is not fixed by this method.
   */
  @minValue(0)
  vad_silence_ms?: int32;

  /** Voice-activity-detection threshold (0-1800). Default `400`. */
  @minValue(0)
  vad_thresh?: int32 = 400;

  /** Debug log level (0-2). Default `0`. */
  @minValue(0)
  debug_level?: int32 = 0;

  /** Speech engine to use. Default `deepgram`. */
  speech_engine?: LiveSpeechEngine = "deepgram";
}

/** Settings for starting live translation. `from_lang`, `to_lang` and `direction` are required. */
model LiveTranslateStart {
  /** The language being spoken, e.g. `en-US`. */
  from_lang: string;

  /** The language to translate into, e.g. `es-ES`. */
  to_lang: string;

  /** Which side(s) of the call to translate. */
  direction: TranslateDirection[];

  /** An `http` or `https` URL to receive the translation as it is produced. */
  webhook?: url;

  /** The voice used to speak the source language. */
  from_voice?: string;

  /** The voice used to speak the translated language. */
  to_voice?: string;

  /**
   * Adjusts the tone or style applied when translating the source speaker — a
   * preset, or a `prompt:`-prefixed custom instruction.
   */
  filter_from?: TranslationFilterPreset | string;

  /**
   * Adjusts the tone or style applied when translating toward the target speaker
   * — a preset, or a `prompt:`-prefixed custom instruction.
   */
  filter_to?: TranslationFilterPreset | string;

  /** Deliver translation results live as the conversation happens, rather than only at the end. */
  live_events?: boolean;

  /** Generate an AI summary of the conversation. The summary is delivered when the call ends. */
  ai_summary?: boolean;

  /** Instructions telling the AI how to summarize, used when `ai_summary` is enabled. */
  ai_summary_prompt?: string;

  /** Speech-recognition timeout in milliseconds. Default `60000`. */
  @minValue(0)
  speech_timeout?: int32 = 60000;

  /**
   * Voice-activity-detection silence time in milliseconds. The default is
   * engine-dependent (Deepgram vs Google) and is not fixed by this method.
   */
  @minValue(0)
  vad_silence_ms?: int32;

  /** Voice-activity-detection threshold (0-1800). Default `400`. */
  @minValue(0)
  vad_thresh?: int32 = 400;

  /** Debug log level (0-2). Default `0`. */
  @minValue(0)
  debug_level?: int32 = 0;

  /** Speech engine to use. Default `deepgram`. */
  speech_engine?: LiveSpeechEngine = "deepgram";
}

/** Settings for generating a summary of the live transcription or translation so far. */
model LiveSummarize {
  /** An `http` or `https` URL to receive the summary. */
  webhook?: url;

  /** Instructions telling the AI how to summarize the conversation. */
  prompt?: string;
}

/** A message to insert into a live translation. It is translated and spoken into the call. */
model LiveTranslateInject {
  /** The text to translate and speak into the call. */
  message: string;

  /** Which side of the call to speak the message to. */
  direction: TranslateDirection;
}

// ─────────────────────────────────────────────────────────────────────────────
// calling.live_transcribe
// ─────────────────────────────────────────────────────────────────────────────

/**
 * The live-transcribe action to perform. Set exactly one of `start`, `stop`, or
 * `summarize`.
 */
model LiveTranscribeAction {
  /** Start live transcription. */
  start?: LiveTranscribeStart;

  /** Stop live transcription. */
  stop?: LiveActionStop;

  /** Summarize the live transcription so far. */
  summarize?: LiveSummarize;
}

model LiveTranscribeParams {
  ...CallAddress;

  /** The action to perform. Set exactly one of `start`, `stop`, or `summarize`. */
  action: LiveTranscribeAction;
}

model LiveTranscribeResult {
  ...RelayResult;
}

/**
 * Transcribes a call to text in real time, optionally on both legs at once. Unlike
 * `calling.transcribe`, results stream live to your `webhook` while the call is
 * still in progress, and you can request an AI summary at the end. Use the same
 * method to start, stop, or summarize by setting the matching `action`. Live
 * results also arrive as `calling.call.transcribe` events.
 */
@rpcMethod("calling.live_transcribe")
@summary("Start or stop live transcription on a call")
@opExample(#{
  parameters: #{
    node_id: "a3e1b2c4-...",
    call_id: "c7f9d2e1-...",
    action: #{ start: #{ lang: "en-US", direction: #["remote-caller"] } },
  },
  returnType: #{ code: "200", message: "Live transcription started" },
})
op liveTranscribe(...LiveTranscribeParams): LiveTranscribeResult | CallTranscribeEvent;

// ─────────────────────────────────────────────────────────────────────────────
// calling.live_translate
//
// Superset of live_transcribe's action: adds `inject`. Same key-discriminated
// modeling.
// ─────────────────────────────────────────────────────────────────────────────

/**
 * The live-translate action to perform. Set exactly one of `start`, `stop`,
 * `summarize`, or `inject`.
 */
model LiveTranslateAction {
  /** Start live translation. */
  start?: LiveTranslateStart;

  /** Stop live translation. */
  stop?: LiveActionStop;

  /** Summarize the live translation so far. */
  summarize?: LiveSummarize;

  /** Insert a message to be translated and spoken into the call. */
  inject?: LiveTranslateInject;
}

model LiveTranslateParams {
  ...CallAddress;

  /** The action to perform. Set exactly one of `start`, `stop`, `summarize`, or `inject`. */
  action: LiveTranslateAction;

  /** An `http` or `https` URL to receive translation status updates. */
  status_url?: url;
}

model LiveTranslateResult {
  ...RelayResult;
}

/**
 * Translates speech on a call into another language in real time and speaks it back,
 * so two parties can talk across a language barrier. Translation streams live to your
 * `webhook` and is voiced into the call. Use the same method to start, stop, summarize,
 * or inject a message by setting the matching `action`.
 */
@rpcMethod("calling.live_translate")
@summary("Start or stop live translation on a call")
@opExample(#{
  parameters: #{
    node_id: "a3e1b2c4-...",
    call_id: "c7f9d2e1-...",
    action: #{ start: #{ from_lang: "en-US", to_lang: "es-ES", direction: #["remote-caller"] } },
    status_url: "https://example.com/translate-callback",
  },
  returnType: #{ code: "200", message: "Live translation started" },
})
op liveTranslate(...LiveTranslateParams): LiveTranslateResult;

// ─────────────────────────────────────────────────────────────────────────────
// calling.join_room
// ─────────────────────────────────────────────────────────────────────────────

model JoinRoomParams {
  ...CallAddress;

  /** The name of the room to join. */
  name: string;

  /** An `http` or `https` URL to receive room status updates, such as when the call joins or leaves. */
  status_url?: url;
}

model JoinRoomResult {
  ...RelayResult;
}

/** Connects this call into a named audio/video room, bridging it with everyone else already in that room. */
@rpcMethod("calling.join_room")
@summary("Join a video/audio room")
@opExample(#{
  parameters: #{ node_id: "a3e1b2c4-...", call_id: "c7f9d2e1-...", name: "my_room" },
  returnType: #{ code: "200", message: "Joining room" },
})
op joinRoom(...JoinRoomParams): JoinRoomResult;

// ─────────────────────────────────────────────────────────────────────────────
// calling.leave_room
// ─────────────────────────────────────────────────────────────────────────────

model LeaveRoomParams {
  ...CallAddress;
}

model LeaveRoomResult {
  ...RelayResult;
}

/** Removes this call from the room it is currently in. There is no room parameter — it always acts on the call's current room. */
@rpcMethod("calling.leave_room")
@summary("Leave the current room")
@opExample(#{
  parameters: #{ node_id: "a3e1b2c4-...", call_id: "c7f9d2e1-..." },
  returnType: #{ code: "200", message: "Leaving room" },
})
op leaveRoom(...LeaveRoomParams): LeaveRoomResult;
