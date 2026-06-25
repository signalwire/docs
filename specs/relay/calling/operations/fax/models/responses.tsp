import "@signalwire/typespec-asyncapi";

import "../../../models/core.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

model SendFaxResult {
  ...RelayResult;

  @doc("Echo of the fax `control_id`.")
  control_id?: string;

  @doc("The call id.")
  call_id?: string;
}

model SendFaxStopResult {
  ...RelayResult;

  @doc("Echo of the fax `control_id`.")
  control_id?: string;

  @doc("The call id.")
  call_id?: string;
}

model ReceiveFaxResult {
  ...RelayResult;

  @doc("Echo of the fax `control_id`.")
  control_id?: string;

  @doc("The call id.")
  call_id?: string;
}

model ReceiveFaxStopResult {
  ...RelayResult;

  @doc("Echo of the fax `control_id`.")
  control_id?: string;

  @doc("The call id.")
  call_id?: string;
}
