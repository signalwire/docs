import "@signalwire/typespec-asyncapi";

import "../../../models/core.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

@summary("Room joined")
model JoinRoomResult {
  ...RelayResultWithCall<"Joining room">;
}

@summary("Room left")
model LeaveRoomResult {
  ...RelayResultWithCall<"Leaving room">;
}
