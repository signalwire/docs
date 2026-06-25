import "@signalwire/typespec-asyncapi";

import "./models/requests.tsp";
import "./models/responses.tsp";
import "../../events/hold.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

@doc("(Not implemented) Places a call on hold.")
@channel("calling.hold")
@summary("(Not implemented) Put a call on hold")
@opExample(#{
  parameters: #{ node_id: "a3e1b2c4-...", call_id: "c7f9d2e1-..." },
  returnType: #{ code: "200", message: "Call on hold", state: "hold" },
})
op hold(...HoldParams): HoldResult | CallHoldEvent;

@doc("(Not implemented) Takes a call off hold and returns it to the active state.")
@channel("calling.unhold")
@summary("(Not implemented) Release a call from hold")
@opExample(#{
  parameters: #{ node_id: "a3e1b2c4-...", call_id: "c7f9d2e1-..." },
  returnType: #{ code: "200", message: "Call off hold", state: "unhold" },
})
op unhold(...UnholdParams): UnholdResult | CallHoldEvent;
