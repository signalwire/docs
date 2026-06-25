import "@signalwire/typespec-asyncapi";

import "./models/requests.tsp";
import "./models/responses.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

@doc("Ends a call, whether it's already connected or still ringing.")
@channel("calling.end")
@summary("End a call")
@opExample(#{
  parameters: #{
    node_id: "a3b3e8e0-1234-4a4b-8c8d-000000000001",
    call_id: "b4c4f9f1-2345-4b5c-9d9e-000000000002",
    reason: "hangup",
  },
  returnType: #{ code: "200", message: "Ending call" },
})
op end(...EndParams): EndResult;
