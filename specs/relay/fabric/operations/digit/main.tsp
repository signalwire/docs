import "@signalwire/typespec-asyncapi";
import "../../../common/frames.tsp";
import "@typespec/openapi";

import "./models/send.tsp";

using SignalWire.AsyncAPI;
using TypeSpec.OpenAPI;

namespace Relay.Fabric;

const callDigitSend = "call.digit.send";
const callDigitSendResponse = "${callDigitSend} response";
model DigitSendRequest is JsonRpcRequest<typeof callDigitSend, DigitSendParams>;
model DigitSendResult { ...FabricResult<"Digits sent">; }
@extension("x-fern-display-name", callDigitSendResponse)
@reply
model DigitSendReply is JsonRpcResponse<DigitSendResult>;

@doc("Sends DTMF digits from your call leg.")
@channel(callDigitSend)
@summary("Send DTMF digits")
@extension("x-fern-display-name", callDigitSend)
op digitSend(...DigitSendRequest): DigitSendReply;
