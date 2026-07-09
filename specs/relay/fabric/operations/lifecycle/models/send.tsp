import "@signalwire/typespec-asyncapi";
import "../../../models/core.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Fabric;

@doc("Parameters for `call.end`.")
@summary("End parameters")
model EndParams {
  @doc("The call leg making the request — your own first leg on your call stack.")
  self: Target;

  @doc("The call leg to end — required. `call.end` must be processed on an explicitly-named target and cannot end an un-targeted leg: set `target` equal to `self` to end your own leg, or to another member's `{node_id, call_id, member_id}` to end theirs.")
  target: Target;
}

@doc("Parameters for `call.hangup`.")
@summary("Hangup parameters")
model HangupParams {
  @doc("The call leg to hang up — your own first leg on your call stack.")
  self: Target;
}
