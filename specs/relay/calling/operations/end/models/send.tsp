import "@signalwire/typespec-asyncapi";

import "../../../models/core.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

@summary("End parameters")
model EndParams {
  ...CallAddress;

  @doc("Why the call is ending. Defaults to `hangup`. Only matters for an inbound call you have not answered: `hangup` and `busy` reject it as busy, and the other reasons decline it. An answered call always ends normally, and an unanswered outbound call is always canceled.")
  @example("hangup")
  reason?: CallEndReason = "hangup";
}
