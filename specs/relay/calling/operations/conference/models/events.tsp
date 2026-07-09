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
  "participant-hold",
  "participant-unhold",
  "participant-modify",
  "participant-speech-start",
  "participant-speech-stop",

  @doc("Per-participant voice-quality (QoS) report. Emitted only when the conference was joined with `emit_call_quality: true`. Carries the participant's QoS metrics.")
  "participant-call-quality",

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
  @doc("Opaque identifier that, paired with `call_id`, addresses this call. Present on participant events; absent on `conference-start`/`conference-end`. Treat it as opaque and echo back the value you received.")
  @example("a3f1c2d4-5e6f-7a8b-9c0d-1e2f3a4b5c6d")
  node_id?: string;

  @doc("The UUID of the conference.")
  @example("d02c88a9-cf83-4a5a-9c8b-2f4e6b1a0f77")
  conference_id: string;

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

  @doc("Average round-trip time, in milliseconds. Present only on `participant-call-quality` events, and only when the measurement is available.")
  @example("48")
  rtt_avg?: string;

  @doc("Minimum round-trip time, in milliseconds. Present only on `participant-call-quality` events, and only when the measurement is available.")
  @example("32")
  rtt_min?: string;

  @doc("Maximum round-trip time, in milliseconds. Present only on `participant-call-quality` events, and only when the measurement is available.")
  @example("120")
  rtt_max?: string;

  @doc("Minimum outbound jitter, in milliseconds. Present only on `participant-call-quality` events, and only when the measurement is available.")
  @example("2")
  out_jitter_min?: string;

  @doc("Maximum outbound jitter, in milliseconds. Present only on `participant-call-quality` events, and only when the measurement is available.")
  @example("18")
  out_jitter_max?: string;

  @doc("Average outbound jitter, in milliseconds. Present only on `participant-call-quality` events, and only when the measurement is available.")
  @example("6")
  out_jitter_avg?: string;

  @doc("Number of outbound packets lost. Present only on `participant-call-quality` events, and only when the measurement is available.")
  @example("3")
  out_lost?: string;

  @doc("Total inbound media bytes received. Present only on `participant-call-quality` events, and only when the measurement is available.")
  @example("1048576")
  in_media_bytes?: string;

  @doc("Number of inbound media packets received. Present only on `participant-call-quality` events, and only when the measurement is available.")
  @example("5000")
  in_media_packet_count?: string;

  @doc("Number of inbound packets skipped. Present only on `participant-call-quality` events, and only when the measurement is available.")
  @example("12")
  in_skip_packet_count?: string;

  @doc("Number of inbound packets affected by jitter. Present only on `participant-call-quality` events, and only when the measurement is available.")
  @example("40")
  in_jitter_packet_count?: string;

  @doc("Number of inbound DTMF packets received. Present only on `participant-call-quality` events, and only when the measurement is available.")
  @example("4")
  in_dtmf_packet_count?: string;

  @doc("Number of inbound comfort-noise (CNG) packets received. Present only on `participant-call-quality` events, and only when the measurement is available.")
  @example("2")
  in_cng_packet_count?: string;

  @doc("Number of inbound packets flushed. Present only on `participant-call-quality` events, and only when the measurement is available.")
  @example("1")
  in_flush_packet_count?: string;

  @doc("Total count of inbound stream flaws detected. Present only on `participant-call-quality` events, and only when the measurement is available.")
  @example("5")
  in_flaws_total?: string;

  @doc("Inbound stream quality as a percentage (0-100). Present only on `participant-call-quality` events, and only when the measurement is available.")
  @example("98")
  in_quality_percentage?: string;

  @doc("Inbound Mean Opinion Score (MOS), a 1.0-5.0 estimate of perceived audio quality. Present only on `participant-call-quality` events, and only when the measurement is available.")
  @example("4.4")
  in_mos?: string;

  @doc("Total outbound media bytes sent. Present only on `participant-call-quality` events, and only when the measurement is available.")
  @example("1048576")
  out_media_bytes?: string;

  @doc("Number of outbound media packets sent. Present only on `participant-call-quality` events, and only when the measurement is available.")
  @example("5000")
  out_media_packet_count?: string;

  @doc("Number of outbound DTMF packets sent. Present only on `participant-call-quality` events, and only when the measurement is available.")
  @example("4")
  out_dtmf_packet_count?: string;

  @doc("Number of outbound comfort-noise (CNG) packets sent. Present only on `participant-call-quality` events, and only when the measurement is available.")
  @example("2")
  out_cng_packet_count?: string;
}

const callingConference = "calling.conference";
@doc("Fires throughout a conference's life: when it starts and ends, and each time a participant joins, leaves, mutes, holds, speaks, or an announcement plays. Check `status` to see what happened.")
@summary(callingConference)
@extension("x-fern-display-name", callingConference)
model ConferenceEvent is SignalwireEvent<typeof callingConference, ConferenceParams>;
