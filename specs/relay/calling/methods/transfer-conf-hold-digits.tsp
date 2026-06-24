import "@signalwire/typespec-asyncapi";
import "../common.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

// ═════════════════════════════════════════════════════════════════════════════
// Shared enums for this family (conference status-callback knobs)
// ═════════════════════════════════════════════════════════════════════════════

/** Controls whether a beep plays as participants enter or leave the conference. Use `"true"` for both, `"onEnter"` or `"onExit"` to limit it to one direction, or `"false"` to disable. Note these are strings, not booleans. */
union ConferenceBeep {
  "true",
  "false",
  "onEnter",
  "onExit",
}

/** Whether the conference is recorded. Use `"record-from-start"` to begin recording as soon as the conference starts, or `"do-not-record"` to skip recording. */
union ConferenceRecord {
  "do-not-record",
  "record-from-start",
}

/** The geographic region where the conference media is hosted. Choose the region closest to your participants to reduce latency. */
union ConferenceRegion {
  "global",
  "us",
  "eu",
}

/** Whether leading and trailing silence is trimmed from the conference recording. */
union ConferenceTrim {
  "trim-silence",
  "do-not-trim",
}

/** The payload format for a conference status callback. Use `"relay"` for SignalWire's native event format or `"cxml"` for the cXML-compatible format. */
union ConferenceCallbackEventType {
  "relay",
  "cxml",
}

/** The HTTP method used to deliver a conference status callback to your URL. */
union ConferenceCallbackMethod {
  "GET",
  "POST",
}

// ─────────────────────────────────────────────────────────────────────────────
// calling.transfer
// ─────────────────────────────────────────────────────────────────────────────

model TransferParams {
  ...CallAddress;

  /**
   * Where to hand off the call. Pass one of three forms in this single string:
   * an `https://` URL that returns a SWML script, an inline SWML script, or the
   * name of another RELAY application prefixed with `context:`. The form is
   * detected from the prefix or scheme you use.
   */
  dest: string;
}

model TransferResult {
  ...RelayResult;

  /** The id of the call that was transferred, echoed back from your request. */
  call_id?: string;
}

/** Hands off control of an active call to another RELAY application or to a SWML script. Use this to move a call to a different flow, for example to route it to an IVR, queue, or a fresh script. Once transferred, the original application no longer controls the call. */
@rpcMethod("calling.transfer")
@summary("Transfer a call to a RELAY app or SWML script")
@opExample(#{
  parameters: #{
    node_id: "a3e1b2c4-...",
    call_id: "c7f9d2e1-...",
    dest: "https://example.com/swml",
  },
  returnType: #{ code: "200", message: "Transferring", call_id: "c7f9d2e1-..." },
})
op transfer(...TransferParams): TransferResult;

// ─────────────────────────────────────────────────────────────────────────────
// calling.join_conference
// ─────────────────────────────────────────────────────────────────────────────

model JoinConferenceParams {
  ...CallAddress;

  /** The name of the conference to join. If a conference with this name does not exist yet, it is created. */
  name: string;

  /** Join the conference with this participant muted. Defaults to `false`. */
  muted?: boolean = false;

  /** Whether a beep plays as participants enter or leave. Defaults to `true`. */
  beep?: ConferenceBeep;

  /** Whether the conference starts when this participant enters. Defaults to `true`. */
  start_on_enter?: boolean = true;

  /** Whether the conference ends for everyone when this participant leaves. Defaults to `false`. */
  end_on_exit?: boolean = false;

  /** A URL to cXML, or to an mp3/wav file, to play while this participant waits for the conference to start. Defaults to hold music. */
  wait_url?: url;

  /** The maximum number of participants allowed in the conference, up to 250. Defaults to `250`. */
  @minValueExclusive(0)
  @maxValue(250)
  max_participants?: int32;

  /** Whether and when to record the conference. Defaults to `do-not-record`. */
  record?: ConferenceRecord;

  /** The region where the conference media is hosted. Defaults to `global`. */
  region?: ConferenceRegion;

  /** Whether to trim silence from the recording. Defaults to `trim-silence`. */
  trim?: ConferenceTrim;

  /** The id of a call (SWML Call ID or cXML CallSid) that this participant coaches. A coach can be heard only by the call being coached, not by the rest of the conference. Not set by default. */
  coach?: string;

  /** A URL to receive conference status callbacks. Not set by default. */
  status_callback?: url;

  /**
   * A space-separated list of which conference events to deliver to
   * `status_callback`. Available events: `start`, `end`, `join`, `leave`,
   * `mute`, `hold`, `modify`, `speaker`, `announcement`. Not set by default.
   */
  status_callback_event?: string;

  /** The payload format for `status_callback`. Defaults to `relay`. */
  status_callback_event_type?: ConferenceCallbackEventType;

  /** The HTTP method used to deliver `status_callback`. Defaults to `POST`. Ignored when `status_callback_event_type` is `relay`. */
  status_callback_method?: ConferenceCallbackMethod;

  /** A URL to receive recording status callbacks. Not set by default. */
  recording_status_callback?: url;

  /**
   * A space-separated list of which recording lifecycle events to deliver to
   * `recording_status_callback`. Available events: `in-progress completed absent`
   * (for example, `"in-progress completed"`). Defaults to `completed`.
   */
  recording_status_callback_event?: string;

  /** The payload format for `recording_status_callback`. Defaults to `relay`. */
  recording_status_callback_event_type?: ConferenceCallbackEventType;

  /** The HTTP method used to deliver `recording_status_callback`. Defaults to `POST`. Ignored when `recording_status_callback_event_type` is `relay`. */
  recording_status_callback_method?: ConferenceCallbackMethod;

  /**
   * Attach a bidirectional WebSocket audio stream to the conference, for example to
   * feed audio to a bot or transcription service. Uses the same stream settings as
   * the stream device in `calling.connect`.
   */
  stream?: StreamDeviceParams;
}

model JoinConferenceResult {
  ...RelayResult;
}

/** Adds this call to an ad-hoc audio conference, creating the conference if it does not already exist. RELAY and cXML calls can share the same conference. Use this to bridge multiple callers together with options like recording, hold music, participant limits, and status callbacks. */
@rpcMethod("calling.join_conference")
@summary("Join an ad-hoc audio conference")
@opExample(#{
  parameters: #{
    node_id: "a3e1b2c4-...",
    call_id: "c7f9d2e1-...",
    name: "my_conference",
    muted: false,
    beep: "onEnter",
    start_on_enter: true,
    end_on_exit: false,
    wait_url: "https://hold_music.example/hold_music.wav",
    max_participants: 3,
    record: "record-from-start",
    region: "eu",
    trim: "do-not-trim",
    coach: "123-123-123-123",
    status_callback: "https://my_callback.example/update_conference_status",
    status_callback_event: "start end join leave",
    status_callback_method: "POST",
    recording_status_callback: "https://my_callback.example/update_recording_status",
    recording_status_callback_event: "in-progress completed",
    recording_status_callback_method: "POST",
    stream: #{
      url: "wss://example.com/conference-audio",
      name: "conference_bot",
      codec: "PCMU",
      authorization_bearer_token: "my-token",
      custom_parameters: #{ conference_name: "my_conference" },
    },
  },
  returnType: #{ code: "200", message: "Joining conference" },
})
op joinConference(...JoinConferenceParams): JoinConferenceResult | ConferenceEvent;

// ─────────────────────────────────────────────────────────────────────────────
// calling.leave_conference
// ─────────────────────────────────────────────────────────────────────────────

model LeaveConferenceParams {
  ...CallAddress;

  /** The id of the conference to leave. You receive this from `calling.conference` events when a participant joins. */
  conference_id: string;
}

model LeaveConferenceResult {
  ...RelayResult;
}

/** Removes this call from an audio conference it has joined. Use the `conference_id` you received from `calling.conference` events. */
@rpcMethod("calling.leave_conference")
@summary("Leave an audio conference")
@opExample(#{
  parameters: #{
    node_id: "a3e1b2c4-...",
    call_id: "c7f9d2e1-...",
    conference_id: "f2b9e8a1-...",
  },
  returnType: #{ code: "200", message: "Leaving conference" },
})
op leaveConference(...LeaveConferenceParams): LeaveConferenceResult | ConferenceEvent;

// ─────────────────────────────────────────────────────────────────────────────
// calling.hold (NOT IMPLEMENTED)
// ─────────────────────────────────────────────────────────────────────────────

model HoldParams {
  ...CallAddress;
}

model HoldResult {
  ...RelayResult;

  /** The resulting hold state, always `"hold"`. */
  state?: "hold";
}

/** (Not implemented) Places a call on hold. */
@rpcMethod("calling.hold")
@summary("(Not implemented) Put a call on hold")
@opExample(#{
  parameters: #{ node_id: "a3e1b2c4-...", call_id: "c7f9d2e1-..." },
  returnType: #{ code: "200", message: "Call on hold", state: "hold" },
})
op hold(...HoldParams): HoldResult | CallHoldEvent;

// ─────────────────────────────────────────────────────────────────────────────
// calling.unhold (NOT IMPLEMENTED)
// ─────────────────────────────────────────────────────────────────────────────

model UnholdParams {
  ...CallAddress;
}

model UnholdResult {
  ...RelayResult;

  /** The resulting hold state, always `"unhold"`. */
  state?: "unhold";
}

/** (Not implemented) Takes a call off hold and returns it to the active state. */
@rpcMethod("calling.unhold")
@summary("(Not implemented) Release a call from hold")
@opExample(#{
  parameters: #{ node_id: "a3e1b2c4-...", call_id: "c7f9d2e1-..." },
  returnType: #{ code: "200", message: "Call off hold", state: "unhold" },
})
op unhold(...UnholdParams): UnholdResult | CallHoldEvent;

// ─────────────────────────────────────────────────────────────────────────────
// calling.denoise
// ─────────────────────────────────────────────────────────────────────────────

model DenoiseParams {
  ...CallAddress;
}

model DenoiseResult {
  ...RelayResult;
}

/** Starts noise reduction on a call, filtering background noise out of the audio. Use this on noisy connections to improve clarity. Stop it later with `calling.denoise.stop`. */
@rpcMethod("calling.denoise")
@summary("Start call noise reduction")
@opExample(#{
  parameters: #{ node_id: "a3e1b2c4-...", call_id: "c7f9d2e1-..." },
  returnType: #{ code: "200", message: "Denoiser on" },
})
op denoise(...DenoiseParams): DenoiseResult | CallDenoiseEvent;

// ─────────────────────────────────────────────────────────────────────────────
// calling.denoise.stop
// ─────────────────────────────────────────────────────────────────────────────

model DenoiseStopParams {
  ...CallAddress;
}

model DenoiseStopResult {
  ...RelayResult;
}

/** Stops noise reduction previously started with `calling.denoise` on a call. */
@rpcMethod("calling.denoise.stop")
@summary("Stop call noise reduction")
@opExample(#{
  parameters: #{ node_id: "a3e1b2c4-...", call_id: "c7f9d2e1-..." },
  returnType: #{ code: "200", message: "Denoiser off" },
})
op denoiseStop(...DenoiseStopParams): DenoiseStopResult;

// ─────────────────────────────────────────────────────────────────────────────
// calling.send_digits
// ─────────────────────────────────────────────────────────────────────────────

model SendDigitsParams {
  ...CallAddress;

  /** Your own identifier for this send-digits operation. Use it to correlate the request with the `calling.call.send_digits` events it produces. */
  control_id: string;

  /**
   * The string of DTMF tones to play, in order. Allowed characters are the digits
   * `0`-`9`, `*`, `#`, and `A`-`D` (case-insensitive), plus `w` for a short pause
   * and `W` for a longer pause (repeat them for longer waits). The whole string is
   * rejected if it contains any other character.
   */
  digits: string;
}

model SendDigitsResult {
  ...RelayResult;

  /** The `control_id` you supplied, echoed back. */
  control_id?: string;

  /** The id of the call, echoed back from your request. */
  call_id?: string;
}

/** Plays a sequence of DTMF tones on a call, as if a caller pressed those keys. Use this to navigate IVR menus or send key presses to the far end. The string accepts digits, `*`, `#`, `A`-`D`, and `w`/`W` for pauses. */
@rpcMethod("calling.send_digits")
@summary("Send DTMF digit tones to a call")
@opExample(#{
  parameters: #{
    node_id: "a3e1b2c4-...",
    call_id: "c7f9d2e1-...",
    control_id: "send-digits-1",
    digits: "wW1234567890*#ABCD",
  },
  returnType: #{
    code: "200",
    message: "Sending Digits",
    control_id: "send-digits-1",
    call_id: "c7f9d2e1-...",
  },
})
op sendDigits(...SendDigitsParams): SendDigitsResult | CallSendDigitsEvent;
