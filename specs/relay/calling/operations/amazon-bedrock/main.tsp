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
// The Bedrock engine fires a narrower event set than the OpenAI/OART engine: no `calling.call.ai`
// lifecycle event (that fires only in the `ai` method's completion path), and none of the
// OpenAI/OART-only events (`response`, `user_speaking`, `warning`, `transparent_barge`,
// `post_prompt`). Only the events below are reachable on the Bedrock path.
op amazonBedrock(...AmazonBedrockRequest):
  | AmazonBedrockReply
  | AiStartEvent
  | AiCompletionEvent
  | AiResponseUtteranceEvent
  | AiSpeechDetectEvent
  | AiPartialResultEvent
  | AiBeginSpeakingEvent
  | AiStopEvent
  | AiSwaigEvent
  | AiSwaigActionEvent;
