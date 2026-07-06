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

@doc("Send a custom user-defined event.")
@channel(callingUserEvent)
@summary("Send a custom user-defined event")
@extension("x-fern-display-name", callingUserEvent)
@extension("x-fern-sdk-group-name", GroupEventsUserEvent)
op userEvent(...UserEventRequest): UserEventReply | CallUserEvent;
