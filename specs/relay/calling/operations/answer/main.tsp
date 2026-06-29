import "@signalwire/typespec-asyncapi";

import "./models/requests.tsp";
import "./models/responses.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

model AnswerRequest is JsonRpcRequest<"calling.answer", AnswerParams>;
@reply model AnswerReply is JsonRpcResponse<AnswerResult>;

@doc("Answers an incoming call so audio begins flowing and you can start controlling it.")
@channel("calling.answer")
@summary("Answer an incoming call")
op answer(...AnswerRequest): AnswerReply;
