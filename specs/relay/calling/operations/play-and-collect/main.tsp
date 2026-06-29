import "@signalwire/typespec-asyncapi";

import "./models/requests.tsp";
import "./models/responses.tsp";
import "../../events/collect.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

model PlayAndCollectRequest is JsonRpcRequest<"calling.play_and_collect", PlayAndCollectParams>;
@reply model PlayAndCollectReply is JsonRpcResponse<PlayAndCollectResult>;

@doc("""
  Plays media to the caller and collects their input at the same time, so you
  can prompt and gather a response in one step. Collected input arrives
  asynchronously in `calling.call.collect` events keyed on your `control_id`.
  Only one play-and-collect can run on a call at a time.
  """)
// NOTE: no @opExample here — the required `play: PlayMedia[]` is a @discriminator
// union, and TypeSpec example values cannot narrow a discriminator base.
@channel("calling.play_and_collect")
@summary("Play media and collect input")
op playAndCollect(...PlayAndCollectRequest): PlayAndCollectReply | CallCollectEvent;

model PlayAndCollectStopRequest is JsonRpcRequest<"calling.play_and_collect.stop", PlayAndCollectStopParams>;
@reply model PlayAndCollectStopReply is JsonRpcResponse<PlayAndCollectStopResult>;

@doc("Stops a running play-and-collect, halting both the media playback and the input collection.")
@channel("calling.play_and_collect.stop")
@summary("Stop an active play-and-collect")
op playAndCollectStop(...PlayAndCollectStopRequest): PlayAndCollectStopReply;

model PlayAndCollectVolumeRequest is JsonRpcRequest<"calling.play_and_collect.volume", PlayAndCollectVolumeParams>;
@reply model PlayAndCollectVolumeReply is JsonRpcResponse<PlayAndCollectVolumeResult>;

@doc("Adjusts the playback volume of a running play-and-collect on the fly, without stopping it.")
@channel("calling.play_and_collect.volume")
@summary("Change play-and-collect volume")
op playAndCollectVolume(...PlayAndCollectVolumeRequest): PlayAndCollectVolumeReply;
