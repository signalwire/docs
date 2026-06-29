import "@signalwire/typespec-asyncapi";

import "./models/requests.tsp";
import "./models/responses.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

model AiHoldRequest is JsonRpcRequest<"calling.ai_hold", AiHoldParams>;
@reply model AiHoldReply is JsonRpcResponse<AiHoldResult>;

@doc("Put an AI agent session on hold.")
@channel("calling.ai_hold")
@summary("Put an AI agent session on hold")
op aiHold(...AiHoldRequest): AiHoldReply;

model AiUnholdRequest is JsonRpcRequest<"calling.ai_unhold", AiUnholdParams>;
@reply model AiUnholdReply is JsonRpcResponse<AiUnholdResult>;

@doc("Resume an AI agent session from hold.")
@channel("calling.ai_unhold")
@summary("Resume an AI agent session from hold")
op aiUnhold(...AiUnholdRequest): AiUnholdReply;
