import "@typespec/http";
import "../../../types";
import "../../const.tsp";
import "../../enums.tsp";

using TypeSpec.Http;

namespace SignalWireAPI.Voice;


model LogPathID {
  @path
  @doc("Unique ID of the log. This is the segment_id you can find in Relay call details in your Dashboard UI or in return objects when using the SDK.")
  @example("b7182dc2-00f3-40e4-a5ce-20f164b329df")
  id: uuid;
}

@doc("Details on charges associated with this log.")
model ChargeDetail {
  @doc("Description for this charge.")
  @example("Text to Speech")
  description: string;

  @doc("Charged amount.")
  @example(0.121176)
  charge: float64;
}

@doc("Common fields shared across all voice log types.")
model VoiceLogCommon {
  @doc("A unique identifier for the log.")
  @example("b7182dc2-00f3-40e4-a5ce-20f164b329df")
  id: uuid;

  @doc("The origin phone number.")
  @example("+12065551212")
  from: string;

  @doc("The destination phone number.")
  @example("+12065553434")
  to: string;

  @doc("Source of this log entry.")
  @example(VoiceSources.realtime_api)
  source: VoiceSources;

  @doc("The charge in dollars.")
  @example(0.01)
  charge: float64;

  @doc("Details on charges associated with this log.")
  @example(#[])
  charge_details: ChargeDetail[];

  @doc("Date and time when the call entry was created.")
  @example(UTC_TIME_EXAMPLE)
  created_at: utcDateTime;
}

@summary("Call Log")
@doc("Voice log for Relay call types. Returned when `type` is `relay_pstn_call`, `relay_sip_call`, or `relay_webrtc_call`.")
model RelayVoiceLog {
  ...VoiceLogCommon;

  @doc("Type of this log entry.")
  @example(RelayVoiceType.relay_sip_call)
  type: RelayVoiceType;

  @doc("Always null for this call type.")
  @example(null)
  url: null;

  @doc("The direction of the voice activity.")
  @example(VoiceDirection.inbound)
  direction: VoiceDirection;

  @doc("The status of the voice activity.")
  @example(VoiceLogStatus.completed)
  status: VoiceLogStatus;

  @doc("The duration of the voice activity in seconds.")
  @example(9)
  duration: int32 | null;

  @doc("The duration of the voice activity in milliseconds.")
  @example(9638)
  duration_ms: int32 | null;

  @doc("The billable duration of the voice activity in milliseconds.")
  @example(60000)
  billing_ms: int32 | null;

  @doc("Parent log identifier for related call entries.")
  @example(null)
  parent_id: string | null;
}

@doc("Audio quality statistics for a Compatibility API call. Each field is null when the call has no measurement for it, such as a call that never carried audio.")
model CallQualityMetrics {
  @doc("The estimated Mean Opinion Score (MOS) for inbound audio quality, from 1 to 4.5, based on the share of incoming audio packets that arrived without loss or delay. Returned as a decimal string.")
  @example("4.5")
  audio_in_mos: string | null;

  @doc("The average round-trip time for audio in milliseconds, in steps of 10.")
  @example(40)
  audio_rtt_avg: float64 | null;

  @doc("The minimum round-trip time for audio in milliseconds, in steps of 10.")
  @example(30)
  audio_rtt_min: float64 | null;

  @doc("The maximum round-trip time for audio in milliseconds, in steps of 10.")
  @example(50)
  audio_rtt_max: float64 | null;

  @doc("The smallest variance measured in the time between incoming audio packets, in milliseconds squared.")
  @example(0.25)
  audio_in_jitter_min: float64 | null;

  @doc("The largest variance measured in the time between incoming audio packets, in milliseconds squared.")
  @example(8.5)
  audio_in_jitter_max: float64 | null;

  @doc("The minimum outbound audio jitter in milliseconds.")
  @example(0)
  audio_out_jitter_min: float64 | null;

  @doc("The maximum outbound audio jitter in milliseconds.")
  @example(2.5)
  audio_out_jitter_max: float64 | null;

  @doc("The average outbound audio jitter in milliseconds.")
  @example(0.56)
  audio_out_jitter_avg: float64 | null;

  @doc("The number of audio packets received in the inbound media stream.")
  @example(1842)
  audio_in_media_packet_count: int32 | null;

  @doc("Not populated. Always `null`; use `audio_out_media_packet_count` for the number of audio packets sent.")
  @example(null)
  audio_out_packet_count: int32 | null;

  @doc("The number of audio packets sent in the outbound media stream.")
  @example(1840)
  audio_out_media_packet_count: int32 | null;

  @doc("The number of outbound audio packets lost.")
  @example(1)
  audio_out_lost: int32 | null;

  @doc("The mean interval between inbound audio packets in milliseconds.")
  @example(20.03)
  audio_in_mean_interval: float64 | null;

  @doc("The number of DTMF packets in the inbound media stream.")
  @example(0)
  audio_in_dtmf_packet_count: int32 | null;

  @doc("The number of DTMF packets in the outbound media stream.")
  @example(0)
  audio_out_dtmf_packet_count: int32 | null;

  @doc("The number of inbound packets not received at the expected interval. Increases with every packet lost from the inbound stream.")
  @example(1)
  audio_in_skip_packet_count: int32 | null;

  @doc("The number of inbound packets removed from the jitter buffer because of buffer overflow or underflow.")
  @example(2)
  audio_in_flush_packet_count: int32 | null;

  @doc("The largest jitter buffer size recorded for inbound audio during the call.")
  @example(4)
  audio_in_largest_jb_size: int32 | null;
}

@summary("Compatibility Call Log")
@doc("Voice log for Compatibility API calls. Returned when `type` is `laml_call`. Includes audio quality statistics for the call.")
model LamlVoiceLog {
  ...VoiceLogCommon;

  @doc("Type of this log entry.")
  @example(VoiceType.laml_call)
  type: VoiceType.laml_call;

  @doc("URL of the call in the Compatibility API.")
  @example("https://example.signalwire.com/api/laml/2010-04-01/Accounts/b3877c40-da60-4998-90ad-b792e98472af/Calls/b7182dc2-00f3-40e4-a5ce-20f164b329df")
  url: url;

  @doc("The direction of the voice activity.")
  @example(VoiceDirection.inbound)
  direction: VoiceDirection;

  @doc("The status of the voice activity.")
  @example(VoiceLogStatus.completed)
  status: VoiceLogStatus;

  @doc("The duration of the voice activity in seconds.")
  @example(9)
  duration: int32 | null;

  @doc("The duration of the voice activity in milliseconds.")
  @example(9638)
  duration_ms: int32 | null;

  @doc("The billable duration of the voice activity in milliseconds.")
  @example(60000)
  billing_ms: int32 | null;

  @doc("Parent log identifier for related call entries.")
  @example(null)
  parent_id: string | null;

  ...CallQualityMetrics;
}

@summary("Video Room Audio Leg Log")
@doc("Voice log for audio legs in a Video Room. Returned when `type` is `video_room_pstn_leg` or `video_room_sip_leg`.")
model VideoRoomVoiceLog {
  ...VoiceLogCommon;

  @doc("Type of this log entry.")
  @example(VideoRoomVoiceType.video_room_pstn_leg)
  type: VideoRoomVoiceType;

  @doc("Always null for this call type.")
  @example(null)
  url: null;

  @doc("The direction of the voice activity.")
  @example(VoiceDirection.inbound)
  direction: VoiceDirection;

  @doc("The status of the voice activity.")
  @example(VoiceLogStatus.completed)
  status: VoiceLogStatus;

  @doc("The duration of the voice activity in seconds.")
  @example(9)
  duration: int32 | null;

  @doc("The duration of the voice activity in milliseconds.")
  @example(9638)
  duration_ms: int32 | null;
}

@summary("Dialogflow Log")
@doc("Voice log for Dialogflow call types. Returned when `type` is `dialogflow_call`.")
model DialogflowVoiceLog {
  ...VoiceLogCommon;

  @doc("Type of this log entry.")
  @example(VoiceType.dialogflow_call)
  type: VoiceType.dialogflow_call;

  @doc("Always null for this call type.")
  @example(null)
  url: null;

  @doc("The status of the voice activity.")
  @example(VoiceLogStatus.completed)
  status: VoiceLogStatus;

  @doc("The duration of the voice activity in seconds.")
  @example(9)
  duration: int32 | null;
}

@summary("Fabric Device Log")
@doc("Voice log for Fabric Subscriber Device call types. Returned when `type` is `fabric_subscriber_device_leg`.")
model FabricVoiceLog {
  ...VoiceLogCommon;

  @doc("Type of this log entry.")
  @example(VoiceType.fabric_subscriber_device_leg)
  type: VoiceType.fabric_subscriber_device_leg;

  @doc("Always null for this call type.")
  @example(null)
  url: null;

  @doc("The direction of the voice activity.")
  @example(VoiceDirection.inbound)
  direction: VoiceDirection;

  @doc("The status of the voice activity. Always null for this call type.")
  @example(null)
  status: VoiceLogStatus | null;
}

@summary("Deleted Log")
@doc("A discarded/deleted voice log entry. Returned when the log has been deleted. Only present when `include_deleted` is `true`.")
model DiscardedVoiceLog {
  @doc("A unique identifier for the log.")
  @example("b7182dc2-00f3-40e4-a5ce-20f164b329df")
  id: uuid;

  @doc("Date and time when the log was discarded.")
  @example(UTC_TIME_EXAMPLE)
  discarded_at: utcDateTime;

  @doc("Date and time when the log was originally created.")
  @example(UTC_TIME_EXAMPLE)
  created_at: utcDateTime;
}

@doc("A voice log entry. The specific fields present depend on the `type` value. Discarded logs return only `id`, `discarded_at`, and `created_at`.")
union VoiceLog {
  RelayVoiceLog,
  LamlVoiceLog,
  VideoRoomVoiceLog,
  DialogflowVoiceLog,
  FabricVoiceLog,
  DiscardedVoiceLog,
}

@doc("Event entry for a voice log")
model LogEvent {
  @doc("Timestamp when the event occurred.")
  @example(UTC_TIME_EXAMPLE)
  event_at: utcDateTime;

  @doc("Log level of the event.")
  @example("info")
  level: "info" | "warn" | "error" | "debug";

  @doc("Name of the event.")
  @example("calling_call_initiated")
  name: string;

  @doc("Additional details about the event. Structure varies by event type.")
  @example(#{})
  details: {};

  @doc("Unique identifier for the project.")
  @example("b7182dc2-00f3-40e4-a5ce-20f164b329df")
  project_id: uuid;

  @doc("Unique identifier for the log.")
  @example("b7182dc2-00f3-40e4-a5ce-20f164b329df")
  log_id: uuid;
}
