import "@typespec/http";
import "../../../types";
import "../../const.tsp";
import "../../enums.tsp";

using TypeSpec.Http;

model LogPathID {
  @format("uuid")
  @path
  @doc("Unique ID of the log. This is the segment_id you can find in Relay call details in your Dashboard UI or in return objects when using the SDK.")
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

@doc("Voice log entry with all activity details")
model VoiceLog {
  @format("uuid")
  @doc("A unique identifier for the log.")
  id: uuid;

  @doc("The origin phone number.")
  @example("+12065551212")
  from: string;

  @doc("The destination phone number.")
  @example("+12065553434")
  to: string;

  @doc("The direction of the voice activity.")
  @example("inbound")
  direction: "inbound" | "outbound";

  @doc("The status of the voice activity.")
  @example(VoiceLogStatus.completed)
  status: VoiceLogStatus;

  @doc("The duration of the voice activity in seconds.")
  @example(9)
  duration: int32;

  @doc("The duration of the voice activity in milliseconds.")
  @example(9638)
  duration_ms: int32;

  @doc("The billable duration of the voice activity in seconds.")
  @example(60)
  billing_ms: int32;

  @doc("Source of this log entry.")
  @example(VoiceSources.realtime_api)
  source: VoiceSources;

  @doc("Type of this log entry.")
  @example(VoiceType.relay_sip_call)
  type: VoiceType;

  @doc("URL for the resource associated with this log entry (if available).")
  @example(null)
  url: url | null;

  @doc("The charge in dollars.")
  @example(0.01)
  charge: float64;

  @doc("Details on charges associated with this log.")
  @example(#[])
  charge_details: ChargeDetail[];

  @doc("Date and time when the call entry was created.")
  @example(UTC_TIME_EXAMPLE)
  created_at: utcDateTime;

  @doc("Parent log identifier for related call entries.")
  @example(null)
  parent_id: string | null;
}
