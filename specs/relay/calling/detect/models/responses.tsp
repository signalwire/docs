import "@signalwire/typespec-asyncapi";

import "../../models/core.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

model DetectResult {
  ...RelayResult;

  @doc("Echo of the detector `control_id`.")
  control_id?: string;

  @doc("The call id.")
  call_id?: string;
}

model DetectStopResult {
  ...RelayResult;

  @doc("Echo of the detector `control_id`.")
  control_id?: string;

  @doc("The call id.")
  call_id?: string;
}
