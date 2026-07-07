import "@signalwire/typespec-asyncapi";
import "../../../common/frames.tsp";
import "@typespec/openapi";

import "./models/send.tsp";
import "./models/reply.tsp";
import "./models/events.tsp";

using SignalWire.AsyncAPI;
using TypeSpec.OpenAPI;

namespace Relay.Calling;

const callingUserEvent = "calling.user_event";
const callingUserEventResponse = "${callingUserEvent} response";

model UserEventRequest is JsonRpcRequest<typeof callingUserEvent, UserEventParams>;
@extension("x-fern-display-name", callingUserEventResponse)
@reply model UserEventReply is JsonRpcResponse<UserEventResult>;

@doc("Emits a custom, caller-defined event on this call. Anything you put in `event` is delivered back to your application, with the call address added.")
@channel(callingUserEvent)
@summary("Send a custom user-defined event")
@extension("x-fern-display-name", callingUserEvent)
op userEvent(...UserEventRequest): UserEventReply | CallUserEvent;
