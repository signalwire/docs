import "@signalwire/typespec-asyncapi";
import "../../../common/frames.tsp";
import "@typespec/openapi";

import "./models/send.tsp";
import "./models/reply.tsp";
import "../ai/models/events.tsp";

using SignalWire.AsyncAPI;
using TypeSpec.OpenAPI;

namespace Relay.Calling;

const callingAmazonBedrock = "calling.amazon_bedrock";
const callingAmazonBedrockResponse = "${callingAmazonBedrock} response";

model AmazonBedrockRequest is JsonRpcRequest<typeof callingAmazonBedrock, AmazonBedrockParams>;

@extension("x-fern-display-name", callingAmazonBedrockResponse)
@reply model AmazonBedrockReply is JsonRpcResponse<AmazonBedrockResult>;

@doc("Connect to an Amazon Bedrock AI agent.")
@channel(callingAmazonBedrock)
@summary("Connect to an Amazon Bedrock AI agent")
@extension("x-fern-display-name", callingAmazonBedrock)
op amazonBedrock(...AmazonBedrockRequest):
  | AmazonBedrockReply
  | CallAiEvent
  | AiStartEvent
  | AiUserSpeakingEvent
  | AiCompletionEvent
  | AiResponseEvent
  | AiResponseUtteranceEvent
  | AiSpeechDetectEvent
  | AiPartialResultEvent
  | AiBeginSpeakingEvent
  | AiWarningEvent
  | AiTransparentBargeEvent
  | AiStopEvent
  | AiPostPromptEvent
  | AiSwaigEvent
  | AiSwaigActionEvent;
