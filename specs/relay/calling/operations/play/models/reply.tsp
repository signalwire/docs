import "@signalwire/typespec-asyncapi";

import "../../../models/core.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

model PlayResult {
  ...RelayResult<"Playing">;
}

model PlayPauseResult {
  ...RelayResult<"Paused play">;
}

model PlayResumeResult {
  ...RelayResult<"Resumed play">;
}

model PlayStopResult {
  ...RelayResult<"Stopping">;
}

model PlayVolumeResult {
  ...RelayResult<"Changed play volume">;
}
