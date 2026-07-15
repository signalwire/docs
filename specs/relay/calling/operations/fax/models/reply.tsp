import "@signalwire/typespec-asyncapi";

import "../../../models/core.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

@summary("Fax send accepted")
model SendFaxResult {
  ...RelayResult<"Sending fax">;
}

@summary("Fax send stopped")
model SendFaxStopResult {
  ...RelayResult<"Stopping fax">;
}

@summary("Fax receive accepted")
model ReceiveFaxResult {
  ...RelayResult<"Receiving fax">;
}

@summary("Fax receive stopped")
model ReceiveFaxStopResult {
  ...RelayResult<"Stopping fax">;
}
