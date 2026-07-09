import "@signalwire/typespec-asyncapi";
import "../../../models/core.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Fabric;

@doc("Parameters for `call.end`.")
@summary("End parameters")
model EndParams {
  @doc("The call leg making the request — your own first leg on your call stack.")
  self: Target;

  @doc("The call leg to end. Omit to end your own (`self`); set it to end another member's leg.")
  target?: Target;
}

@doc("Parameters for `call.hangup`.")
@summary("Hangup parameters")
model HangupParams {
  @doc("The call leg to hang up — your own first leg on your call stack.")
  self: Target;
}
