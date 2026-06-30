import "@signalwire/typespec-asyncapi";
import "../../../common/frames.tsp";
import "@typespec/openapi";

import "./models/requests.tsp";
import "./models/responses.tsp";
import "../../events/denoise.tsp";

using SignalWire.AsyncAPI;
using TypeSpec.OpenAPI;

namespace Relay.Calling;

const callingDenoise = "calling.denoise";
const callingDenoiseResponse = "${callingDenoise} response";

model DenoiseRequest is JsonRpcRequest<typeof callingDenoise, DenoiseParams>;

@extension("x-fern-display-name", callingDenoiseResponse)
@reply model DenoiseReply is JsonRpcResponse<DenoiseResult>;

@doc("Starts noise reduction on a call, filtering background noise out of the audio. Use this on noisy connections to improve clarity. Stop it later with `calling.denoise.stop`.")
@channel(callingDenoise)
@summary("Start call noise reduction")
@extension("x-fern-display-name", callingDenoise)
op denoise(...DenoiseRequest): DenoiseReply | CallDenoiseEvent;

const callingDenoiseStop = "calling.denoise.stop";
const callingDenoiseStopResponse = "${callingDenoiseStop} response";

model DenoiseStopRequest is JsonRpcRequest<typeof callingDenoiseStop, DenoiseStopParams>;

@extension("x-fern-display-name", callingDenoiseStopResponse)
@reply model DenoiseStopReply is JsonRpcResponse<DenoiseStopResult>;

@doc("Stops noise reduction previously started with `calling.denoise` on a call.")
@channel(callingDenoiseStop)
@summary("Stop call noise reduction")
@extension("x-fern-display-name", callingDenoiseStop)
op denoiseStop(...DenoiseStopRequest): DenoiseStopReply;
