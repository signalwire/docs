import "@signalwire/typespec-asyncapi";
import "../../../common/frames.tsp";
import "@typespec/openapi";

import "./models/send.tsp";

using SignalWire.AsyncAPI;
using TypeSpec.OpenAPI;

namespace Relay.Fabric;

const callMute = "call.mute";
const callMuteResponse = "${callMute} response";
model MuteRequest is JsonRpcRequest<typeof callMute, MuteParams>;
model MuteResult { ...FabricResult<"Muted">; }
@extension("x-fern-display-name", callMuteResponse)
@reply
model MuteReply is JsonRpcResponse<MuteResult>;

@doc("""
  Mutes a member's audio and/or video in a Call Fabric call. Target yourself by sending
  only `self`, or another member by also sending `target`. Choose the streams with
  `channels`. A `member.updated` event follows for the affected member.
  """)
@channel(callMute)
@summary("Mute a member's audio or video")
@extension("x-fern-display-name", callMute)
op mute(...MuteRequest): MuteReply;

const callUnmute = "call.unmute";
const callUnmuteResponse = "${callUnmute} response";
model UnmuteRequest is JsonRpcRequest<typeof callUnmute, UnmuteParams>;
model UnmuteResult { ...FabricResult<"Unmuted">; }
@extension("x-fern-display-name", callUnmuteResponse)
@reply
model UnmuteReply is JsonRpcResponse<UnmuteResult>;

@doc("""
  Unmutes a member's audio and/or video, reversing `call.mute`. Target yourself with
  `self` or another member with `target`, and choose the streams with `channels`.
  """)
@channel(callUnmute)
@summary("Unmute a member's audio or video")
@extension("x-fern-display-name", callUnmute)
op unmute(...UnmuteRequest): UnmuteReply;

const callDeaf = "call.deaf";
const callDeafResponse = "${callDeaf} response";
model DeafRequest is JsonRpcRequest<typeof callDeaf, DeafParams>;
model DeafResult { ...FabricResult<"Deafened">; }
@extension("x-fern-display-name", callDeafResponse)
@reply
model DeafReply is JsonRpcResponse<DeafResult>;

@doc("""
  Stops a member from hearing the call's audio (deafen). Target yourself with `self` or
  another member with `target`. A `member.updated` event follows for the affected member.
  """)
@channel(callDeaf)
@summary("Stop a member from hearing audio")
@extension("x-fern-display-name", callDeaf)
op deaf(...DeafRequest): DeafReply;

const callUndeaf = "call.undeaf";
const callUndeafResponse = "${callUndeaf} response";
model UndeafRequest is JsonRpcRequest<typeof callUndeaf, UndeafParams>;
model UndeafResult { ...FabricResult<"Undeafened">; }
@extension("x-fern-display-name", callUndeafResponse)
@reply
model UndeafReply is JsonRpcResponse<UndeafResult>;

@doc("Restores a member's ability to hear the call's audio, reversing `call.deaf`. Target yourself with `self` or another member with `target`.")
@channel(callUndeaf)
@summary("Restore a member's ability to hear audio")
@extension("x-fern-display-name", callUndeaf)
op undeaf(...UndeafRequest): UndeafReply;
