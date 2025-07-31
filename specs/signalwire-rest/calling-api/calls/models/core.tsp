import "../const.tsp";

model Call {
  @doc("The unique identifier of the call on SignalWire. This can be used to update the call programmatically.")
  @example("0e9c80d7-a149-4917-892d-420043709f45")
  id: string;

  @doc("The origin number or address.")
  @example("+12069708643")
  from: string;

  @doc("The destination number or address.")
  @example("+18048390497")
  to: string;

  @doc("The direction of the call.")
  @example("outbound-api")
  direction: "outbound-api";

  @doc("The status of the call.")
  @example("queued")
  status: "answered" | "queued" | "initiated" | "ringing" | "ending" | "ended";

  @doc("The duration of the call in seconds.")
  @example(null)
  duration: integer | null;

  @doc("The duration of the call in milliseconds.")
  @example(null)
  duration_ms: integer | null;

  @doc("The billable duration of the call in milliseconds.")
  @example(null)
  billing_ms: integer | null;

  @doc("Source of this call.")
  @example("realtime_api")
  source: "realtime_api";

  @doc("Type of this call.")
  @example("relay_pstn_call")
  type: "relay_pstn_call" | "relay_sip_call" | "relay_webrtc_call";

  @doc("The URL associated with this call.")
  @example(null)
  url: string | null;

  @doc("Total charge for this call.")
  @example(0)
  charge: float64;

  @doc("The date and time when the call was created.")
  @example(UTC_TIME_EXAMPLE)
  created_at: utcDateTime;

  @doc("The parent call ID if this is a child call.")
  @example(null)
  parent_id: string | null;

  @doc("Details on charges associated with this call.")
  charge_details: ChargeDetails[];
}

model ChargeDetails {
  @doc("Description for this charge.")
  @example("Text to Speach")
  description: string;

  @doc("Charged amount.")
  @example(0.121176)
  amount: float;
}
