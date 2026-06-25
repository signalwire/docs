import "@signalwire/typespec-asyncapi";

import "../../../models/core.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

model PlayResult {
  ...RelayResult;
}

model PlayPauseResult {
  ...RelayResult;
}

model PlayResumeResult {
  ...RelayResult;
}

model PlayStopResult {
  ...RelayResult;
}

model PlayVolumeResult {
  ...RelayResult;
}
