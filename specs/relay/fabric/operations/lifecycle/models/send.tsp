import "@signalwire/typespec-asyncapi";
import "../../../models/core.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Fabric;

@doc("Parameters for `call.end`.")
@summary("End parameters")
model EndParams {
  @doc("The call leg you're operating from — your own leg on this call.")
  self: Target;

  @doc("A leg on the call to end — required. On a 1:1 call this leg is hung up; in a conference, naming any member's leg ends the conference for every member. Set `target` equal to `self` to name your own leg.")
  target: Target;
}

@doc("Parameters for `call.hangup`.")
@summary("Hangup parameters")
model HangupParams {
  @doc("The call leg to hang up — your own leg on this call.")
  self: Target;
}
