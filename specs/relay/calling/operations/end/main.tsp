import "@signalwire/typespec-asyncapi";
import "../../../common/frames.tsp";
import "@typespec/openapi";

import "./models/send.tsp";
import "./models/reply.tsp";

using SignalWire.AsyncAPI;
using TypeSpec.OpenAPI;

namespace Relay.Calling;

const callingEnd = "calling.end";
const callingEndResponse = "${callingEnd} response";

model EndRequest is JsonRpcRequest<typeof callingEnd, EndParams>;

@extension("x-fern-display-name", callingEndResponse)
@reply model EndReply is JsonRpcResponse<EndResult>;

@doc("Ends a call, whether it's already connected or still ringing.")
@channel(callingEnd)
@summary("End a call")
@extension("x-fern-display-name", callingEnd)
op end(...EndRequest): EndReply;
