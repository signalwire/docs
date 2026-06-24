import "@signalwire/typespec-asyncapi";

import "../../models/core.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

model TransferResult {
  ...RelayResult;

  /** The id of the call that was transferred, echoed back from your request. */
  call_id?: string;
}
