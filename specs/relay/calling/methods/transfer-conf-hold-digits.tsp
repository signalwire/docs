import "@signalwire/typespec-asyncapi";
import "../common.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

// ═════════════════════════════════════════════════════════════════════════════
// Shared enums for this family (conference status-callback knobs)
// ═════════════════════════════════════════════════════════════════════════════

/** Beep behaviour when a participant enters/leaves a conference. String-typed on the wire (`"true"`/`"false"` are strings, not booleans). */
union ConferenceBeep {
  "true",
  "false",
  "onEnter",
  "onExit",
}

/** Whether (and when) a conference is recorded. */
union ConferenceRecord {
  "do-not-record",
  "record-from-start",
}

/** Geographic region the conference media is anchored in. */
union ConferenceRegion {
  "global",
  "us",
  "eu",
}

/** Whether leading/trailing silence is trimmed from a conference recording. */
union ConferenceTrim {
  "trim-silence",
  "do-not-trim",
}

/** Encoding of a conference status callback payload. */
union ConferenceCallbackEventType {
  "relay",
  "cxml",
}

/** HTTP method used to deliver a conference status callback. */
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
   * Where to transfer call control. One of: an `https://` script URL to POST, an
   * inline SWML script, or a relay application prefixed with `context:`. A single
   * wire string — polymorphic by prefix/scheme.
   */
  dest: string;
}

model TransferResult {
  ...RelayResult;

  /** The transferred call id (echoed). */
  call_id?: string;
}

/** (async-safe) Transfer call control to another RELAY application or to a SWML script. */
@rpcMethod("calling.transfer")
@summary("Transfer call control to a RELAY app or SWML script")
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

  /** Name of the conference to join. */
  name: string;

  /** Join muted. */
  muted?: boolean = false;

  /** Beep behaviour on enter/exit. Default `true`. */
  beep?: ConferenceBeep;

  /** Start the conference when this participant enters. */
  start_on_enter?: boolean = true;

  /** End the conference when this participant exits. */
  end_on_exit?: boolean = false;

  /** URL to CXML or an mp3/wav to play while waiting. Default: hold music. */
  wait_url?: url;

  /** Maximum number of participants (positive, `<= 250`). Default `250`. */
  @minValueExclusive(0)
  @maxValue(250)
  max_participants?: int32;

  /** Whether/when to record the conference. Default `do-not-record`. */
  record?: ConferenceRecord;

  /** Region the conference media is anchored in. Default `global`. */
  region?: ConferenceRegion;

  /** Trim silence from the recording. Default `trim-silence`. */
  trim?: ConferenceTrim;

  /** A SWML Call ID or CXML CallSid to coach. Default: not set. */
  coach?: string;

  /** URL to POST conference status callbacks to. Default: not set. */
  status_callback?: url;

  /**
   * Space-separated list of conference events to deliver to `status_callback`.
   * Tokens: `start end join leave mute hold modify speaker announcement`.
   * Default: not set.
   */
  status_callback_event?: string;

  /** Encoding of the status callback payload. Default `relay`. */
  status_callback_event_type?: ConferenceCallbackEventType;

  /** HTTP method for `status_callback`. Default `POST`. Ignored when `status_callback_event_type` is `relay`. */
  status_callback_method?: ConferenceCallbackMethod;

  /** URL to POST recording status callbacks to. Default: not set. */
  recording_status_callback?: url;

  /**
   * Space-separated list of recording lifecycle events to deliver to
   * `recording_status_callback`. Tokens: `in-progress completed absent`
   * (e.g. `"in-progress completed"`). Default `completed`.
   */
  recording_status_callback_event?: string;

  /** Encoding of the recording status callback payload. Default `relay`. */
  recording_status_callback_event_type?: ConferenceCallbackEventType;

  /** HTTP method for `recording_status_callback`. Default `POST`. Ignored when `recording_status_callback_event_type` is `relay`. */
  recording_status_callback_method?: ConferenceCallbackMethod;

  /**
   * Attach a bidirectional WebSocket stream to the conference. Reuses the same
   * `call_device_stream` schema as `calling.connect`'s stream device.
   */
  stream?: StreamDeviceParams;
}

model JoinConferenceResult {
  ...RelayResult;
}

/** Join an ad-hoc audio conference with RELAY and CXML calls. */
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

  /** The conference identifier. Comes from `calling.conference` events. */
  conference_id: string;
}

model LeaveConferenceResult {
  ...RelayResult;
}

/** Leave an audio conference. */
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

  /** Resulting hold state (always `"hold"`). */
  state?: "hold";
}

/** (NOT IMPLEMENTED) (async-safe) Put a call into a hold state. */
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

  /** Resulting hold state (always `"unhold"`). */
  state?: "unhold";
}

/** (NOT IMPLEMENTED) (async-safe) Release a call from a hold state. */
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

/** (async-safe) Start call noise reduction. */
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

/** (async-safe) Stop call noise reduction. */
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

  /** An identifier used to control the active send-digits operation. */
  control_id: string;

  /**
   * The string of digits to play. Allowed: `1234567890*#ABCD`, plus `w` (0.5s
   * wait) and `W` (1s wait), repeated for longer waits. Any invalid character
   * rejects the entire operation.
   */
  digits: string;
}

model SendDigitsResult {
  ...RelayResult;

  /** The send-digits control id (echoed). */
  control_id?: string;

  /** The call id (echoed). */
  call_id?: string;
}

/** Send DTMF digit tones to a call. */
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
