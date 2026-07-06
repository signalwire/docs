import "@signalwire/typespec-asyncapi";

import "../../../models/core.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

model SendFaxResult {
  ...RelayResult<"Sending Fax">;
}

model SendFaxStopResult {
  ...RelayResult<"Stopping fax">;
}

model ReceiveFaxResult {
  ...RelayResult<"Receiving Fax">;
}

model ReceiveFaxStopResult {
  ...RelayResult<"Stopping fax">;
}
