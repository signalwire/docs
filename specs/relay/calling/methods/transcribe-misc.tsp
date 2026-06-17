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
// calling.live_transcribe
//
// `action` is a KEY-DISCRIMINATED union: exactly one of `start`/`stop`/
// `summarize` is present, keyed by the action name (not a `type` field). The
// source shows each variant only as `{}`, so the inner sub-params are
// loose-modeled as Record<unknown>. See openQuestions.
// ─────────────────────────────────────────────────────────────────────────────

/**
 * Live-transcribe action. Key-discriminated: provide exactly one of `start`,
 * `stop`, or `summarize`. Inner sub-params are undocumented in the protocol
 * reference (loose-modeled).
 */
model LiveTranscribeAction {
  /** Begin live transcription. Sub-params undocumented. */
  start?: Record<unknown>;

  /** Stop live transcription. Sub-params undocumented. */
  stop?: Record<unknown>;

  /** Summarize the live transcription. Sub-params undocumented. */
  summarize?: Record<unknown>;
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
  parameters: #{ node_id: "a3e1b2c4-...", call_id: "c7f9d2e1-...", action: #{ start: #{} } },
  returnType: #{ code: "200", message: "Live transcription started" },
})
op liveTranscribe(...LiveTranscribeParams): LiveTranscribeResult;

// ─────────────────────────────────────────────────────────────────────────────
// calling.live_translate
//
// Superset of live_transcribe's action: adds `inject`. Same key-discriminated
// modeling; inner sub-params loose-modeled. See openQuestions.
// ─────────────────────────────────────────────────────────────────────────────

/**
 * Live-translate action. Key-discriminated: provide exactly one of `start`,
 * `stop`, `summarize`, or `inject`. Inner sub-params are undocumented in the
 * protocol reference (loose-modeled).
 */
model LiveTranslateAction {
  /** Begin live translation. Sub-params undocumented. */
  start?: Record<unknown>;

  /** Stop live translation. Sub-params undocumented. */
  stop?: Record<unknown>;

  /** Summarize the live translation. Sub-params undocumented. */
  summarize?: Record<unknown>;

  /** Inject content into the live translation. Sub-params undocumented. */
  inject?: Record<unknown>;
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
    action: #{ start: #{} },
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
