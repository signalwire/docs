import "@signalwire/typespec-asyncapi";

import "../../../models/core.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

@summary("Play and collect result")
model PlayAndCollectResult {
  ...RelayResult<"Playing and collecting">;
}

@summary("Play and collect stop result")
model PlayAndCollectStopResult {
  ...RelayResult<"Stopping">;
}

@summary("Play and collect volume result")
model PlayAndCollectVolumeResult {
  ...RelayResult<"Changed play and collect volume">;
}
