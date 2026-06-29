import "@signalwire/typespec-asyncapi";

import "./models/requests.tsp";
import "./models/responses.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

model PassRequest is JsonRpcRequest<"calling.pass", PassParams>;
@reply model PassReply is JsonRpcResponse<PassResult>;

@doc("Declines an inbound call offer (a `calling.call.receive` event) without answering it, returning the call to routing so SignalWire can offer it to another consumer. Use it when your app gets a call it shouldn't handle and you want someone else to pick it up.")
@channel("calling.pass")
@summary("Pass the call offer to another consumer")
op pass(...PassRequest): PassReply;
