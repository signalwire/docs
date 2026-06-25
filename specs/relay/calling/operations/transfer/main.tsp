import "@signalwire/typespec-asyncapi";

import "./models/requests.tsp";
import "./models/responses.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

@doc("Hands off control of an active call to another RELAY application or to a SWML script. Use this to move a call to a different flow, for example to route it to an IVR, queue, or a fresh script. Once transferred, the original application no longer controls the call.")
@channel("calling.transfer")
@summary("Transfer a call to a RELAY app or SWML script")
@opExample(#{
  parameters: #{
    node_id: "a3e1b2c4-...",
    call_id: "c7f9d2e1-...",
    dest: "https://example.com/swml",
  },
  returnType: #{ code: "200", message: "Transferring", call_id: "c7f9d2e1-..." },
})
op transfer(...TransferParams): TransferResult;
