import "@signalwire/typespec-asyncapi";

import "../../../models/core.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

model JoinRoomResult {
  ...RelayResult<"Joining room">;
}

model LeaveRoomResult {
  ...RelayResult<"Leaving room">;
}
