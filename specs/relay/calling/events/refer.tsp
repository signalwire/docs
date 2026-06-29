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
@summary("calling.call.refer")
model CallReferEvent is SignalwireEvent<"calling.call.refer", CallReferParams>;
