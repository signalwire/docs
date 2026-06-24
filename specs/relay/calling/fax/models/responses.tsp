import "@signalwire/typespec-asyncapi";

import "../../models/core.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

model SendFaxResult {
  ...RelayResult;

  /** Echo of the fax `control_id`. */
  control_id?: string;

  /** The call id. */
  call_id?: string;
}

model SendFaxStopResult {
  ...RelayResult;

  /** Echo of the fax `control_id`. */
  control_id?: string;

  /** The call id. */
  call_id?: string;
}

model ReceiveFaxResult {
  ...RelayResult;

  /** Echo of the fax `control_id`. */
  control_id?: string;

  /** The call id. */
  call_id?: string;
}

model ReceiveFaxStopResult {
  ...RelayResult;

  /** Echo of the fax `control_id`. */
  control_id?: string;

  /** The call id. */
  call_id?: string;
}
