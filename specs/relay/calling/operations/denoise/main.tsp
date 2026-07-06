import "@signalwire/typespec-asyncapi";
import "../../../common/frames.tsp";
import "@typespec/openapi";

import "./models/send.tsp";
import "./models/reply.tsp";
import "./models/events.tsp";

using SignalWire.AsyncAPI;
using TypeSpec.OpenAPI;

namespace Relay.Calling;

const callingDenoise = "calling.denoise";
const callingDenoiseResponse = "${callingDenoise} response";

model DenoiseRequest is JsonRpcRequest<typeof callingDenoise, DenoiseParams>;

@extension("x-fern-display-name", callingDenoiseResponse)
@reply model DenoiseReply is JsonRpcResponse<DenoiseResult>;

@doc("Starts noise reduction on a call, filtering background noise out of the audio. Use this on noisy connections to improve clarity. Stop it later with `calling.denoise.stop`. Returns a `409` conflict if the call is already being denoised.")
@channel(callingDenoise)
@summary("Start call noise reduction")
@extension("x-fern-display-name", callingDenoise)
@extension("x-fern-sdk-group-name", GroupAudioDenoise)
op denoise(...DenoiseRequest): DenoiseReply | CallDenoiseEvent;

const callingDenoiseStop = "calling.denoise.stop";
const callingDenoiseStopResponse = "${callingDenoiseStop} response";

model DenoiseStopRequest is JsonRpcRequest<typeof callingDenoiseStop, DenoiseStopParams>;

@extension("x-fern-display-name", callingDenoiseStopResponse)
@reply model DenoiseStopReply is JsonRpcResponse<DenoiseStopResult>;

@doc("Stops noise reduction previously started with `calling.denoise` on a call. Returns a `409` conflict if the call is not currently denoised.")
@channel(callingDenoiseStop)
@summary("Stop call noise reduction")
@extension("x-fern-display-name", callingDenoiseStop)
@extension("x-fern-sdk-group-name", GroupAudioDenoiseStop)
op denoiseStop(...DenoiseStopRequest): DenoiseStopReply;
