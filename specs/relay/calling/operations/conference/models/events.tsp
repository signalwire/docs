import "@signalwire/typespec-asyncapi";
import "../../../../common/frames.tsp";
import "@typespec/openapi";

import "../../../models/core.tsp";

using TypeSpec.OpenAPI;

namespace Relay.Calling;

@doc("The conference event that fired — conference start/end, a participant action, an announcement, a recording change, or a bot action.")
union ConferenceStatus {
  "conference-end",
  "conference-start",
  "participant-leave",
  "participant-join",
  "participant-mute",
  "participant-unmute",
  "participant-deaf",
  "participant-undeaf",
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
  "bot-join",
  "bot-leave",
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
@summary("Conference event")
model ConferenceParams {
  @doc("Opaque identifier that, paired with `call_id`, addresses the call this event was delivered for. Treat it as opaque and echo back the value you received.")
  @example("a3f1c2d4-5e6f-7a8b-9c0d-1e2f3a4b5c6d")
  node_id?: string;

  @doc("Identifier of the call segment this event belongs to.")
  @example("e5c3f2b1-8d0a-4b4c-9f3e-2a1b0c9d8e7f")
  segment_id?: string;

  @doc("The `tag` you set when placing the call, if any.")
  @example("my-tag-1")
  tag?: string;

  @doc("The subscriber the call belongs to, when it is a subscriber call.")
  @example("b7e4c1a2-3d5f-4e6a-8b9c-0d1e2f3a4b5c")
  subscriber_id?: string;

  @doc("The address the call belongs to, when it is a subscriber call.")
  @example("f1a2b3c4-d5e6-4f7a-8b9c-0d1e2f3a4b5c")
  address_id?: string;

  @doc("Display name of the subscriber, when it is a subscriber call and a name is set.")
  @example("Alice")
  subscriber_name?: string;

  @doc("The UUID of the conference.")
  @example("d02c88a9-cf83-4a5a-9c8b-2f4e6b1a0f77")
  conference_id: string;

  @doc("Opaque identifier of the node hosting the conference. Distinct from `node_id`, which identifies the call.")
  @example("9b8a7c6d-5e4f-4a3b-2c1d-0e9f8a7b6c5d")
  conference_node_id: string;

  @doc("The name of the conference.")
  @example("my_conference")
  name: string;

  @doc("The region the conference is running in (`global`, `us`, `eu`, or `ch`).")
  @example("eu")
  region: string;

  @doc("The number of members currently in the conference.")
  @example(3)
  size: int32;

  @doc("What happened in the conference — one of the values below.")
  @example("participant-join")
  status: ConferenceStatus;

  @doc("The `call_id` of the call this event was delivered for. For participant events, the participant the event is about.")
  @example("c2a1e9f4-6b3d-4e7a-8f1c-2d3e4f5a6b7c")
  call_id?: string;

  @doc("Whether the participant is muted. Present on participant events.")
  @example(false)
  muted?: boolean;

  @doc("Whether the participant is deafened (can't hear the conference). Present on participant events.")
  @example(false)
  deaf?: boolean;

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

  @doc("Link to the conference recording. Present on `record-*` events and on `conference-end` when the conference was recorded.")
  @example("https://example.com/recordings/conf.mp3")
  recording_url?: url;

  @doc("Recording duration in seconds. Present on `record-stop` and on `conference-end` when the conference was recorded.")
  @example(42)
  recording_duration?: int32;

  @doc("Recording file size in bytes. Present on `record-stop` and on `conference-end` when the conference was recorded.")
  @example(524288)
  recording_file_size?: int32;

  @doc("The URL of the announcement being played. Present on announcement events.")
  @example("https://example.com/announce.mp3")
  announce_url?: url;

}

const callingConference = "calling.conference";
@doc("""
  Fires throughout a conference's life: when it starts and ends, and each time a
  participant joins, leaves, mutes, holds, speaks, or an announcement plays.
  Check `status` to see what happened. Events are delivered per call: for each
  call you control in the conference, you receive that call's own participant
  events plus the conference start and end, and every event carries that
  call's `call_id` and `node_id`. Events about other participants are not
  delivered; to receive every conference event, use `status_callback` on
  `calling.join_conference`.
  """)
@summary(callingConference)
@extension("x-fern-display-name", callingConference)
model ConferenceEvent is SignalwireEvent<typeof callingConference, ConferenceParams>;
