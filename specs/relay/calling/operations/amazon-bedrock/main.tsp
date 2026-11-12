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

@doc("""
  Connect the call to an Amazon Bedrock AI agent. The request stays open for the
  whole conversation: the result arrives only after the Bedrock session ends
  (hangup, error, or stop), and it reports `success` even if the agent failed to
  run. Watch the `calling.ai.*` events to follow the session.
  """)
@channel(callingAmazonBedrock)
@summary("Connect to an Amazon Bedrock AI agent")
@extension("x-fern-display-name", callingAmazonBedrock)
// The Bedrock engine fires a narrower event set than the `ai` method: no `calling.call.ai`
// lifecycle event (that fires only in the `ai` method's completion path), no SWAIG
// (`swaig`, `swaig_action`) events, and none of `response`, `warning`, `transparent_barge`,
// or `post_prompt`. Only the events below are reachable on the Bedrock path.
op amazonBedrock(...AmazonBedrockRequest):
  | AmazonBedrockReply
  | AiCompletionEvent
  | AiResponseUtteranceEvent
  | AiSpeechDetectEvent
  | AiPartialResultEvent
  | AiBeginSpeakingEvent
  | AiStopEvent;
