import "@signalwire/typespec-asyncapi";
import "../common.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

// ─────────────────────────────────────────────────────────────────────────────
// calling.call.refer
// ─────────────────────────────────────────────────────────────────────────────

/** State of a SIP-REFER transfer (`calling.call.refer`). */
union ReferState {
  "inProgress",
  "cancel",
  "busy",
  "noAnswer",
  "error",
  "success",
}

model CallReferParams {
  ...CallAddress;

  /** The transfer state. */
  state: ReferState;

  /** The SIP URI the call is being transferred to. */
  sip_refer_to?: string;

  /** SIP response code to the REFER request (string, e.g. `"202"`). */
  sip_refer_response_code?: string;

  /**
   * SIP response code to the NOTIFY(s) received after the REFER (string, e.g.
   * `"200"`). Indicates whether the transfer ultimately succeeded.
   */
  sip_notify_response_code?: string;
}

/** A change in state of a transferred (SIP-REFER) call. */
@event("calling.call.refer")
@example(#{
  node_id: "a3e1b2c4-1234-5678-9abc-def012345678",
  call_id: "c7f9d2e1-8765-4321-0fed-cba987654321",
  state: "success",
  sip_refer_to: "sip:agent@example.com",
  sip_refer_response_code: "202",
  sip_notify_response_code: "200",
})
model CallReferEvent {
  ...CallReferParams;
}

// ─────────────────────────────────────────────────────────────────────────────
// calling.call.play
// ─────────────────────────────────────────────────────────────────────────────

/** State of an active play (`calling.call.play`). */
union CallPlayState {
  "playing",
  "paused",
  "error",
  "finished",
}

model CallPlayParams {
  ...CallAddress;

  /** Identifier of the active play (from `calling.play`). */
  control_id: string;

  /** The play state. */
  state: CallPlayState;
}

/** A change in a call's play state. */
@event("calling.call.play")
@example(#{
  node_id: "a3e1b2c4-1234-5678-9abc-def012345678",
  call_id: "c7f9d2e1-8765-4321-0fed-cba987654321",
  control_id: "b2d4f6a8-1111-2222-3333-444455556666",
  state: "finished",
})
model CallPlayEvent {
  ...CallPlayParams;
}

// ─────────────────────────────────────────────────────────────────────────────
// calling.call.queue
// ─────────────────────────────────────────────────────────────────────────────

/**
 * Queue transition reported by `calling.call.queue`. (The prose param-list
 * mislabels this field `state` with play-style values; the wire payload field is
 * `status` with these values — payload is authoritative.)
 */
union CallQueueStatus {
  "enqueue",
  "dequeue",
  "leave",
}

model CallQueueParams {
  ...CallAddress;

  /** Identifier of the active queue (from `calling.queue.enter`). */
  control_id: string;

  /** The queue transition. */
  status?: CallQueueStatus;

  /** Queue id. */
  id?: string;

  /** Queue name. */
  name?: string;

  /** Position of the call within the queue. */
  position?: float64;

  /** Number of calls in the queue. */
  size?: float64;

  /** Average time (seconds) calls spend in the queue. */
  avg_time?: float64;

  /** Epoch (seconds) the call entered the queue. */
  enqueue_ts?: float64;

  /** Epoch (seconds) the call was dequeued. */
  dequeue_ts?: float64;

  /** Epoch (seconds) the call left the queue. */
  leave_ts?: float64;
}

/** A change in a call's queue state. */
@event("calling.call.queue")
@example(#{
  node_id: "a3e1b2c4-1234-5678-9abc-def012345678",
  call_id: "c7f9d2e1-8765-4321-0fed-cba987654321",
  control_id: "b2d4f6a8-1111-2222-3333-444455556666",
  status: "enqueue",
  id: "q1a2b3c4-aaaa-bbbb-cccc-ddddeeeeffff",
  name: "support",
  position: 3,
  size: 5,
  avg_time: 42.0,
  enqueue_ts: 1718600000.0,
})
model CallQueueEvent {
  ...CallQueueParams;
}

// ─────────────────────────────────────────────────────────────────────────────
// calling.call.collect
// ─────────────────────────────────────────────────────────────────────────────

/** Overall state of an active collect (`calling.call.collect`). */
union CallCollectState {
  "collecting",
  "error",
  "finished",
}

/**
 * The collected input. Discriminated on `type`. The `error`, `no_input`,
 * `no_match` and `start_of_input` variants carry no `params`; `digit` and
 * `speech` carry a `params` payload.
 */
@discriminator("type")
model CallCollectResult {
  type: string;
}

model CallCollectResultError extends CallCollectResult {
  type: "error";
}

model CallCollectResultNoInput extends CallCollectResult {
  type: "no_input";
}

model CallCollectResultNoMatch extends CallCollectResult {
  type: "no_match";
}

/** Fired only when using the `calling.collect` API (start-of-speech marker). */
model CallCollectResultStartOfInput extends CallCollectResult {
  type: "start_of_input";
}

model CallCollectResultDigit extends CallCollectResult {
  type: "digit";
  params: {
    /** The collected DTMF digits. */
    digits: string;

    /** The terminator digit that ended collection, if any. */
    terminator?: string;
  };
}

model CallCollectResultSpeech extends CallCollectResult {
  type: "speech";
  params: {
    /** The recognized utterance. */
    text: string;

    /** Recognition confidence (e.g. `83.2`). */
    confidence?: float64;
  };
}

model CallCollectParams {
  ...CallAddress;

  /** Identifier of the active collect (from `calling.collect`). */
  control_id: string;

  /** The collect state. `error` means the detector ended with an error. */
  state: CallCollectState;

  /** The collect result. */
  result?: CallCollectResult;

  /**
   * Meaningful when `partial_results`/`continuous` was set: `true` once utterance
   * detection has completed. With `continuous: true` the collector restarts for
   * the next utterance.
   */
  final?: boolean;
}

/** A call's collect result. */
@event("calling.call.collect")
// `result` is omitted: its type `CallCollectResult` is a @discriminator base,
// which @example cannot narrow to a concrete variant (digit/speech/etc.).
@example(#{
  node_id: "a3e1b2c4-1234-5678-9abc-def012345678",
  call_id: "c7f9d2e1-8765-4321-0fed-cba987654321",
  control_id: "b2d4f6a8-1111-2222-3333-444455556666",
  state: "finished",
  final: true,
})
model CallCollectEvent {
  ...CallCollectParams;
}

// ─────────────────────────────────────────────────────────────────────────────
// calling.call.record
// ─────────────────────────────────────────────────────────────────────────────

/** State of an active recording (`calling.call.record`). */
union CallRecordState {
  "recording",
  "paused",
  "finished",
  "no_input",
}

/** Audio direction reported on a recording event. */
union RecordEventDirection {
  /** What the call party hears. */
  "listen",

  /** What the call party says. */
  "speak",

  /** Both directions. */
  "both",
}

/**
 * The reported `record.audio` subobject — a slimmer echo of the recording
 * configuration than the request-side `RecordAudio`.
 */
model RecordEventAudio {
  /** Output file format (e.g. `mp3`, `wav`). */
  format?: string;

  /** Whether the recording was captured in stereo. */
  stereo?: boolean;

  /** Which audio direction(s) were captured. */
  direction?: RecordEventDirection;
}

/**
 * Reported recording spec. Keyed by the subobject name (`audio`) rather than a
 * `type` discriminator; only the `audio` variant is documented. (Prose also
 * references a `record.params` subobject for non-audio types — shape
 * undocumented.)
 */
model RecordEventSpec {
  /** Audio-recording configuration (present when recording audio). */
  audio?: RecordEventAudio;
}

model CallRecordParams {
  ...CallAddress;

  /** Identifier of the active recording (from `calling.record`). */
  control_id: string;

  /** The recording state. */
  state: CallRecordState;

  /** Location of the recording — not accessible until `finished`. */
  url?: url;

  /** Length of the recording in seconds — set when `finished`. */
  duration?: float64;

  /** Size of the recording in bytes — set when `finished`. */
  size?: int32;

  /** The recording configuration. */
  record?: RecordEventSpec;
}

/** A change in a call recording's state. */
@event("calling.call.record")
@example(#{
  node_id: "a3e1b2c4-1234-5678-9abc-def012345678",
  call_id: "c7f9d2e1-8765-4321-0fed-cba987654321",
  control_id: "b2d4f6a8-1111-2222-3333-444455556666",
  state: "finished",
  url: "https://example.com/recordings/c7f9d2e1.mp3",
  duration: 20.0,
  size: 123456788,
  record: #{ audio: #{ format: "mp3", stereo: false, direction: "both" } },
})
model CallRecordEvent {
  ...CallRecordParams;
}

// ─────────────────────────────────────────────────────────────────────────────
// calling.call.detect
// ─────────────────────────────────────────────────────────────────────────────

/** Fax-detector event values. */
union CallDetectFaxEvent {
  /** Called-station fax tone. */
  "CED",

  /** Calling-station fax tone. */
  "CNG",

  /** The detector completed. */
  "finished",

  /** The detector was unable to start. */
  "error",
}

/** Answering-machine-detector event values. */
union CallDetectMachineEvent {
  /** Machine detected. */
  "MACHINE",

  /** Human detected — a final event. */
  "HUMAN",

  /** Not sure. */
  "UNKNOWN",

  /**
   * Machine ready for voicemail delivery — final if `detect_interruptions=false`
   * or `beep=true`.
   */
  "READY",

  /**
   * Machine voicemail restarted, interrupting delivery. Only fired if
   * `detect_interruptions=true`.
   */
  "NOT_READY",

  /** The detector completed. */
  "finished",

  /** The detector was unable to start. */
  "error",
}

/**
 * A detector's event payload. Discriminated on `type` (`fax|machine|digit`).
 * Every variant's `params.event` may also surface the generic `finished` (on
 * completion) or `error` (if unable to start) values in addition to its
 * type-specific values; these are included in each variant's `event` type.
 */
@discriminator("type")
model CallDetectResult {
  type: string;
}

model CallDetectFax extends CallDetectResult {
  type: "fax";
  params: {
    /** The fax-detector event. */
    event: CallDetectFaxEvent;
  };
}

model CallDetectMachine extends CallDetectResult {
  type: "machine";
  params: {
    /** The machine-detector event. */
    event: CallDetectMachineEvent;

    /** Whether a beep has been detected. */
    beep?: boolean;
  };
}

model CallDetectDigit extends CallDetectResult {
  type: "digit";
  params: {
    /** The detected DTMF digit (one of `0-9`, `#`, `*`). */
    event: string;
  };
}

model CallDetectParams {
  ...CallAddress;

  /** Identifier of the active detector (from `calling.detect`). */
  control_id: string;

  /** The detector-specific information. */
  detect: CallDetectResult;
}

/** A call-detection event from an active detector. */
// No @example: the required `detect` field is typed as the @discriminator base
// `CallDetectResult`, which @example cannot narrow to a concrete variant
// (fax/machine/digit). Omitting a required field would be an invalid example.
@event("calling.call.detect")
model CallDetectEvent {
  ...CallDetectParams;
}

// ─────────────────────────────────────────────────────────────────────────────
// calling.call.denoise
// ─────────────────────────────────────────────────────────────────────────────

model CallDenoiseParams {
  ...CallAddress;

  /** Whether noise reduction is enabled (`true`) or disabled. */
  denoised: boolean;
}

/** A call-denoiser state event. (Carries no `control_id`.) */
@event("calling.call.denoise")
@example(#{
  node_id: "a3e1b2c4-1234-5678-9abc-def012345678",
  call_id: "c7f9d2e1-8765-4321-0fed-cba987654321",
  denoised: true,
})
model CallDenoiseEvent {
  ...CallDenoiseParams;
}
