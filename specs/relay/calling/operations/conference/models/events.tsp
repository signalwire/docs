import "@signalwire/typespec-asyncapi";
import "../../../../common/frames.tsp";
import "@typespec/openapi";

import "../../../models/core.tsp";

using TypeSpec.OpenAPI;

namespace Relay.Calling;

// ─────────────────────────────────────────────────────────────────────────────
// calling.conference
// ─────────────────────────────────────────────────────────────────────────────

@doc("Tells you exactly what happened in the conference, from start and end to each participant action.")
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
  "record-start",
  "record-pause",
  "record-resume",
  "record-stop",
  "stream-started",
  "stream-stopped",
  "stream-error",
}

@doc("The reason the conference ended (`conference-end`).")
union ConferenceReasonEnded {
  "conference-ended-via-api",
  "last-participant-kicked",
  "last-participant-left",
  "participant-with-end-conference-on-exit-kicked",
  "participant-with-end-conference-on-exit-left",
}

@doc("""
  The details of a conference event. Read `status` first: it tells you what
  happened and therefore which of the optional fields below are filled in.
  """)
model ConferenceParams {
  @doc("The UUID of the node. Present on participant and stream events; absent on `conference-start`/`conference-end`.")
  node_id?: string;

  @doc("The UUID of the conference.")
  conference_id: string;

  @doc("The name of the conference.")
  name?: string;

  @doc("The region the conference is running in (`global`, `us`, `eu`, or `ch`).")
  region?: string;

  @doc("The number of members currently in the conference.")
  size?: int32;

  @doc("What happened in the conference.")
  status: ConferenceStatus;

  @doc("The `call_id` of the participant this event is about. Present on participant events.")
  call_id?: string;

  @doc("Whether the participant is muted. Present on participant events.")
  muted?: boolean;

  @doc("Whether the participant is on hold. Present on participant events.")
  hold?: boolean;

  @doc("Whether the participant is coaching another participant. Present on participant events.")
  coaching?: boolean;

  @doc("The `call_id` of the participant being coached. Present on coaching participant events.")
  call_id_to_coach?: string;

  @doc("Whether the conference ends when this participant leaves. Present on participant events.")
  end_on_leave?: boolean;

  @doc("Whether the conference starts when this participant joins. Present on participant events.")
  start_on_join?: boolean;

  @doc("The `call_id` of the participant whose departure ended the conference. Present on `conference-end`.")
  call_id_ending_conf?: string;

  @doc("Why the conference ended. Present on `conference-end`.")
  reason_ended?: ConferenceReasonEnded;

  @doc("Link to the conference recording. Present on `conference-end`.")
  recording_url?: url;

  @doc("Recording duration in seconds. Present on `conference-end`.")
  recording_duration?: int32;

  @doc("Recording file size in bytes. Present on `conference-end`.")
  recording_file_size?: int32;

  @doc("The URL of the announcement being played. Present on announcement events.")
  announce_url?: url;
}

const callingConference = "calling.conference";
@doc("Fires throughout a conference's life: when it starts and ends, and each time a participant joins, leaves, mutes, holds, speaks, or an announcement plays. Check `status` to see what happened.")
@summary(callingConference)
@extension("x-fern-display-name", callingConference)
model ConferenceEvent is SignalwireEvent<typeof callingConference, ConferenceParams>;
