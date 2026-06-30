import "@signalwire/typespec-asyncapi";

import "../../../models/core.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

model PlayAndCollectResult {
  ...RelayResult;
}

model PlayAndCollectStopResult {
  ...RelayResult;
}

model PlayAndCollectVolumeResult {
  ...RelayResult;
}
