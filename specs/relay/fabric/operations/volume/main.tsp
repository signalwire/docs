import "@signalwire/typespec-asyncapi";
import "../../../common/frames.tsp";
import "@typespec/openapi";

import "./models/send.tsp";

using SignalWire.AsyncAPI;
using TypeSpec.OpenAPI;

namespace Relay.Fabric;

const callMicrophoneVolumeSet = "call.microphone.volume.set";
const callMicrophoneVolumeSetResponse = "${callMicrophoneVolumeSet} response";
model MicrophoneVolumeSetRequest
  is JsonRpcRequest<typeof callMicrophoneVolumeSet, MicrophoneVolumeSetParams>;
model MicrophoneVolumeSetResult { ...FabricResult<"Microphone volume set">; }
@extension("x-fern-display-name", callMicrophoneVolumeSetResponse)
@reply
model MicrophoneVolumeSetReply is JsonRpcResponse<MicrophoneVolumeSetResult>;

@doc("Sets a member's microphone (input) volume. Target yourself with `self` or another member with `target`. A `member.updated` event follows.")
@channel(callMicrophoneVolumeSet)
@summary("Set a member's microphone volume")
@extension("x-fern-display-name", callMicrophoneVolumeSet)
op microphoneVolumeSet(...MicrophoneVolumeSetRequest): MicrophoneVolumeSetReply;

const callMicrophoneSensitivitySet = "call.microphone.sensitivity.set";
const callMicrophoneSensitivitySetResponse = "${callMicrophoneSensitivitySet} response";
model MicrophoneSensitivitySetRequest
  is JsonRpcRequest<
    typeof callMicrophoneSensitivitySet,
    MicrophoneSensitivitySetParams
  >;
model MicrophoneSensitivitySetResult { ...FabricResult<"Microphone sensitivity set">; }
@extension("x-fern-display-name", callMicrophoneSensitivitySetResponse)
@reply
model MicrophoneSensitivitySetReply is JsonRpcResponse<MicrophoneSensitivitySetResult>;

@doc("Sets a member's microphone sensitivity. Target yourself with `self` or another member with `target`. A `member.updated` event follows.")
@channel(callMicrophoneSensitivitySet)
@summary("Set a member's microphone sensitivity")
@extension("x-fern-display-name", callMicrophoneSensitivitySet)
op microphoneSensitivitySet(
  ...MicrophoneSensitivitySetRequest,
): MicrophoneSensitivitySetReply;

const callSpeakerVolumeSet = "call.speaker.volume.set";
const callSpeakerVolumeSetResponse = "${callSpeakerVolumeSet} response";
model SpeakerVolumeSetRequest
  is JsonRpcRequest<typeof callSpeakerVolumeSet, SpeakerVolumeSetParams>;
model SpeakerVolumeSetResult { ...FabricResult<"Speaker volume set">; }
@extension("x-fern-display-name", callSpeakerVolumeSetResponse)
@reply
model SpeakerVolumeSetReply is JsonRpcResponse<SpeakerVolumeSetResult>;

@doc("Sets a member's speaker (output) volume. Target yourself with `self` or another member with `target`. A `member.updated` event follows.")
@channel(callSpeakerVolumeSet)
@summary("Set a member's speaker volume")
@extension("x-fern-display-name", callSpeakerVolumeSet)
op speakerVolumeSet(...SpeakerVolumeSetRequest): SpeakerVolumeSetReply;
