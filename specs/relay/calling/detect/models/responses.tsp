import "@signalwire/typespec-asyncapi";

import "../../models/core.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

model DetectResult {
  ...RelayResult;

  /** Echo of the detector `control_id`. */
  control_id?: string;

  /** The call id. */
  call_id?: string;
}

model DetectStopResult {
  ...RelayResult;

  /** Echo of the detector `control_id`. */
  control_id?: string;

  /** The call id. */
  call_id?: string;
}
