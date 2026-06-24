import "@signalwire/typespec-asyncapi";

import "../models/core.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

// ─────────────────────────────────────────────────────────────────────────────
// calling.call.refer
// ─────────────────────────────────────────────────────────────────────────────

@doc("How a transfer (SIP REFER) is progressing.")
union ReferState {
  "inProgress",
  "cancel",
  "busy",
  "noAnswer",
  "error",
  "success",
}

model CallReferParams {
  ...CallAddress;

  @doc("Where the transfer currently stands.")
  state: ReferState;

  @doc("The SIP URI the call is being transferred to.")
  sip_refer_to?: string;

  @doc("The SIP response code the far end returned to the REFER request, as a string (for example `\"202\"`).")
  sip_refer_response_code?: string;

  @doc("""
    The SIP response code from the NOTIFY messages that follow the REFER, as a
    string (for example `"200"`). This tells you whether the transfer ultimately
    succeeded.
    """)
  sip_notify_response_code?: string;
}

@doc("Fires each time a transferred call (SIP REFER) changes state, so you can follow the handoff from start to success or failure.")
@event("calling.call.refer")
@example(#{
  node_id: "a3e1b2c4-1234-5678-9abc-def012345678",
  call_id: "c7f9d2e1-8765-4321-0fed-cba987654321",
  state: "success",
  sip_refer_to: "sip:agent@example.com",
  sip_refer_response_code: "202",
  sip_notify_response_code: "200",
})
model CallReferEvent {
  ...CallReferParams;
}
