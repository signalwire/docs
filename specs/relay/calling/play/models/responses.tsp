import "@signalwire/typespec-asyncapi";

import "../../models/core.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

model PlayResult {
  ...RelayResult;

  @doc("Echo of the `control_id` from the request.")
  control_id?: string;
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
