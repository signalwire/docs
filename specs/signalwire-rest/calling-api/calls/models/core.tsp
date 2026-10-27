import "../const.tsp";

namespace SignalWireAPI.Calling;


@doc("The direction of the call.")
enum CallDirection {
  @doc("An inbound call received by the system.")
  inbound,

  @doc("An outbound call placed by the system.")
  outbound,

  @doc("An outbound call initiated via the API.")
  `outbound-api`,
}

@doc("The type of call.")
enum CallType {
  @doc("A PSTN call placed via Relay.")
  relay_pstn_call,

  @doc("A SIP call placed via Relay.")
  relay_sip_call,

  @doc("A WebRTC call placed via Relay.")
  relay_webrtc_call,

  @doc("A Fabric subscriber device leg.")
  fabric_subscriber_device_leg,
}

@doc("Fields shared by all call leg types.")
model CallBase {
  @doc("The unique identifier of the call on SignalWire. This can be used to update the call programmatically.")
  @example("0e9c80d7-a149-4917-892d-420043709f45")
  id: uuid;

  @doc("The origin number or address.")
  @example("+12069708643")
  from: string;

  @doc("The destination number or address.")
  @example("+15550198765")
  to: string;

  @doc("The direction of the call.")
  @example(CallDirection.`outbound-api`)
  direction: CallDirection;

  @doc("Source of this call.")
  @example("realtime_api")
  source: "realtime_api";

  @doc("The URL associated with this call.")
  @example(null)
  url: string | null;

  @doc("Total charge for this call.")
  @example(0)
  charge: float64;

  @doc("The date and time when the call was created.")
  @example(UTC_TIME_EXAMPLE)
  created_at: utcDateTime;

  @doc("Details on charges associated with this call.")
  @example(#[#{ description: "Outbound Voice", charge: 0.004 }])
  charge_details: ChargeDetails[];
}

@summary("Call Leg")
@doc("Returned when the call is a standard PSTN, SIP, or WebRTC call.")
model CallLeg {
  ...CallBase;

  @doc("The status of the call.")
  @example(CallResponseStatus.queued)
  status: CallResponseStatus | null;

  @doc("The duration of the call in seconds.")
  @example(null)
  duration: integer | null;

  @doc("The duration of the call in milliseconds.")
  @example(null)
  duration_ms: integer | null;

  @doc("The billable duration of the call in milliseconds.")
  @example(null)
  billing_ms: integer | null;

  @doc("Type of this call.")
  @example(CallType.relay_pstn_call)
  type: CallType.relay_pstn_call | CallType.relay_sip_call | CallType.relay_webrtc_call;

  @doc("The parent call ID if this is a child call.")
  @example(null)
  parent_id: uuid | null;

  @doc("Audio quality statistics for the call. `null` until the call has ended and its statistics have been recorded.")
  @example(null)
  qos_metrics: CallQosMetrics | null;
}

@doc("""
  Audio quality statistics measured on the call's media. `audio_in_*` values describe audio
  received from the far end, `audio_out_*` values audio sent to it. Each statistic is included
  only when it was measured, so any key may be absent.
  """)
model CallQosMetrics {
  @doc("Number of audio packets received.")
  @example(345)
  audio_in_media_packet_count?: integer;

  @doc("Number of DTMF packets received.")
  @example(0)
  audio_in_dtmf_packet_count?: integer;

  @doc("Number of received audio packets that were skipped.")
  @example(5)
  audio_in_skip_packet_count?: integer;

  @doc("Number of received audio packets flushed from the jitter buffer.")
  @example(0)
  audio_in_flush_packet_count?: integer;

  @doc("The largest size the jitter buffer reached.")
  @example(0)
  audio_in_largest_jb_size?: integer;

  @doc("Total number of flaws detected in received audio.")
  @example(0)
  audio_in_flaw_total?: integer;

  @doc("Quality of the received audio, as a percentage.")
  @example(100)
  audio_in_quality_percentage?: float64;

  @doc("Mean interval between received audio packets, in milliseconds.")
  @example(20)
  audio_in_mean_interval?: float64;

  @doc("Smallest jitter variance measured on received audio.")
  @example(0.06)
  audio_in_jitter_min_variance?: float64;

  @doc("Largest jitter variance measured on received audio.")
  @example(0.23)
  audio_in_jitter_max_variance?: float64;

  @doc("Number of audio packets sent.")
  @example(349)
  audio_out_media_packet_count?: integer;

  @doc("Number of DTMF packets sent.")
  @example(0)
  audio_out_dtmf_packet_count?: integer;

  @doc("Number of sent audio packets lost.")
  @example(0)
  audio_out_lost?: integer;

  @doc("Smallest jitter measured on sent audio.")
  audio_out_jitter_min?: float64;

  @doc("Largest jitter measured on sent audio.")
  audio_out_jitter_max?: float64;

  @doc("Average jitter measured on sent audio.")
  audio_out_jitter_avg?: float64;

  @doc("Smallest round-trip time measured.")
  audio_rtt_min?: float64;

  @doc("Largest round-trip time measured.")
  audio_rtt_max?: float64;

  @doc("Average round-trip time measured.")
  audio_rtt_avg?: float64;
}

@summary("Fabric Subscriber Device Leg")
@doc("Returned when the call is a Fabric subscriber device leg. The `status` field is always null for this type.")
model FabricDeviceLeg {
  ...CallBase;

  @doc("The status of the call. Always null for Fabric subscriber device legs.")
  @example(null)
  status: null;

  @doc("Type of this call.")
  @example(CallType.fabric_subscriber_device_leg)
  type: CallType.fabric_subscriber_device_leg;
}

@doc("One itemized charge applied to the call.")
model ChargeDetails {
  @doc("Description for this charge.")
  @example("Text to Speech")
  description: string;

  @doc("Charged amount.")
  @example(0.121176)
  charge: float64;
}

@doc("Codec offered on an outbound call. For PSTN, `PCMU`/`PCMA` are widely supported. `OPUS@<rate>H@<ptime>I` variants pin the OPUS sample rate (Hz) and packetization time (ms).")
enum OutboundCallCodec {
  OPUS: "OPUS",
  `OPUS@48000H@20I`: "OPUS@48000H@20I",
  `OPUS@24000H@20I`: "OPUS@24000H@20I",
  `OPUS@16000H@20I`: "OPUS@16000H@20I",
  `OPUS@8000H@20I`: "OPUS@8000H@20I",
  G722: "G722",
  PCMU: "PCMU",
  PCMA: "PCMA",
  G729: "G729",
  VP8: "VP8",
  H264: "H264",
}

@doc("The type of tap device to stream audio to.")
enum TapDeviceType {
  @doc("Stream audio via RTP protocol.")
  rtp,

  @doc("Stream audio via WebSocket.")
  ws,
}

@doc("RTP/WebSocket audio codec. Case-sensitive; accepted in both upper and lower case.")
enum TapCodec {
  PCMA: "PCMA",
  PCMU: "PCMU",
  pcma: "pcma",
  pcmu: "pcmu",
  OPUS: "OPUS",
  opus: "opus",
}

@doc("RTP packetization time in milliseconds. Must be a multiple of 10 between 10 and 120.")
enum TapPtime {
  `10`: 10,
  `20`: 20,
  `30`: 30,
  `40`: 40,
  `50`: 50,
  `60`: 60,
  `70`: 70,
  `80`: 80,
  `90`: 90,
  `100`: 100,
  `110`: 110,
  `120`: 120,
}
