import "@signalwire/typespec-asyncapi";
import "../../../models/core.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Fabric;

@doc("Parameters for `call.raisehand`.")
@summary("Raise hand parameters")
model RaisehandParams {
  @doc("The call leg you're operating from — your own leg on this call.")
  self: Target;

  @doc("The member to raise the hand of — required. Set `target` equal to `self` to raise your own hand, or to another member's `{node_id, call_id, member_id}` to raise theirs.")
  target: Target;
}

@doc("Parameters for `call.lowerhand`.")
@summary("Lower hand parameters")
model LowerhandParams {
  @doc("The call leg you're operating from — your own leg on this call.")
  self: Target;

  @doc("The member to lower the hand of — required. Set `target` equal to `self` to lower your own hand, or to another member's `{node_id, call_id, member_id}` to lower theirs.")
  target: Target;
}
