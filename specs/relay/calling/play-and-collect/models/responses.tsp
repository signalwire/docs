import "@signalwire/typespec-asyncapi";

import "../../models/core.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

model PlayAndCollectResult {
  ...RelayResult;

  /** Echoes back the `control_id` you supplied so you can correlate the response. */
  control_id?: string;
}

model PlayAndCollectStopResult {
  ...RelayResult;
}

model PlayAndCollectVolumeResult {
  ...RelayResult;
}
