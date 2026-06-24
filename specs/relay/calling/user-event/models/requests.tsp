import "@signalwire/typespec-asyncapi";

import "../../models/core.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

model UserEventParams {
  ...CallAddress;

  /** A name you choose for the event. Your application receives it as a
  `calling.user_event` event. */
  event?: string;
}
