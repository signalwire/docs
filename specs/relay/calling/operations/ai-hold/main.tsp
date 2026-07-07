import "@signalwire/typespec-asyncapi";
import "../../../common/frames.tsp";
import "@typespec/openapi";

import "./models/send.tsp";
import "./models/reply.tsp";

using SignalWire.AsyncAPI;
using TypeSpec.OpenAPI;

namespace Relay.Calling;

const callingAiHold = "calling.ai_hold";
const callingAiHoldResponse = "${callingAiHold} response";

model AiHoldRequest is JsonRpcRequest<typeof callingAiHold, AiHoldParams>;

@extension("x-fern-display-name", callingAiHoldResponse)
@reply model AiHoldReply is JsonRpcResponse<AiHoldResult>;

@doc("Put an AI agent session on hold.")
@channel(callingAiHold)
@summary("Put an AI agent session on hold")
@extension("x-fern-display-name", callingAiHold)
op aiHold(...AiHoldRequest): AiHoldReply;

const callingAiUnhold = "calling.ai_unhold";
const callingAiUnholdResponse = "${callingAiUnhold} response";

model AiUnholdRequest is JsonRpcRequest<typeof callingAiUnhold, AiUnholdParams>;

@extension("x-fern-display-name", callingAiUnholdResponse)
@reply model AiUnholdReply is JsonRpcResponse<AiUnholdResult>;

@doc("Resume an AI agent session from hold.")
@channel(callingAiUnhold)
@summary("Resume an AI agent session from hold")
@extension("x-fern-display-name", callingAiUnhold)
op aiUnhold(...AiUnholdRequest): AiUnholdReply;
