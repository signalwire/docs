import "@signalwire/typespec-asyncapi";

import "./models/requests.tsp";
import "./models/responses.tsp";
import "../../events/hold.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

model HoldRequest is JsonRpcRequest<"calling.hold", HoldParams>;
@reply model HoldReply is JsonRpcResponse<HoldResult>;

@doc("(Not implemented) Places a call on hold.")
@channel("calling.hold")
@summary("(Not implemented) Put a call on hold")
op hold(...HoldRequest): HoldReply | CallHoldEvent;

model UnholdRequest is JsonRpcRequest<"calling.unhold", UnholdParams>;
@reply model UnholdReply is JsonRpcResponse<UnholdResult>;

@doc("(Not implemented) Takes a call off hold and returns it to the active state.")
@channel("calling.unhold")
@summary("(Not implemented) Release a call from hold")
op unhold(...UnholdRequest): UnholdReply | CallHoldEvent;
