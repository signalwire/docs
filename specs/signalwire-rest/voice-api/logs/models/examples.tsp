import "../../enums.tsp";
import "../../const.tsp";

namespace SignalWireAPI.Voice;

const VOICE_LOG_LINKS_EXAMPLE = #{
  self: "https://example.signalwire.com/api/voice/logs?page_number=0&page_size=50",
  first: "https://example.signalwire.com/api/voice/logs?page_size=50",
};

const VOICE_LOG_PHONE_CALL_EXAMPLE = #{
  id: "b7182dc2-00f3-40e4-a5ce-20f164b329df",
  from: "+12065551212",
  to: "+12065553434",
  source: VoiceSources.realtime_api,
  charge: 0.01,
  charge_details: #[],
  created_at: UTC_TIME_EXAMPLE,
  type: RelayVoiceType.relay_pstn_call,
  url: null,
  direction: VoiceDirection.inbound,
  status: VoiceLogStatus.completed,
  duration: 9,
  duration_ms: 9638,
  billing_ms: 60000,
  parent_id: null,
  qos_metrics: null,
};

// An inbound WhatsApp call is logged as a Relay PSTN call whose `to` keeps the `whatsapp:` prefix.
const VOICE_LOG_WHATSAPP_CALL_EXAMPLE = #{
  id: "7c1f6c1e-3b2a-4d9e-9f0b-2a6c8e5d4f31",
  from: "+15551234567",
  to: "whatsapp:+15557654321",
  source: VoiceSources.realtime_api,
  charge: 0.01,
  charge_details: #[],
  created_at: UTC_TIME_EXAMPLE,
  type: RelayVoiceType.relay_pstn_call,
  url: null,
  direction: VoiceDirection.inbound,
  status: VoiceLogStatus.completed,
  duration: 42,
  duration_ms: 42310,
  billing_ms: 60000,
  parent_id: null,
  qos_metrics: null,
};

// A cXML call carries its audio quality statistics as top-level fields.
const VOICE_LOG_CXML_CALL_EXAMPLE = #{
  id: "3f9a2c41-8d7e-4b6a-9c15-0e2d4f6a8b70",
  from: "+12065551212",
  to: "+12065553434",
  source: VoiceSources.laml,
  charge: 0.01,
  charge_details: #[],
  created_at: UTC_TIME_EXAMPLE,
  type: VoiceType.laml_call,
  url: "https://example.signalwire.com/api/laml/2010-04-01/Accounts/b3877c40-da60-4998-90ad-b792e98472af/Calls/3f9a2c41-8d7e-4b6a-9c15-0e2d4f6a8b70",
  direction: VoiceDirection.inbound,
  status: VoiceLogStatus.completed,
  duration: 37,
  duration_ms: 37000,
  billing_ms: 60000,
  parent_id: null,
  audio_in_mos: "4.5",
  audio_rtt_avg: 40,
  audio_rtt_min: 30,
  audio_rtt_max: 50,
  audio_in_jitter_min: 0.25,
  audio_in_jitter_max: 8.5,
  audio_out_jitter_min: 0,
  audio_out_jitter_max: 2.5,
  audio_out_jitter_avg: 0.56,
  audio_in_media_packet_count: 1842,
  audio_out_packet_count: null,
  audio_out_media_packet_count: 1840,
  audio_out_lost: 1,
  audio_in_mean_interval: 20.03,
  audio_in_dtmf_packet_count: 0,
  audio_out_dtmf_packet_count: 0,
  audio_in_skip_packet_count: 1,
  audio_in_flush_packet_count: 2,
  audio_in_largest_jb_size: 0,
};
