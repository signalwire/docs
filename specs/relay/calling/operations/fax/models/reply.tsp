import "@signalwire/typespec-asyncapi";

import "../../../models/core.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

model SendFaxResult {
  ...RelayResult;
}

model SendFaxStopResult {
  ...RelayResult;
}

model ReceiveFaxResult {
  ...RelayResult;
}

model ReceiveFaxStopResult {
  ...RelayResult;
}
