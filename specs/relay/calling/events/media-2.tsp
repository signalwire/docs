import "@signalwire/typespec-asyncapi";
import "../common.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

// ─────────────────────────────────────────────────────────────────────────────
// calling.call.fax
// ─────────────────────────────────────────────────────────────────────────────

/** Direction of a fax page / transmission. */
union FaxDirection {
  "send",
  "receive",
}

/** A fax event payload, discriminated on `type`. */
@discriminator("type")
model CallFax {
  type: string;
}

/** A single page was sent or received. */
model FaxPage extends CallFax {
  type: "page";
  params: {
    /** Whether the page was sent or received. */
    direction: FaxDirection;

    /** Page number. */
    number: int32;
  };
}

/** The fax transmission finished. */
model FaxFinished extends CallFax {
  type: "finished";
  params: {
    /** Whether the fax was sent or received. */
    direction: FaxDirection;

    /** Local fax identity (e.g. an E.164 number). */
    identity?: string;

    /** Remote fax identity (e.g. an E.164 number). */
    remote_identity?: string;

    /** Document URL location. */
    document?: url;

    /** Number of pages sent / received. */
    pages?: int32;

    /** Whether the fax completed successfully. */
    success?: boolean;

    /** Fax result code (e.g. `1231`). */
    result?: int32;

    /** Human-readable fax result text. */
    result_text?: string;
  };
}

/**
 * The fax transmission errored. The wire shape for this variant is not
 * documented in the protocol reference; it is modeled loosely and likely
 * shares the `finished` result/result_text fields.
 */
model FaxError extends CallFax {
  type: "error";

  /** Error-variant params (shape undocumented). */
  params?: Record<unknown>;
}

model CallFaxParams {
  ...CallAddress;

  /** The ID used to control the active fax. */
  control_id: string;

  /** Fax event information. */
  fax: CallFax;
}

// No `@example`: `fax` is a required `@discriminator` (CallFax) property, and an
// example value cannot narrow a discriminated base. Per-variant payloads are
// illustrated by the FaxPage/FaxFinished `type`/`params` fields above.
/** A fax event (page / finished / error). */
@event("calling.call.fax")
model CallFaxEvent {
  ...CallFaxParams;
}

// ─────────────────────────────────────────────────────────────────────────────
// calling.call.tap
// ─────────────────────────────────────────────────────────────────────────────

/** State of an active tap. */
union TapState {
  "tapping",
  "finished",
}

/** Direction of tapped media. (Only `speak` is shown in the reference.) */
union CallTapDirection {
  "speak",
  "listen",
  "both",
}

/** The tapped media, discriminated on `type`. (Only `audio` is documented.) */
@discriminator("type")
model TapMedia {
  type: string;
}

/** Audio tap. */
model CallTapAudio extends TapMedia {
  type: "audio";
  params: {
    /** Which side(s) of the media are tapped. */
    direction: CallTapDirection;
  };
}

/** The device receiving the tapped media, discriminated on `type`. (Only `rtp` is documented.) */
@discriminator("type")
model CallTapDevice {
  type: string;
}

/** RTP tap sink. */
model CallTapRtpDevice extends CallTapDevice {
  type: "rtp";
  params: {
    /** Destination address. */
    addr: string;

    /** Destination port. */
    port: int32;

    /** Negotiated codec. */
    codec: string;

    /** Packetization time, in milliseconds. */
    ptime: int32;
  };
}

model CallTapParams {
  ...CallAddress;

  /** The ID used to control the active tap. */
  control_id: string;

  /** The tap state. */
  state: TapState;

  /** The tapped media info. */
  tap: TapMedia;

  /** The device receiving the tapped media. */
  device: CallTapDevice;
}

// No `@example`: `tap` (TapMedia) and `device` (CallTapDevice) are both required
// `@discriminator` properties, and an example value cannot narrow a discriminated
// base. The variant shapes are illustrated by CallTapAudio/CallTapRtpDevice above.
/** A call-tap state event. */
@event("calling.call.tap")
model CallTapEvent {
  ...CallTapParams;
}

// ─────────────────────────────────────────────────────────────────────────────
// calling.call.stream
// ─────────────────────────────────────────────────────────────────────────────

/** State of an active stream. */
union StreamState {
  "streaming",
  "finished",
}

model CallStreamParams {
  ...CallAddress;

  /** The ID used to control the active stream. */
  control_id: string;

  /** The stream state. */
  state: StreamState;

  /** The WebSocket URL being streamed to. */
  url: url;

  /** The friendly name of the stream (if provided). */
  name?: string;
}

/** A call-stream state change. */
@event("calling.call.stream")
@example(#{
  node_id: "a3e1b2c4-5d6f-7a8b-9c0d-1e2f3a4b5c6d",
  call_id: "c7f9d2e1-3a4b-5c6d-7e8f-9a0b1c2d3e4f",
  control_id: "8f14e45f-ceea-167a-5a36-dedd4bea2543",
  state: "streaming",
  url: "wss://example.com/audio",
  name: "my_stream",
})
model CallStreamEvent {
  ...CallStreamParams;
}

// ─────────────────────────────────────────────────────────────────────────────
// calling.call.transcribe
// ─────────────────────────────────────────────────────────────────────────────

/** State of an active transcription. */
union TranscribeState {
  "transcribing",
  "finished",
}

model CallTranscribeParams {
  ...CallAddress;

  /** The ID used to control the active transcription. */
  control_id: string;

  /** The transcription state. */
  state: TranscribeState;

  /** Location of the recording (e.g. `recordings/<UUID>.wav`). */
  url: string;

  /** The UUID of the shadow recording. */
  recording_id: string;

  /** The callback URL, if one was provided. */
  status_url?: string;

  /** Length of the recording in seconds. Set only on `finished`. */
  duration?: float64;

  /** Size of the recording in bytes. Set only on `finished`. */
  size?: int32;

  /** Unix timestamp when recording started. Set only on `finished`. */
  start_time?: float64;

  /** Unix timestamp when recording ended. Set only on `finished`. */
  end_time?: float64;
}

/** A call-transcription state. */
@event("calling.call.transcribe")
@example(#{
  node_id: "a3e1b2c4-5d6f-7a8b-9c0d-1e2f3a4b5c6d",
  call_id: "c7f9d2e1-3a4b-5c6d-7e8f-9a0b1c2d3e4f",
  control_id: "8f14e45f-ceea-167a-5a36-dedd4bea2543",
  state: "finished",
  url: "recordings/d4f5a6b7-c8d9-0e1f-2a3b-4c5d6e7f8a9b.wav",
  recording_id: "d4f5a6b7-c8d9-0e1f-2a3b-4c5d6e7f8a9b",
  status_url: "https://example.com/callback",
  duration: 30.0,
  size: 123456,
  start_time: 1772717474.381,
  end_time: 1772717504.381,
})
model CallTranscribeEvent {
  ...CallTranscribeParams;
}

// ─────────────────────────────────────────────────────────────────────────────
// calling.call.hold
// ─────────────────────────────────────────────────────────────────────────────

/** A call's hold state. */
union HoldState {
  "hold",
  "unhold",
}

model CallHoldParams {
  ...CallAddress;

  /** The hold state. */
  state: HoldState;
}

/** A call hold-state event. (No `control_id`.) */
@event("calling.call.hold")
@example(#{
  node_id: "a3e1b2c4-5d6f-7a8b-9c0d-1e2f3a4b5c6d",
  call_id: "c7f9d2e1-3a4b-5c6d-7e8f-9a0b1c2d3e4f",
  state: "hold",
})
model CallHoldEvent {
  ...CallHoldParams;
}

// ─────────────────────────────────────────────────────────────────────────────
// calling.call.send_digits
// ─────────────────────────────────────────────────────────────────────────────

model CallSendDigitsParams {
  ...CallAddress;

  /** The ID used to control the active send_digits operation. */
  control_id: string;

  /** The send_digits state. (Only `finished` is documented.) */
  state: "finished";
}

/** A send-digits completion event. */
@event("calling.call.send_digits")
@example(#{
  node_id: "a3e1b2c4-5d6f-7a8b-9c0d-1e2f3a4b5c6d",
  call_id: "c7f9d2e1-3a4b-5c6d-7e8f-9a0b1c2d3e4f",
  control_id: "8f14e45f-ceea-167a-5a36-dedd4bea2543",
  state: "finished",
})
model CallSendDigitsEvent {
  ...CallSendDigitsParams;
}

// ─────────────────────────────────────────────────────────────────────────────
// calling.conference
// ─────────────────────────────────────────────────────────────────────────────

/**
 * The conference event status — a secondary discriminator multiplexing all
 * `calling.conference` payloads.
 */
union ConferenceStatus {
  "conference-end",
  "conference-start",
  "participant-leave",
  "participant-join",
  "participant-mute",
  "participant-unmute",
  "participant-hold",
  "participant-unhold",
  "participant-modify",
  "participant-speech-start",
  "participant-speech-stop",
  "announcement-end",
  "announcement-fail",
}

/** Final call status of a participant who left (`participant-leave`). */
union ConferenceParticipantCallStatus {
  "no-answer",
  "busy",
  "in-progress",
  "failed",
  "canceled",
  "completed",
}

/** Why a participant left (`participant-leave`). */
union ConferenceReasonParticipantLeft {
  "conference_ended_via_api",
  "moderator_ended_conference",
  "participant_updated_via_api",
  "participant_hung_up",
  "participant_add_failed",
}

/** Why a conference ended (`conference-end`). */
union ConferenceReasonEnded {
  "conference-ended-via-api",
  "last-participant-kicked",
  "last-participant-left",
  "participant-with-end-conference-on-exit-kicked",
  "participant-with-end-conference-on-exit-left",
}

/**
 * A conference lifecycle or participant event. The `status` field indicates
 * which event occurred and therefore which of the optional fields below are
 * populated; fields tied to a specific status are optional here.
 */
model ConferenceParams {
  /** The UUID of the node this conference is on. */
  node_id: string;

  /** The UUID of the conference. */
  conference_id: string;

  /** The name of the conference. */
  name?: string;

  /** Which conference event occurred. */
  status: ConferenceStatus;

  /** Participant call id. Set on participant statuses. */
  call_id?: string;

  /** Whether the participant is muted. Set on participant statuses. */
  muted?: boolean;

  /** Whether the participant is on hold. Set on participant statuses. */
  hold?: boolean;

  /** Whether the participant is coaching. Set on participant statuses. */
  coaching?: boolean;

  /** Whether the conference ends when this participant exits. Set on participant statuses. */
  end_on_exit?: boolean;

  /** Whether the conference starts when this participant enters. Set on participant statuses. */
  start_on_enter?: boolean;

  /** The participant's final call status. Set on `participant-leave`. */
  participant_call_status?: ConferenceParticipantCallStatus;

  /** Why the participant left. Set on `participant-leave`. */
  reason_participant_left?: ConferenceReasonParticipantLeft;

  /** UUID of the call that ended the conference. Set on `conference-end`. */
  call_ending_conference?: string;

  /** Why the conference ended. Set on `conference-end`. */
  reason_ended?: ConferenceReasonEnded;

  /** URL of the conference recording. Set on `conference-end`. */
  recording_url?: url;

  /** Recording duration in seconds. Set on `conference-end`. */
  recording_duration?: int32;

  /** Recording file size in bytes. Set on `conference-end`. */
  recording_file_size?: int32;

  /** Announcement URL. Set on announcement statuses. */
  announce_url?: url;
}

/** A conference lifecycle / participant event. */
@event("calling.conference")
@example(#{
  node_id: "a3e1b2c4-5d6f-7a8b-9c0d-1e2f3a4b5c6d",
  conference_id: "f0e9d8c7-b6a5-4938-2716-0a1b2c3d4e5f",
  name: "sales-standup",
  status: "participant-leave",
  call_id: "c7f9d2e1-3a4b-5c6d-7e8f-9a0b1c2d3e4f",
  muted: false,
  hold: false,
  coaching: false,
  end_on_exit: false,
  start_on_enter: true,
  participant_call_status: "completed",
  reason_participant_left: "participant_hung_up",
})
model ConferenceEvent {
  ...ConferenceParams;
}

// ─────────────────────────────────────────────────────────────────────────────
// calling.call.echo
// ─────────────────────────────────────────────────────────────────────────────

/** A call's echo state. */
union EchoState {
  "echoing",
  "finished",
}

model CallEchoParams {
  ...CallAddress;

  /** The echo state. */
  state: EchoState;
}

/** A call echo state event. (No `control_id`.) */
@event("calling.call.echo")
@example(#{
  node_id: "a3e1b2c4-5d6f-7a8b-9c0d-1e2f3a4b5c6d",
  call_id: "c7f9d2e1-3a4b-5c6d-7e8f-9a0b1c2d3e4f",
  state: "echoing",
})
model CallEchoEvent {
  ...CallEchoParams;
}

// ─────────────────────────────────────────────────────────────────────────────
// calling.call.pay
// ─────────────────────────────────────────────────────────────────────────────

/**
 * A call payment state. The example shows `processing|finished|error`; the full
 * set is not confirmed in the reference.
 */
union PayState {
  "processing",
  "finished",
  "error",
}

model CallPayParams {
  ...CallAddress;

  /** The ID used to control the active pay. */
  control_id: string;

  /** The payment state. */
  state: PayState;
}

/** A call payment state event. */
@event("calling.call.pay")
@example(#{
  node_id: "a3e1b2c4-5d6f-7a8b-9c0d-1e2f3a4b5c6d",
  call_id: "c7f9d2e1-3a4b-5c6d-7e8f-9a0b1c2d3e4f",
  control_id: "8f14e45f-ceea-167a-5a36-dedd4bea2543",
  state: "processing",
})
model CallPayEvent {
  ...CallPayParams;
}

// NOTE: `calling.error` is intentionally NOT modeled here. Verified in
// mod_infrastructure/relay.c (relay_call_error_event_create, ~line 1545): error events have their
// event_channel rewritten to the call_id specifically so they are "only delivered to database / UI"
// and "do not get delivered over websocket to client SDK." Clients never receive it. Operation
// failures surface to clients via each command's own event error state (e.g. call.play
// state:"error", CallCollectResultError, call.detect "error") and the RPC reply.
