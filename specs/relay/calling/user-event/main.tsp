import "@signalwire/typespec-asyncapi";

import "./models/requests.tsp";
import "./models/responses.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

@doc("Send a custom user-defined event.")
@channel("calling.user_event")
@summary("Send a custom user-defined event")
@opExample(#{
  parameters: #{
    node_id: "a3e1b2c4-...",
    call_id: "c7f9d2e1-...",
    event: "custom_event_name",
  },
  returnType: #{ code: "200", message: "Event sent" },
})
op userEvent(...UserEventParams): UserEventResult;
