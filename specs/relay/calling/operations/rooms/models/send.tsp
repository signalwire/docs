import "@signalwire/typespec-asyncapi";

import "../../../models/core.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

model JoinRoomParams {
  ...CallAddress;

  @doc("The name of the room to join.")
  @example("my_room")
  name: string;

  @doc("An `http` or `https` URL. Accepted but currently ignored: no room status updates are sent to it. Use `calling.call.room` events to follow the call's room membership.")
  @example("https://example.com/webhooks/relay")
  status_url?: url;
}

model LeaveRoomParams {
  ...CallAddress;
}
