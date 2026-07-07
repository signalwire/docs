import "@signalwire/typespec-asyncapi";

import "../../../models/core.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

@summary("Denoise result")
model DenoiseResult {
  ...RelayResultWithCall<"Denoiser on">;
}

@summary("Denoise stop result")
model DenoiseStopResult {
  ...RelayResultWithCall<"Denoiser off">;
}
