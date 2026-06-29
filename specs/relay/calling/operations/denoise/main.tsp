import "@signalwire/typespec-asyncapi";

import "./models/requests.tsp";
import "./models/responses.tsp";
import "../../events/denoise.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

model DenoiseRequest is JsonRpcRequest<"calling.denoise", DenoiseParams>;
@reply model DenoiseReply is JsonRpcResponse<DenoiseResult>;

@doc("Starts noise reduction on a call, filtering background noise out of the audio. Use this on noisy connections to improve clarity. Stop it later with `calling.denoise.stop`.")
@channel("calling.denoise")
@summary("Start call noise reduction")
op denoise(...DenoiseRequest): DenoiseReply | CallDenoiseEvent;

model DenoiseStopRequest is JsonRpcRequest<"calling.denoise.stop", DenoiseStopParams>;
@reply model DenoiseStopReply is JsonRpcResponse<DenoiseStopResult>;

@doc("Stops noise reduction previously started with `calling.denoise` on a call.")
@channel("calling.denoise.stop")
@summary("Stop call noise reduction")
op denoiseStop(...DenoiseStopRequest): DenoiseStopReply;
