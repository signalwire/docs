import "@signalwire/typespec-asyncapi";
import "../../../common/frames.tsp";
import "@typespec/openapi";

import "./models/send.tsp";
import "./models/reply.tsp";
import "./models/events.tsp";

using SignalWire.AsyncAPI;
using TypeSpec.OpenAPI;

namespace Relay.Calling;

const callingRefer = "calling.refer";
const callingReferResponse = "${callingRefer} response";

model ReferRequest is JsonRpcRequest<typeof callingRefer, ReferParams>;
@extension("x-fern-display-name", callingReferResponse)
@reply model ReferReply is JsonRpcResponse<ReferResult>;

@doc("Transfers a SIP call to another SIP endpoint using a SIP REFER. Use it to hand the call off to an external destination without staying in the media path. The result confirms the refer was sent; the transfer's progress and final outcome arrive on a refer event.")
@channel(callingRefer)
@summary("Transfer a SIP call via SIP REFER")
@extension("x-fern-display-name", callingRefer)
op refer(...ReferRequest): ReferReply | CallReferEvent;
