import "@signalwire/typespec-asyncapi";
import "../../../models/core.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Fabric;

@doc("Parameters for `call.mute`.")
@summary("Mute parameters")
model MuteParams {
  @doc("The call leg you're operating from — your own leg on this call.")
  self: Target;

  @doc("The member to mute — required. Set `target` equal to `self` to mute yourself, or to another member's `{node_id, call_id, member_id}` to mute them.")
  target: Target;

  @doc("Which media channels to mute: `audio`, `video`, or both.")
  @example(#["audio"])
  channels: ("audio" | "video")[];
}

@doc("Parameters for `call.unmute`.")
@summary("Unmute parameters")
model UnmuteParams {
  @doc("The call leg you're operating from — your own leg on this call.")
  self: Target;

  @doc("The member to unmute — required. Set `target` equal to `self` to unmute yourself, or to another member's `{node_id, call_id, member_id}` to unmute them.")
  target: Target;

  @doc("Which media channels to unmute: `audio`, `video`, or both.")
  @example(#["audio"])
  channels: ("audio" | "video")[];
}

@doc("Parameters for `call.deaf`.")
@summary("Deaf parameters")
model DeafParams {
  @doc("The call leg you're operating from — your own leg on this call.")
  self: Target;

  @doc("The member to deafen — required. Set `target` equal to `self` to deafen yourself, or to another member's `{node_id, call_id, member_id}` to deafen them.")
  target: Target;
}

@doc("Parameters for `call.undeaf`.")
@summary("Undeaf parameters")
model UndeafParams {
  @doc("The call leg you're operating from — your own leg on this call.")
  self: Target;

  @doc("The member to undeafen — required. Set `target` equal to `self` to undeafen yourself, or to another member's `{node_id, call_id, member_id}` to undeafen them.")
  target: Target;
}
