import "@signalwire/typespec-asyncapi";

import "../../../models/core.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

model PlayAndCollectResult {
  ...RelayResult<"Playing and collecting">;
}

model PlayAndCollectStopResult {
  ...RelayResult<"Stopping">;
}

model PlayAndCollectVolumeResult {
  ...RelayResult<"Changed play and collect volume">;
}
