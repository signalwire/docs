import "@signalwire/typespec-asyncapi";
import "../../../common/frames.tsp";
import "@typespec/openapi";

import "./models/send.tsp";
import "./models/reply.tsp";
import "../collect/models/events.tsp";

using SignalWire.AsyncAPI;
using TypeSpec.OpenAPI;

namespace Relay.Calling;

const callingPlayAndCollect = "calling.play_and_collect";
const callingPlayAndCollectResponse = "${callingPlayAndCollect} response";

model PlayAndCollectRequest is JsonRpcRequest<typeof callingPlayAndCollect, PlayAndCollectParams>;
@extension("x-fern-display-name", callingPlayAndCollectResponse)
@reply model PlayAndCollectReply is JsonRpcResponse<PlayAndCollectResult>;

@doc("""
  Plays media to the caller and collects their input at the same time, so you
  can prompt and gather a response in one step. Collected input arrives
  asynchronously in `calling.call.collect` events keyed on your `control_id`.
  Only one play-and-collect can run on a call at a time.
  """)
// NOTE: no @opExample here — the required `play: PlayMedia[]` is a @discriminator
// union, and TypeSpec example values cannot narrow a discriminator base.
@channel(callingPlayAndCollect)
@summary("Play media and collect input")
@extension("x-fern-display-name", callingPlayAndCollect)
op playAndCollect(...PlayAndCollectRequest): PlayAndCollectReply | CallCollectEvent;

const callingPlayAndCollectStop = "calling.play_and_collect.stop";
const callingPlayAndCollectStopResponse = "${callingPlayAndCollectStop} response";

model PlayAndCollectStopRequest is JsonRpcRequest<typeof callingPlayAndCollectStop, PlayAndCollectStopParams>;
@extension("x-fern-display-name", callingPlayAndCollectStopResponse)
@reply model PlayAndCollectStopReply is JsonRpcResponse<PlayAndCollectStopResult>;

@doc("Stops a running play-and-collect, halting both the media playback and the input collection.")
@channel(callingPlayAndCollectStop)
@summary("Stop an active play-and-collect")
@extension("x-fern-display-name", callingPlayAndCollectStop)
op playAndCollectStop(...PlayAndCollectStopRequest): PlayAndCollectStopReply;

const callingPlayAndCollectVolume = "calling.play_and_collect.volume";
const callingPlayAndCollectVolumeResponse = "${callingPlayAndCollectVolume} response";

model PlayAndCollectVolumeRequest is JsonRpcRequest<typeof callingPlayAndCollectVolume, PlayAndCollectVolumeParams>;
@extension("x-fern-display-name", callingPlayAndCollectVolumeResponse)
@reply model PlayAndCollectVolumeReply is JsonRpcResponse<PlayAndCollectVolumeResult>;

@doc("Adjusts the playback volume of a running play-and-collect on the fly, without stopping it.")
@channel(callingPlayAndCollectVolume)
@summary("Change play-and-collect volume")
@extension("x-fern-display-name", callingPlayAndCollectVolume)
op playAndCollectVolume(...PlayAndCollectVolumeRequest): PlayAndCollectVolumeReply;
