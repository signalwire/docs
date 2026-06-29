import "@signalwire/typespec-asyncapi";

import "./models/requests.tsp";
import "./models/responses.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

model AmazonBedrockRequest is JsonRpcRequest<"calling.amazon_bedrock", AmazonBedrockParams>;
@reply model AmazonBedrockReply is JsonRpcResponse<AmazonBedrockResult>;

@doc("Connect to an Amazon Bedrock AI agent.")
@channel("calling.amazon_bedrock")
@summary("Connect to an Amazon Bedrock AI agent")
op amazonBedrock(...AmazonBedrockRequest): AmazonBedrockReply;
