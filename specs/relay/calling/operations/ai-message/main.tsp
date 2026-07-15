import "@signalwire/typespec-asyncapi";
import "../../../common/frames.tsp";
import "@typespec/openapi";

import "./models/send.tsp";
import "./models/reply.tsp";

using SignalWire.AsyncAPI;
using TypeSpec.OpenAPI;

namespace Relay.Calling;

const callingAiMessage = "calling.ai_message";
const callingAiMessageResponse = "${callingAiMessage} response";

model AiMessageRequest is JsonRpcRequest<typeof callingAiMessage, AiMessageParams>;

@extension("x-fern-display-name", callingAiMessageResponse)
@reply model AiMessageReply is JsonRpcResponse<AiMessageResult>;

@doc("Send (inject) a message into an active AI agent session.")
@channel(callingAiMessage)
@summary("Send a message to an active AI agent session")
@extension("x-fern-display-name", callingAiMessage)
op aiMessage(...AiMessageRequest): AiMessageReply;
