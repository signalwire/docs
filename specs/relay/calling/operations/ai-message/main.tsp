import "@signalwire/typespec-asyncapi";

import "./models/requests.tsp";
import "./models/responses.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

model AiMessageRequest is JsonRpcRequest<"calling.ai_message", AiMessageParams>;
@reply model AiMessageReply is JsonRpcResponse<AiMessageResult>;

@doc("(async-safe) Send (inject) a message into an active AI agent session.")
@channel("calling.ai_message")
@summary("Send a message to an active AI agent session")
op aiMessage(...AiMessageRequest): AiMessageReply;
