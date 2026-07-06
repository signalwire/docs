import "@signalwire/typespec-asyncapi";

import "../../../models/core.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

model DenoiseResult {
  ...RelayResultWithCall<"Denoiser on">;
}

model DenoiseStopResult {
  ...RelayResultWithCall<"Denoiser off">;
}
