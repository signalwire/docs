import "@signalwire/typespec-asyncapi";

import "./models/requests.tsp";
import "./models/responses.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

/** Declines an inbound call offer (a `calling.call.receive` event) without answering it, returning the call to routing so SignalWire can offer it to another consumer. Use it when your app gets a call it shouldn't handle and you want someone else to pick it up. */
@channel("calling.pass")
@summary("Pass the call offer to another consumer")
@opExample(#{
  parameters: #{
    node_id: "a3b3e8e0-1234-4a4b-8c8d-000000000001",
    call_id: "b4c4f9f1-2345-4b5c-9d9e-000000000002",
  },
  returnType: #{ code: "200", message: "Passing call to another consumer" },
})
op pass(...PassParams): PassResult;
