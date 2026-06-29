import "@signalwire/typespec-asyncapi";

import "./models/requests.tsp";
import "./models/responses.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

model TransferRequest is JsonRpcRequest<"calling.transfer", TransferParams>;
@reply model TransferReply is JsonRpcResponse<TransferResult>;

@doc("Hands off control of an active call to another RELAY application or to a SWML script. Use this to move a call to a different flow, for example to route it to an IVR, queue, or a fresh script. Once transferred, the original application no longer controls the call.")
@channel("calling.transfer")
@summary("Transfer a call to a RELAY app or SWML script")
op transfer(...TransferRequest): TransferReply;
