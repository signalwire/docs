import "@signalwire/typespec-asyncapi";
import "../../../common/frames.tsp";
import "@typespec/openapi";

import "./models/send.tsp";
import "./models/reply.tsp";

using SignalWire.AsyncAPI;
using TypeSpec.OpenAPI;

namespace Relay.Calling;

const callingPass = "calling.pass";
const callingPassResponse = "${callingPass} response";

model PassRequest is JsonRpcRequest<typeof callingPass, PassParams>;

@extension("x-fern-display-name", callingPassResponse)
@reply model PassReply is JsonRpcResponse<PassResult>;

@doc("Declines an inbound call offer (a `calling.call.receive` event) without answering it, returning the call to routing so SignalWire can offer it to another consumer. Use it when your app gets a call it shouldn't handle and you want someone else to pick it up.")
@channel(callingPass)
@summary("Pass the call offer to another consumer")
@extension("x-fern-display-name", callingPass)
@extension("x-fern-sdk-group-name", GroupControlPass)
op pass(...PassRequest): PassReply;
