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
  whole conversation: the result arrives only after the Bedrock session ends, and
  it reports `success` even if the agent failed to run. Watch the `calling.ai.*`
  events to follow the session.

  The session ends when the call hangs up, when the agent ends the conversation
  (including by transferring the call), or on an error. There's no request that
  stops the agent and keeps the call up: `calling.ai.stop`, `calling.ai_hold`,
  `calling.ai_unhold`, and `calling.ai_adjust` apply only to agents started with
  `calling.ai`. `calling.ai_message` can send the agent a message while it runs.
  """)
@channel(callingAmazonBedrock)
@summary("Connect to an Amazon Bedrock AI agent")
@extension("x-fern-display-name", callingAmazonBedrock)
// The Bedrock engine fires a narrower event set than the `ai` method: no `calling.call.ai`
// lifecycle event (that fires only in the `ai` method's completion path), no SWAIG
// (`swaig`, `swaig_action`) events, and none of `response`, `warning`, `transparent_barge`,
// or `response_heard`. Only the events below are reachable on the Bedrock path.
op amazonBedrock(...AmazonBedrockRequest):
  | AmazonBedrockReply
  | AiCompletionEvent
  | AiResponseUtteranceEvent
  | AiSpeechDetectEvent
  | AiPartialResultEvent
  | AiBeginSpeakingEvent
  | AiStopEvent;
