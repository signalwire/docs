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

@doc("Transfers a SIP call to another SIP endpoint using SIP REFER — a SIP mechanism that hands the call off directly, so SignalWire drops out of the media path. Use it to move a call to an external destination without staying in the audio path. To hand control to another Relay application or SWML script (rather than an external SIP endpoint), use `calling.transfer` instead. The result confirms the REFER was sent; the transfer's progress and final outcome arrive on `calling.call.refer` events.")
@channel(callingRefer)
@summary("Transfer a SIP call via SIP REFER")
@extension("x-fern-display-name", callingRefer)
op refer(...ReferRequest): ReferReply | CallReferEvent;
