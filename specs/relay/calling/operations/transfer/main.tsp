import "@signalwire/typespec-asyncapi";
import "../../../common/frames.tsp";
import "@typespec/openapi";

import "./models/send.tsp";
import "./models/reply.tsp";

using SignalWire.AsyncAPI;
using TypeSpec.OpenAPI;

namespace Relay.Calling;

const callingTransfer = "calling.transfer";
const callingTransferResponse = "${callingTransfer} response";

model TransferRequest is JsonRpcRequest<typeof callingTransfer, TransferParams>;
@extension("x-fern-display-name", callingTransferResponse)
@reply model TransferReply is JsonRpcResponse<TransferResult>;

@doc("Hands off control of an active call to another Relay application or to a SWML script. Use this to move a call to a different flow, for example to route it to an IVR (interactive voice response), queue, or a fresh script. Once transferred, the original application no longer controls the call. For handing a SIP call off to an external SIP endpoint so SignalWire leaves the media path, use `calling.refer` instead.")
@channel(callingTransfer)
@summary("Transfer a call to a Relay app or SWML script")
@extension("x-fern-display-name", callingTransfer)
op transfer(...TransferRequest): TransferReply;
