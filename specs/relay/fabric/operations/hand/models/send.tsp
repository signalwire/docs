import "@signalwire/typespec-asyncapi";
import "../../../models/core.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Fabric;

@doc("Parameters for `call.raisehand`.")
@summary("Raise hand parameters")
model RaisehandParams {
  @doc("The call leg you're operating from — your own leg on this call.")
  self: Target;

  @doc("The member whose hand to raise — required. Set `target` equal to `self`; targeting another member returns code `\"403\"`.")
  target: Target;
}

@doc("Parameters for `call.lowerhand`.")
@summary("Lower hand parameters")
model LowerhandParams {
  @doc("The call leg you're operating from — your own leg on this call.")
  self: Target;

  @doc("The member whose hand to lower — required. Set `target` equal to `self`; targeting another member returns code `\"403\"`.")
  target: Target;
}
