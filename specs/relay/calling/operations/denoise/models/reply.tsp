import "@signalwire/typespec-asyncapi";

import "../../../models/core.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

model DenoiseResult {
  ...RelayResult<"Denoiser on">;
}

model DenoiseStopResult {
  ...RelayResult<"Denoiser off">;
}
