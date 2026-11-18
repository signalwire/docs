import "@signalwire/typespec-asyncapi";

import "../../../models/core.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

@summary("Play result")
model PlayResult {
  ...RelayResult<"Playing">;
}

@summary("Play pause result")
model PlayPauseResult {
  ...RelayResult<"Paused play">;
}

@summary("Play resume result")
model PlayResumeResult {
  ...RelayResult<"Resumed play">;
}

@summary("Play stop result")
model PlayStopResult {
  ...RelayResult<"Stopping">;
}

@summary("Play volume result")
model PlayVolumeResult {
  ...RelayResult<"Changed play volume">;
}
