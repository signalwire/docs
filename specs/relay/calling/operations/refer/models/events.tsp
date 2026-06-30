import "@signalwire/typespec-asyncapi";
import "../../../../common/frames.tsp";
import "@typespec/openapi";

import "../../../models/core.tsp";

using TypeSpec.OpenAPI;

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

const callingCallRefer = "calling.call.refer";
@doc("Fires each time a transferred call (SIP REFER) changes state, so you can follow the handoff from start to success or failure.")
@summary(callingCallRefer)
@extension("x-fern-display-name", callingCallRefer)
model CallReferEvent is SignalwireEvent<typeof callingCallRefer, CallReferParams>;
