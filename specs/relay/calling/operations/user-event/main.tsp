import "@signalwire/typespec-asyncapi";

import "./models/requests.tsp";
import "./models/responses.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

model UserEventRequest is JsonRpcRequest<"calling.user_event", UserEventParams>;
@reply model UserEventReply is JsonRpcResponse<UserEventResult>;

@doc("Send a custom user-defined event.")
@channel("calling.user_event")
@summary("Send a custom user-defined event")
op userEvent(...UserEventRequest): UserEventReply;
