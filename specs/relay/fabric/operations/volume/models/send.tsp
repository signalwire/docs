import "@signalwire/typespec-asyncapi";
import "../../../models/core.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Fabric;

@doc("Parameters for `call.microphone.volume.set`.")
@summary("Microphone volume parameters")
model MicrophoneVolumeSetParams {
  @doc("The call leg making the request — your own first leg on your call stack.")
  self: Target;

  @doc("The member whose microphone volume to set — required. Set `target` equal to `self` to act on yourself, or to another member's `{node_id, call_id, member_id}` to act on them.")
  target: Target;

  @doc("The microphone volume to set, in decibels, from -50 to 50.")
  @example(0)
  volume: int32;
}

@doc("Parameters for `call.microphone.sensitivity.set`.")
@summary("Microphone sensitivity parameters")
model MicrophoneSensitivitySetParams {
  @doc("The call leg making the request — your own first leg on your call stack.")
  self: Target;

  @doc("The member whose microphone sensitivity to set — required. Set `target` equal to `self` to act on yourself, or to another member's `{node_id, call_id, member_id}` to act on them.")
  target: Target;

  @doc("The microphone sensitivity to set.")
  @example(50)
  sensitivity: int32;
}

@doc("Parameters for `call.speaker.volume.set`.")
@summary("Speaker volume parameters")
model SpeakerVolumeSetParams {
  @doc("The call leg making the request — your own first leg on your call stack.")
  self: Target;

  @doc("The member whose speaker volume to set — required. Set `target` equal to `self` to act on yourself, or to another member's `{node_id, call_id, member_id}` to act on them.")
  target: Target;

  @doc("The speaker volume to set, in decibels, from -50 to 50.")
  @example(0)
  volume: int32;
}
