import "@signalwire/typespec-asyncapi";
import "../../../models/core.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Fabric;

@doc("Parameters for `call.mute`.")
@summary("Mute parameters")
model MuteParams {
  @doc("The call leg making the request — your own first leg on your call stack.")
  self: Target;

  @doc("The member to mute. Omit to mute yourself (`self`); set it to mute another member.")
  target?: Target;

  @doc("Which media channels to mute: `audio`, `video`, or both.")
  @example(#["audio"])
  channels: string[];
}

@doc("Parameters for `call.unmute`.")
@summary("Unmute parameters")
model UnmuteParams {
  @doc("The call leg making the request — your own first leg on your call stack.")
  self: Target;

  @doc("The member to unmute. Omit to unmute yourself (`self`); set it to unmute another member.")
  target?: Target;

  @doc("Which media channels to unmute: `audio`, `video`, or both.")
  @example(#["audio"])
  channels: string[];
}

@doc("Parameters for `call.deaf`.")
@summary("Deaf parameters")
model DeafParams {
  @doc("The call leg making the request — your own first leg on your call stack.")
  self: Target;

  @doc("The member to stop audio for. Omit to act on yourself (`self`); set it to deafen another member.")
  target?: Target;
}

@doc("Parameters for `call.undeaf`.")
@summary("Undeaf parameters")
model UndeafParams {
  @doc("The call leg making the request — your own first leg on your call stack.")
  self: Target;

  @doc("The member to resume audio for. Omit to act on yourself (`self`); set it to undeafen another member.")
  target?: Target;
}
