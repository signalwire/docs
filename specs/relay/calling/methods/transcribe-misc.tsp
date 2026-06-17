import "@signalwire/typespec-asyncapi";
import "../common.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

// ─────────────────────────────────────────────────────────────────────────────
// calling.transcribe
// ─────────────────────────────────────────────────────────────────────────────

model TranscribeParams {
  ...CallAddress;

  /** Identifier used to control (e.g. stop) the active transcription. */
  control_id: string;

  /** http or https URL to deliver transcription status event callbacks to. */
  status_url?: url;
}

model TranscribeResult {
  ...RelayResult;

  /** Path/URL of the shadow recording created for the transcription (e.g. `recordings/<UUID>.wav`). */
  url?: string;
}

/**
 * (async-safe) Start transcribing a call. Creates a shadow recording with
 * transcription enabled. Only one active transcription per call at a time —
 * starting a second while one is active returns `"409"` "Transcribe is already
 * in progress".
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
op transcribe(...TranscribeParams): TranscribeResult;

// ─────────────────────────────────────────────────────────────────────────────
// calling.transcribe.stop
// ─────────────────────────────────────────────────────────────────────────────

model TranscribeStopParams {
  ...CallAddress;

  /** The `control_id` assigned in `calling.transcribe`. */
  control_id: string;
}

model TranscribeStopResult {
  ...RelayResult;
}

/** (async-safe) Stop an active call transcription. */
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

  /** Echo duration in seconds (`0` = until the call ends). */
  @minValue(0)
  timeout?: int32;

  /** http or https URL to deliver echo status event callbacks to. */
  status_url?: url;
}

model EchoResult {
  ...RelayResult;
}

/**
 * Echo audio back to the caller (useful for testing). Echo ends when the
 * timeout expires or the call ends. (No documented stop method — self-terminates.)
 */
@rpcMethod("calling.echo")
@summary("Echo audio back to the caller")
@opExample(#{
  parameters: #{ node_id: "a3e1b2c4-...", call_id: "c7f9d2e1-...", timeout: 30 },
  returnType: #{ code: "200", message: "Echo started" },
})
op echo(...EchoParams): EchoResult;

// ─────────────────────────────────────────────────────────────────────────────
// calling.bind_digit
// ─────────────────────────────────────────────────────────────────────────────

model BindDigitParams {
  ...CallAddress;

  /** DTMF digit sequence to bind (e.g. `"*1"`). */
  digits: string;

  /** Method name to invoke when the digits are pressed (e.g. `calling.play`). */
  bind_method: string;

  /**
   * Parameters to pass to the bound method. Free-form: the shape matches the
   * params model of `bind_method` (polymorphic by `bind_method`, no own
   * discriminator). Modeled loosely.
   */
  params?: Record<unknown>;

  /** Namespace for this binding (used for selective clearing). */
  realm?: string;

  /** Maximum times this binding can fire (`0` = unlimited). */
  @minValue(0)
  max_triggers?: int32;
}

model BindDigitResult {
  ...RelayResult;
}

/** Bind a DTMF digit sequence to trigger a RELAY method. */
@rpcMethod("calling.bind_digit")
@summary("Bind a DTMF digit sequence to a RELAY method")
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

  /** Only clear bindings in this realm. Clears all bindings when omitted. */
  realm?: string;
}

model ClearDigitBindingsResult {
  ...RelayResult;
}

/** Clear all digit bindings, optionally filtered by realm. */
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

/** Speech-recognition engine for live transcribe/translate. */
union LiveSpeechEngine {
  "deepgram",
  "google",
}

/** Direction of the audio leg to transcribe. */
union TranscribeDirection {
  "local-caller",
  "remote-caller",
}

/** Direction of the audio leg to translate. */
union TranslateDirection {
  "local-caller",
  "remote-caller",
}

/**
 * Preset translation tone/style filters. A custom filter may instead be supplied
 * as a free-form string prefixed with `prompt:` — e.g. `prompt:Use formal business language`.
 */
union TranslationFilterPreset {
  "polite",
  "rude",
  "professional",
  "shakespeare",
  "gen-z",
}

/** An action body that carries no fields (its contents are ignored). */
model LiveActionStop {}

/** Begin live transcription. `lang` and `direction` are required. */
model LiveTranscribeStart {
  /** Language to transcribe (e.g. `en-US`). */
  lang: string;

  /** Which call leg(s) to transcribe. */
  direction: TranscribeDirection[];

  /** http or https URL the transcription is delivered to. */
  webhook?: url;

  /** Enable AI summarization; the summary is delivered at the end of the call. */
  ai_summary?: boolean;

  /** Prompt instructing how to summarize when `ai_summary` is enabled. */
  ai_summary_prompt?: string;

  /** Emit live transcription events as they occur. */
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

/** Begin live translation. `from_lang`, `to_lang` and `direction` are required. */
model LiveTranslateStart {
  /** Language to translate from (e.g. `en-US`). */
  from_lang: string;

  /** Language to translate to (e.g. `es-ES`). */
  to_lang: string;

  /** Which call leg(s) to translate. */
  direction: TranslateDirection[];

  /** http or https URL the translation is delivered to. */
  webhook?: url;

  /** TTS voice for the source language. */
  from_voice?: string;

  /** TTS voice for the target language. */
  to_voice?: string;

  /**
   * Tone/style filter for the source-language direction — a preset or a
   * `prompt:`-prefixed custom instruction.
   */
  filter_from?: TranslationFilterPreset | string;

  /**
   * Tone/style filter for the target-language direction — a preset or a
   * `prompt:`-prefixed custom instruction.
   */
  filter_to?: TranslationFilterPreset | string;

  /** Emit live translation events as they occur. */
  live_events?: boolean;

  /** Enable AI summarization; the summary is delivered at the end of the call. */
  ai_summary?: boolean;

  /** Prompt instructing how to summarize when `ai_summary` is enabled. */
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

/** Summarize the live transcription/translation. */
model LiveSummarize {
  /** http or https URL the summary is delivered to. */
  webhook?: url;

  /** Prompt instructing how to summarize the conversation. */
  prompt?: string;
}

/** Inject a message into the live translation to be translated and spoken. */
model LiveTranslateInject {
  /** The message to inject. */
  message: string;

  /** Which call leg to speak the injected message to (single direction). */
  direction: TranslateDirection;
}

// ─────────────────────────────────────────────────────────────────────────────
// calling.live_transcribe
// ─────────────────────────────────────────────────────────────────────────────

/**
 * Live-transcribe action. Key-discriminated: provide exactly one of `start`,
 * `stop`, or `summarize`.
 */
model LiveTranscribeAction {
  /** Begin live transcription. */
  start?: LiveTranscribeStart;

  /** Stop live transcription (body ignored). */
  stop?: LiveActionStop;

  /** Summarize the live transcription. */
  summarize?: LiveSummarize;
}

model LiveTranscribeParams {
  ...CallAddress;

  /** Action to perform (provide exactly one of `start`/`stop`/`summarize`). */
  action: LiveTranscribeAction;
}

model LiveTranscribeResult {
  ...RelayResult;
}

/** Start or stop live transcription on a call. */
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
op liveTranscribe(...LiveTranscribeParams): LiveTranscribeResult;

// ─────────────────────────────────────────────────────────────────────────────
// calling.live_translate
//
// Superset of live_transcribe's action: adds `inject`. Same key-discriminated
// modeling.
// ─────────────────────────────────────────────────────────────────────────────

/**
 * Live-translate action. Key-discriminated: provide exactly one of `start`,
 * `stop`, `summarize`, or `inject`.
 */
model LiveTranslateAction {
  /** Begin live translation. */
  start?: LiveTranslateStart;

  /** Stop live translation (body ignored). */
  stop?: LiveActionStop;

  /** Summarize the live translation. */
  summarize?: LiveSummarize;

  /** Inject a message into the live translation. */
  inject?: LiveTranslateInject;
}

model LiveTranslateParams {
  ...CallAddress;

  /** Action to perform (provide exactly one of `start`/`stop`/`summarize`/`inject`). */
  action: LiveTranslateAction;

  /** http or https URL to deliver translation status event callbacks to. */
  status_url?: url;
}

model LiveTranslateResult {
  ...RelayResult;
}

/** Start or stop live translation on a call. */
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

  /** Room name to join. */
  name: string;

  /** http or https URL to deliver room status event callbacks to. */
  status_url?: url;
}

model JoinRoomResult {
  ...RelayResult;
}

/** Join a video/audio room by name. */
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

/** Leave the current room (operates on the call's current room; no room param). */
@rpcMethod("calling.leave_room")
@summary("Leave the current room")
@opExample(#{
  parameters: #{ node_id: "a3e1b2c4-...", call_id: "c7f9d2e1-..." },
  returnType: #{ code: "200", message: "Leaving room" },
})
op leaveRoom(...LeaveRoomParams): LeaveRoomResult;
