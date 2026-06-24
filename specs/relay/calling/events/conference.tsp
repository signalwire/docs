import "@signalwire/typespec-asyncapi";

import "../models/core.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

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
