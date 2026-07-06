import "@signalwire/typespec-asyncapi";
import "../../../../common/frames.tsp";
import "@typespec/openapi";

import "../../../models/core.tsp";

using TypeSpec.OpenAPI;

namespace Relay.Calling;

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

  @doc("Per-participant voice-quality (QoS) report. Emitted only when the conference was joined with `emit_call_quality: true`. Carries QoS metrics not yet individually modeled here.")
  "participant-call-quality",

  "announcement-end",
  "announcement-fail",
  "record-start",
  "record-pause",
  "record-resume",
  "record-stop",
  "bot-join",
  "bot-leave",
  "bot-speech-start",
  "bot-speech-stop",
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
  @example("a3f1c2d4-5e6f-7a8b-9c0d-1e2f3a4b5c6d")
  node_id?: string;

  @doc("The UUID of the conference.")
  @example("d02c88a9-cf83-4a5a-9c8b-2f4e6b1a0f77")
  conference_id: string;

  @doc("The name of the conference — or, on stream events, the name of the stream.")
  @example("my_conference")
  name?: string;

  @doc("The region the conference is running in (`global`, `us`, `eu`, or `ch`).")
  @example("eu")
  region?: string;

  @doc("The number of members currently in the conference.")
  @example(3)
  size?: int32;

  @doc("What happened in the conference.")
  @example("participant-join")
  status: ConferenceStatus;

  @doc("Extra detail about the change. Present only when `status` is `participant-modify`.")
  @example("muted")
  status_detail?: string;

  @doc("The `call_id` of the participant this event is about. Present on participant events.")
  @example("c2a1e9f4-6b3d-4e7a-8f1c-2d3e4f5a6b7c")
  call_id?: string;

  @doc("Whether the participant is muted. Present on participant events.")
  @example(false)
  muted?: boolean;

  @doc("Whether the participant is on hold. Present on participant events.")
  @example(false)
  hold?: boolean;

  @doc("Whether the participant is coaching another participant. Present on participant events.")
  @example(false)
  coaching?: boolean;

  @doc("The `call_id` of the participant being coached. Present on coaching participant events.")
  @example("c2a1e9f4-6b3d-4e7a-8f1c-2d3e4f5a6b7c")
  call_id_to_coach?: string;

  @doc("Whether the conference ends when this participant leaves. Present on participant events.")
  @example(false)
  end_on_leave?: boolean;

  @doc("Whether the conference starts when this participant joins. Present on participant events.")
  @example(true)
  start_on_join?: boolean;

  @doc("The `call_id` of the participant whose departure ended the conference. Present on `conference-end`.")
  @example("c2a1e9f4-6b3d-4e7a-8f1c-2d3e4f5a6b7c")
  call_id_ending_conf?: string;

  @doc("Why the conference ended. Present on `conference-end`.")
  @example("last-participant-left")
  reason_ended?: ConferenceReasonEnded;

  @doc("Link to the conference recording. Present on `conference-end`.")
  @example("https://example.com/recordings/conf.mp3")
  recording_url?: url;

  @doc("Recording duration in seconds. Present on `conference-end`.")
  @example(42)
  recording_duration?: int32;

  @doc("Recording file size in bytes. Present on `conference-end`.")
  @example(524288)
  recording_file_size?: int32;

  @doc("The URL of the announcement being played. Present on announcement events.")
  @example("https://example.com/announce.mp3")
  announce_url?: url;
}

const callingConference = "calling.conference";
@doc("Fires throughout a conference's life: when it starts and ends, and each time a participant joins, leaves, mutes, holds, speaks, or an announcement plays. Check `status` to see what happened.")
@summary(callingConference)
@extension("x-fern-display-name", callingConference)
model ConferenceEvent is SignalwireEvent<typeof callingConference, ConferenceParams>;
