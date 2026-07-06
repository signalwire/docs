import "@signalwire/typespec-asyncapi";

import "../../../models/core.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

model JoinRoomParams {
  ...CallAddress;

  @doc("The name of the room to join.")
  @example("my_room")
  name: string;

  @doc("An `http` or `https` URL to receive room status updates, such as when the call joins or leaves.")
  @example("https://example.com/webhooks/relay")
  status_url?: url;
}

model LeaveRoomParams {
  ...CallAddress;
}
