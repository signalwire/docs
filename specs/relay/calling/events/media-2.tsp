import "@signalwire/typespec-asyncapi";
import "../common.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

// ─────────────────────────────────────────────────────────────────────────────
// calling.call.fax
// ─────────────────────────────────────────────────────────────────────────────

/** Whether the fax is being sent or received. */
union FaxDirection {
  "send",
  "receive",
}

/** Details of a fax event. The `type` field tells you which stage it describes. */
@discriminator("type")
model CallFax {
  type: string;
}

/** Fires each time a single fax page is sent or received, so you can track progress mid-transmission. */
model FaxPage extends CallFax {
  type: "page";
  params: {
    /** Whether this page was sent or received. */
    direction: FaxDirection;

    /** The page number that was just transmitted. */
    number: int32;
  };
}

/** Fires once the whole fax is done, with the final result and a link to the document. */
model FaxFinished extends CallFax {
  type: "finished";
  params: {
    /** Whether the fax was sent or received. */
    direction: FaxDirection;

    /** Your side's fax identity, typically an E.164 phone number. */
    identity?: string;

    /** The other party's fax identity, typically an E.164 phone number. */
    remote_identity?: string;

    /** Link to the transmitted fax document. */
    document?: url;

    /** Total number of pages sent or received. */
    pages?: int32;

    /** `true` if the fax completed successfully, `false` if it failed. */
    success?: boolean;

    /** Numeric fax result code (for example, `1231`). */
    result?: int32;

    /** Human-readable explanation of the fax result. */
    result_text?: string;
  };
}

/**
 * Fires if the fax fails. The payload here can vary; expect the same
 * `result` and `result_text` fields you get on a finished fax.
 */
model FaxError extends CallFax {
  type: "error";

  /** Error details. The exact fields can vary. */
  params?: Record<unknown>;
}

model CallFaxParams {
  ...CallAddress;

  /** The `control_id` of the fax this event belongs to. */
  control_id: string;

  /** The fax event details. Check `type` to see which stage it reports. */
  fax: CallFax;
}

// No `@example`: `fax` is a required `@discriminator` (CallFax) property, and an
// example value cannot narrow a discriminated base. Per-variant payloads are
// illustrated by the FaxPage/FaxFinished `type`/`params` fields above.
/** Sent as a fax progresses: one event per page, then a final event when it finishes or errors. */
@event("calling.call.fax")
model CallFaxEvent {
  ...CallFaxParams;
}

// ─────────────────────────────────────────────────────────────────────────────
// calling.call.tap
// ─────────────────────────────────────────────────────────────────────────────

/** Where the tap is in its lifecycle: `tapping` while audio is flowing, `finished` once it stops. */
union TapState {
  "tapping",
  "finished",
}

/** Which side of the call audio is being tapped: the caller speaking, what they hear, or both. */
union CallTapDirection {
  "speak",
  "listen",
  "both",
}

/** Describes the media being tapped. Currently always `audio`. */
@discriminator("type")
model TapMedia {
  type: string;
}

/** An audio tap. */
model CallTapAudio extends TapMedia {
  type: "audio";
  params: {
    /** Which side(s) of the call audio this tap captures. */
    direction: CallTapDirection;
  };
}

/** Describes where the tapped audio is being sent. Currently always `rtp`. */
@discriminator("type")
model CallTapDevice {
  type: string;
}

/** The tapped audio is streamed to an RTP destination. */
model CallTapRtpDevice extends CallTapDevice {
  type: "rtp";
  params: {
    /** IP address the tapped audio is sent to. */
    addr: string;

    /** Port the tapped audio is sent to. */
    port: int32;

    /** Codec used for the tapped audio stream. */
    codec: string;

    /** Packetization time of the stream, in milliseconds. */
    ptime: int32;
  };
}

model CallTapParams {
  ...CallAddress;

  /** The `control_id` of the tap this event belongs to. */
  control_id: string;

  /** Whether the tap is still running (`tapping`) or has stopped (`finished`). */
  state: TapState;

  /** What media is being tapped. */
  tap: TapMedia;

  /** Where the tapped audio is being sent. */
  device: CallTapDevice;
}

// No `@example`: `tap` (TapMedia) and `device` (CallTapDevice) are both required
// `@discriminator` properties, and an example value cannot narrow a discriminated
// base. The variant shapes are illustrated by CallTapAudio/CallTapRtpDevice above.
/** Fires when a tap starts streaming call audio and again when it stops. Check `state` to tell which. */
@event("calling.call.tap")
model CallTapEvent {
  ...CallTapParams;
}

// ─────────────────────────────────────────────────────────────────────────────
// calling.call.stream
// ─────────────────────────────────────────────────────────────────────────────

/** Whether the stream is currently `streaming` or has `finished`. */
union StreamState {
  "streaming",
  "finished",
}

model CallStreamParams {
  ...CallAddress;

  /** The `control_id` of the stream this event belongs to. */
  control_id: string;

  /** Whether audio is still streaming (`streaming`) or the stream has stopped (`finished`). */
  state: StreamState;

  /** The WebSocket URL the call audio is being streamed to. */
  url: url;

  /** The friendly name you gave the stream, if you set one. */
  name?: string;
}

/** Fires when a media stream starts and again when it stops. Check `state` to tell which. */
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

/** Whether transcription is currently `transcribing` or has `finished`. */
union TranscribeState {
  "transcribing",
  "finished",
}

model CallTranscribeParams {
  ...CallAddress;

  /** The `control_id` of the transcription this event belongs to. */
  control_id: string;

  /** Whether transcription is still running (`transcribing`) or has stopped (`finished`). */
  state: TranscribeState;

  /** Location of the recording captured alongside the transcription (for example, `recordings/<UUID>.wav`). */
  url: string;

  /** The UUID of the recording captured alongside the transcription. */
  recording_id: string;

  /** The callback URL you provided to receive transcription updates, if any. */
  status_url?: string;

  /** Length of the recording in seconds. Present only when `state` is `finished`. */
  duration?: float64;

  /** Size of the recording in bytes. Present only when `state` is `finished`. */
  size?: int32;

  /** Unix timestamp for when the recording started. Present only when `state` is `finished`. */
  start_time?: float64;

  /** Unix timestamp for when the recording ended. Present only when `state` is `finished`. */
  end_time?: float64;
}

/** Fires when transcription starts and again when it stops. The `finished` event includes the recording's duration, size, and timestamps. */
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

/** Whether the call was just placed on `hold` or taken off hold (`unhold`). */
union HoldState {
  "hold",
  "unhold",
}

model CallHoldParams {
  ...CallAddress;

  /** Whether the call is now on hold (`hold`) or off hold (`unhold`). */
  state: HoldState;
}

/** Fires whenever a call is placed on hold or taken off hold. */
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

  /** The `control_id` of the send-digits operation this event belongs to. */
  control_id: string;

  /** Always `finished`: the digits have all been sent. */
  state: "finished";
}

/** Fires once all requested DTMF digits have finished playing on the call. */
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

/** Tells you exactly what happened in the conference, from start and end to each participant action. */
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

/** The final state of a participant's call when they left (`participant-leave`). */
union ConferenceParticipantCallStatus {
  "no-answer",
  "busy",
  "in-progress",
  "failed",
  "canceled",
  "completed",
}

/** The reason a participant left the conference (`participant-leave`). */
union ConferenceReasonParticipantLeft {
  "conference_ended_via_api",
  "moderator_ended_conference",
  "participant_updated_via_api",
  "participant_hung_up",
  "participant_add_failed",
}

/** The reason the conference ended (`conference-end`). */
union ConferenceReasonEnded {
  "conference-ended-via-api",
  "last-participant-kicked",
  "last-participant-left",
  "participant-with-end-conference-on-exit-kicked",
  "participant-with-end-conference-on-exit-left",
}

/**
 * The details of a conference event. Read `status` first: it tells you what
 * happened and therefore which of the optional fields below are filled in.
 */
model ConferenceParams {
  /** The UUID of the node the conference is running on. */
  node_id: string;

  /** The UUID of the conference. */
  conference_id: string;

  /** The name of the conference. */
  name?: string;

  /** What happened in the conference. */
  status: ConferenceStatus;

  /** The `call_id` of the participant this event is about. Present on participant events. */
  call_id?: string;

  /** Whether the participant is muted. Present on participant events. */
  muted?: boolean;

  /** Whether the participant is on hold. Present on participant events. */
  hold?: boolean;

  /** Whether the participant is coaching another participant. Present on participant events. */
  coaching?: boolean;

  /** Whether the conference ends when this participant leaves. Present on participant events. */
  end_on_exit?: boolean;

  /** Whether the conference starts when this participant joins. Present on participant events. */
  start_on_enter?: boolean;

  /** The participant's final call status. Present on `participant-leave`. */
  participant_call_status?: ConferenceParticipantCallStatus;

  /** Why the participant left. Present on `participant-leave`. */
  reason_participant_left?: ConferenceReasonParticipantLeft;

  /** The `call_id` of the participant whose departure ended the conference. Present on `conference-end`. */
  call_ending_conference?: string;

  /** Why the conference ended. Present on `conference-end`. */
  reason_ended?: ConferenceReasonEnded;

  /** Link to the conference recording. Present on `conference-end`. */
  recording_url?: url;

  /** Recording duration in seconds. Present on `conference-end`. */
  recording_duration?: int32;

  /** Recording file size in bytes. Present on `conference-end`. */
  recording_file_size?: int32;

  /** The URL of the announcement being played. Present on announcement events. */
  announce_url?: url;
}

/** Fires throughout a conference's life: when it starts and ends, and each time a participant joins, leaves, mutes, holds, speaks, or an announcement plays. Check `status` to see what happened. */
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

/** Whether the call is currently `echoing` its audio back or has `finished`. */
union EchoState {
  "echoing",
  "finished",
}

model CallEchoParams {
  ...CallAddress;

  /** Whether the echo is still running (`echoing`) or has stopped (`finished`). */
  state: EchoState;
}

/** Fires when audio echo starts on a call and again when it stops. */
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

/** Where a payment is in its lifecycle: `processing`, `finished`, or `error`. */
union PayState {
  "processing",
  "finished",
  "error",
}

model CallPayParams {
  ...CallAddress;

  /** The `control_id` of the payment this event belongs to. */
  control_id: string;

  /** Whether the payment is in progress (`processing`), completed (`finished`), or failed (`error`). */
  state: PayState;
}

/** Fires as a pay session progresses, letting you track whether it is processing, has finished, or hit an error. */
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
