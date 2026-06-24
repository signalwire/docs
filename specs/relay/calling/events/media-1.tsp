import "@signalwire/typespec-asyncapi";
import "../common.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

// ─────────────────────────────────────────────────────────────────────────────
// calling.call.refer
// ─────────────────────────────────────────────────────────────────────────────

/** How a transfer (SIP REFER) is progressing. */
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

  /** Where the transfer currently stands. */
  state: ReferState;

  /** The SIP URI the call is being transferred to. */
  sip_refer_to?: string;

  /** The SIP response code the far end returned to the REFER request, as a string (for example `"202"`). */
  sip_refer_response_code?: string;

  /**
   * The SIP response code from the NOTIFY messages that follow the REFER, as a
   * string (for example `"200"`). This tells you whether the transfer ultimately
   * succeeded.
   */
  sip_notify_response_code?: string;
}

/** Fires each time a transferred call (SIP REFER) changes state, so you can follow the handoff from start to success or failure. */
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

/** The current state of audio playback on the call. */
union CallPlayState {
  "playing",
  "paused",
  "error",
  "finished",
}

model CallPlayParams {
  ...CallAddress;

  /** The `control_id` of the playback this event refers to, returned when you started it with `calling.play`. */
  control_id: string;

  /** Where the playback currently stands. */
  state: CallPlayState;
}

/** Fires when audio playback on a call starts, pauses, resumes, finishes, or errors, so you can track a `calling.play` through to completion. */
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

/** What just happened to the call in the queue: it entered (`enqueue`), was pulled out to be connected (`dequeue`), or left on its own (`leave`). */
union CallQueueStatus {
  "enqueue",
  "dequeue",
  "leave",
}

model CallQueueParams {
  ...CallAddress;

  /** The `control_id` of the queue session this event refers to, returned when the call entered with `calling.queue.enter`. */
  control_id: string;

  /** What just happened to the call in the queue. */
  status?: CallQueueStatus;

  /** The queue's unique id. */
  id?: string;

  /** The queue's name. */
  name?: string;

  /** Where this call currently sits in line, counting from the front. */
  position?: float64;

  /** How many calls are currently waiting in the queue. */
  size?: float64;

  /** The average time, in seconds, calls have been spending in this queue. */
  avg_time?: float64;

  /** The time, as a Unix timestamp in seconds, when the call entered the queue. */
  enqueue_ts?: float64;

  /** The time, as a Unix timestamp in seconds, when the call was pulled from the queue. */
  dequeue_ts?: float64;

  /** The time, as a Unix timestamp in seconds, when the call left the queue. */
  leave_ts?: float64;
}

/** Fires as a call moves through a queue — when it joins, gets connected, or leaves — and reports its position along with live queue stats. */
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

/** Where input collection currently stands: still listening, finished, or stopped on an error. */
union CallCollectState {
  "collecting",
  "error",
  "finished",
}

/**
 * What the caller gave you. Read `type` to know which kind of result this is. The
 * `error`, `no_input`, `no_match`, and `start_of_input` types are markers with no
 * extra data, while `digit` and `speech` include a `params` object with the
 * collected input.
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

/** Signals that the caller has started speaking. You only receive this when you collect with `calling.collect`. */
model CallCollectResultStartOfInput extends CallCollectResult {
  type: "start_of_input";
}

model CallCollectResultDigit extends CallCollectResult {
  type: "digit";
  params: {
    /** The DTMF digits the caller pressed. */
    digits: string;

    /** The digit that ended collection, if the caller pressed your terminator key. */
    terminator?: string;
  };
}

model CallCollectResultSpeech extends CallCollectResult {
  type: "speech";
  params: {
    /** The text the speech recognizer heard the caller say. */
    text: string;

    /** How confident the recognizer is in the result (for example `83.2`). */
    confidence?: float64;
  };
}

model CallCollectParams {
  ...CallAddress;

  /** The `control_id` of the collection this event refers to, returned when you started it with `calling.collect`. */
  control_id: string;

  /** Where the collection currently stands. `error` means it stopped because something went wrong. */
  state: CallCollectState;

  /** What the caller gave you. Check its `type` to handle digits, speech, or a no-input/no-match marker. */
  result?: CallCollectResult;

  /**
   * Relevant when you requested partial or continuous results: `true` once the
   * recognizer has finished the current utterance. With `continuous: true`, the
   * collector then restarts to listen for the next one.
   */
  final?: boolean;
}

/** Fires as you collect input from a caller — DTMF digits or speech — reporting partial and final results so you can react to what they said or pressed. */
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

/** Where the recording currently stands, including `no_input` when nothing was captured. */
union CallRecordState {
  "recording",
  "paused",
  "finished",
  "no_input",
}

/** Which side of the conversation was recorded. */
union RecordEventDirection {
  /** Only what the party hears. */
  "listen",

  /** Only what the party says. */
  "speak",

  /** Both sides of the conversation. */
  "both",
}

/** The audio settings the recording was captured with. */
model RecordEventAudio {
  /** The file format of the recording (for example `mp3` or `wav`). */
  format?: string;

  /** Whether the recording was captured in stereo. */
  stereo?: boolean;

  /** Which side(s) of the conversation were captured. */
  direction?: RecordEventDirection;
}

/** Describes how the recording was made. The `audio` field is present when you recorded audio. */
model RecordEventSpec {
  /** The audio settings used for this recording. */
  audio?: RecordEventAudio;
}

model CallRecordParams {
  ...CallAddress;

  /** The `control_id` of the recording this event refers to, returned when you started it with `calling.record`. */
  control_id: string;

  /** Where the recording currently stands. */
  state: CallRecordState;

  /** Where to download the finished recording. Not available until the state is `finished`. */
  url?: url;

  /** How long the recording is, in seconds. Set once the state is `finished`. */
  duration?: float64;

  /** How large the recording file is, in bytes. Set once the state is `finished`. */
  size?: int32;

  /** The settings this recording was captured with. */
  record?: RecordEventSpec;
}

/** Fires when a recording starts, pauses, resumes, or finishes. The finished event includes the download URL, duration, and file size. */
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

/** What the fax detector heard. */
union CallDetectFaxEvent {
  /** The answering fax machine's tone (CED). */
  "CED",

  /** The calling fax machine's tone (CNG). */
  "CNG",

  /** The detector finished. */
  "finished",

  /** The detector could not start. */
  "error",
}

/** What the answering-machine detector concluded. */
union CallDetectMachineEvent {
  /** An answering machine picked up. */
  "MACHINE",

  /** A human answered. This is a final result. */
  "HUMAN",

  /** The detector could not tell whether it was a human or a machine. */
  "UNKNOWN",

  /**
   * The machine is ready for you to leave your message. This is a final result
   * when `detect_interruptions=false` or `beep=true`.
   */
  "READY",

  /**
   * The machine's greeting started over and interrupted your message. You only
   * receive this when `detect_interruptions=true`.
   */
  "NOT_READY",

  /** The detector finished. */
  "finished",

  /** The detector could not start. */
  "error",
}

/**
 * What the detector found. Read `type` to know which detector reported it: `fax`,
 * `machine`, or `digit`. Whatever the type, the `event` field can also carry the
 * generic `finished` value when the detector completes, or `error` if it could not
 * start.
 */
@discriminator("type")
model CallDetectResult {
  type: string;
}

model CallDetectFax extends CallDetectResult {
  type: "fax";
  params: {
    /** What the fax detector heard. */
    event: CallDetectFaxEvent;
  };
}

model CallDetectMachine extends CallDetectResult {
  type: "machine";
  params: {
    /** What the answering-machine detector concluded. */
    event: CallDetectMachineEvent;

    /** Whether a beep was detected, signaling it's your turn to leave a message. */
    beep?: boolean;
  };
}

model CallDetectDigit extends CallDetectResult {
  type: "digit";
  params: {
    /** The DTMF digit that was detected: one of `0`-`9`, `#`, or `*`. */
    event: string;
  };
}

model CallDetectParams {
  ...CallAddress;

  /** The `control_id` of the detector this event refers to, returned when you started it with `calling.detect`. */
  control_id: string;

  /** What the detector found, including which kind of detector reported it. */
  detect: CallDetectResult;
}

/** Fires when a detector reports a result — a fax tone, an answering machine versus a human, or a DTMF digit. */
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

  /** Whether background noise reduction is now on (`true`) or off. */
  denoised: boolean;
}

/** Fires when background noise reduction is turned on or off for the call. Unlike most media events, this one carries no `control_id`. */
@event("calling.call.denoise")
@example(#{
  node_id: "a3e1b2c4-1234-5678-9abc-def012345678",
  call_id: "c7f9d2e1-8765-4321-0fed-cba987654321",
  denoised: true,
})
model CallDenoiseEvent {
  ...CallDenoiseParams;
}
