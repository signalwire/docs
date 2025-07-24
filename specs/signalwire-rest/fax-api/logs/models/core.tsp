import "../../../types";
import "../../const.tsp";

using TypeSpec.Http;

model LogPathID {
  @doc("Unique ID of the log")
  @format("uuid")
  @path
  id: uuid;
}

model ChargeDetail {
  @doc("Description for this charge.")
  @example("")
  description?: string;

  @doc("Charged amount.")
  charge?: float64;
}

model FaxLog {
  @doc("A unique identifier for the log")
  @format("uuid")
  id: uuid;

  @doc("The origin phone number in E.164 format.")
  @example("+12065551212")
  from: string;

  @doc("The destination phone number in E.164 format.")
  @example("+12065553434")
  to: string;

  @doc("The status of this fax call.")
  @example("completed")
  status: string;

  @doc("The direction of this fax call.")
  @example("outbound")
  direction: "inbound" | "outbound";

  @doc("Source of this log entry.")
  @example("laml")
  source: string;

  @doc("Type of this log entry.")
  @example("laml_call")
  type: string;

  @doc("URL for the associated fax resource with this log entry (if available)")
  url?: url;

  remote_station?: string;

  @example(0.01)
  @doc("The amount charge for this fax request.")
  charge?: float64;

  @example(2)
  @doc("The number of pages the fax document contained.")
  number_of_pages?: int32;

  @example("fine")
  @doc("The quality that was set when the fax document was sent.")
  quality?: "fine" | "standard" | "superfine";

  @doc("Details on charges associated with this log.")
  charge_details?: ChargeDetail[];

  @doc("Date and time when the fax was created.")
  @example(UTC_TIME_EXAMPLE)
  created_at: utcDateTime;

  @doc("Error code for this resource (if available).")
  @example("34004")
  error_code?: string;

  @doc("The description of this error (if available).")
  @example("The call dropped prematurely")
  error_message?: string;
}