import "@signalwire/typespec-asyncapi";
import "../../../common/frames.tsp";
import "@typespec/openapi";

import "./models/requests.tsp";
import "./models/responses.tsp";
import "../../events/hold.tsp";

using SignalWire.AsyncAPI;
using TypeSpec.OpenAPI;

namespace Relay.Calling;

const callingHold = "calling.hold";
const callingHoldResponse = "${callingHold} response";

model HoldRequest is JsonRpcRequest<typeof callingHold, HoldParams>;

@extension("x-fern-display-name", callingHoldResponse)
@reply model HoldReply is JsonRpcResponse<HoldResult>;

@doc("(Not implemented) Places a call on hold.")
@channel(callingHold)
@summary("(Not implemented) Put a call on hold")
@extension("x-fern-display-name", callingHold)
op hold(...HoldRequest): HoldReply | CallHoldEvent;

const callingUnhold = "calling.unhold";
const callingUnholdResponse = "${callingUnhold} response";

model UnholdRequest is JsonRpcRequest<typeof callingUnhold, UnholdParams>;

@extension("x-fern-display-name", callingUnholdResponse)
@reply model UnholdReply is JsonRpcResponse<UnholdResult>;

@doc("(Not implemented) Takes a call off hold and returns it to the active state.")
@channel(callingUnhold)
@summary("(Not implemented) Release a call from hold")
@extension("x-fern-display-name", callingUnhold)
op unhold(...UnholdRequest): UnholdReply | CallHoldEvent;
