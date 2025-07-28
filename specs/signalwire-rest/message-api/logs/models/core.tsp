import "@typespec/http";
import "../../../types";
import "../../../_globally_shared/const.tsp";

using TypeSpec.Http;

@doc("Unique ID of the log.")
model LogPathID {
  @format("uuid")
  @doc("Unique ID of the log.")
  @path
  id: uuid;
}

@doc("Details on charges associated with this log.")
model ChargeDetail {
  @doc("Description for this charge.")
  @example("SMS Message")
  description: string;

  @doc("Charged amount.")
  @example(0.01)
  charge: float64;
}

@doc("Message log entry with all activity details")
model MessageLog {
  @format("uuid")
  @doc("A unique identifier for the log.")
  id: uuid;

  @doc("The origin phone number.")
  @example("+12065551212")
  from: string;

  @doc("The destination phone number.")
  @example("+12065553434")
  to: string;

  @doc("The status of the message.")
  @example("sent")
  status: string;

  @doc("The direction of the message.")
  @example("inbound")
  direction: string;

  @doc("The kind of message.")
  @example("sms")
  kind: string;

  @doc("Source of this log entry.")
  @example("laml")
  source: string;

  @doc("Type of this log entry.")
  @example("laml_message")
  type: string;

  @doc("URL for the resource associated with this log entry (if available).")
  @example("https://example.signalwire.com/api/laml/Messages/SMxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx")
  url: string;

  @doc("The number of segments.")
  @example(1)
  number_of_segments: int32;

  @doc("The charge in dollars.")
  @example(0.01)
  charge: float64;

  @doc("Details on charges associated with this log.")
  @example(#[])
  charge_details: ChargeDetail[];

  @doc("Date and time when the message entry was created.")
  @example(UTC_TIME_EXAMPLE)
  created_at: utcDateTime;
}
