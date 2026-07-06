import "@signalwire/typespec-asyncapi";

import "../../../models/core.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

model UserEventParams {
  ...CallAddress;

  @doc("""
    Your custom event payload, as a JSON object. The object you pass here is
    delivered to your application as the `calling.user_event` event, with the call
    address added. Conventionally includes a `topic` naming the event, plus any
    fields you choose. Required — the request fails without it.
    """)
  event: Record<unknown>;
}
