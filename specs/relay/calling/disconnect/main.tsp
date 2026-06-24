import "@signalwire/typespec-asyncapi";

import "./models/requests.tsp";
import "./models/responses.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

/**
 * Splits apart legs that were joined with `calling.connect`, separating the calls
 * without hanging up on either one. Each call stays live so you can keep
 * controlling it or connect it elsewhere.
 */
@channel("calling.disconnect")
@summary("Disconnect connected legs without hanging up")
@opExample(#{
  parameters: #{
    node_id: "a3b3e8e0-1234-4a4b-8c8d-000000000001",
    call_id: "b4c4f9f1-2345-4b5c-9d9e-000000000002",
  },
  returnType: #{ code: "200", message: "Disconnecting" },
})
op disconnect(...DisconnectParams): DisconnectResult;
