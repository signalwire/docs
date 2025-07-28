model Call {
  @doc("The unique identifier of the call on SignalWire. This can be used to update the call programmatically.")
  @example("3fa85f64-5717-4562-b3fc-2c963f66afa6")
  id: string;

  @doc("The origin number or address.")
  @example("sip:from-sip@example-112233445566.sip.signalwire.com")
  from: string;

  @doc("The destination number or address.")
  @example("sip:from-sip@example-112233445567.sip.signalwire.com")
  to: string;

  @doc("The direction of the call.")
  @example("outbound-api")
  direction: "outbound-api";

  @doc("The status of the call.")
  @example("queued")
  status: "answered" | "queued" | "initiated" | "ringing" | "ending" | "ended";

  @doc("The duration of the call in seconds.")
  @example(60)
  duration: integer;

  @doc("The duration of the call in milliseconds.")
  @example(60000)
  duration_ms: integer;

  @doc("The billable duration of the call in seconds.")
  @example(60)
  billable_duration: integer;

  @doc("Source of this call.")
  @example("realtime_api")
  source: "realtime_api";

  @doc("Type of this call.")
  @example("relay_sip_call")
  type: "relay_pstn_call" | "relay_sip_call" | "relay_webrtc_call";

  @doc("Details on charges associated with this call.")
  charge: ChargeDetails[];
}

model ChargeDetails {
  @doc("Description for this charge.")
  description: string;

  @doc("Charged amount.")
  amount: integer;
}
