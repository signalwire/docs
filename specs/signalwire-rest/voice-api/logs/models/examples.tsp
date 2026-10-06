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
};
