import "@signalwire/typespec-asyncapi";

import "./models/requests.tsp";
import "./models/responses.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

model EndRequest is JsonRpcRequest<"calling.end", EndParams>;
@reply model EndReply is JsonRpcResponse<EndResult>;

@doc("Ends a call, whether it's already connected or still ringing.")
@channel("calling.end")
@summary("End a call")
op end(...EndRequest): EndReply;
