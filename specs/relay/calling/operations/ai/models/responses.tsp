import "@signalwire/typespec-asyncapi";

import "../../../models/core.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

model AiResult {
  ...RelayResult;

  @doc("Echo of the call id.")
  call_id?: string;

  @doc("Echo of the control id for this AI session.")
  control_id?: string;
}

model AiStopResult {
  ...RelayResult;

  @doc("Echo of the call id.")
  call_id?: string;

  @doc("Echo of the control id.")
  control_id?: string;
}
