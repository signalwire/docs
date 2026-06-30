import "@signalwire/typespec-asyncapi";
import "../../../common/frames.tsp";
import "@typespec/openapi";

import "./models/requests.tsp";
import "./models/responses.tsp";

using SignalWire.AsyncAPI;
using TypeSpec.OpenAPI;

namespace Relay.Calling;

const callingAnswer = "calling.answer";
const callingAnswerResponse = "${callingAnswer} response";

model AnswerRequest is JsonRpcRequest<typeof callingAnswer, AnswerParams>;

@extension("x-fern-display-name", callingAnswerResponse)
@reply model AnswerReply is JsonRpcResponse<AnswerResult>;

@doc("Answers an incoming call so audio begins flowing and you can start controlling it.")
@channel(callingAnswer)
@summary("Answer an incoming call")
@extension("x-fern-display-name", callingAnswer)
op answer(...AnswerRequest): AnswerReply;
