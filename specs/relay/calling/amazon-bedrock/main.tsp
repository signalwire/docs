import "@signalwire/typespec-asyncapi";

import "./models/requests.tsp";
import "./models/responses.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

/** Connect to an Amazon Bedrock AI agent. */
@channel("calling.amazon_bedrock")
@summary("Connect to an Amazon Bedrock AI agent")
@opExample(#{
  parameters: #{
    node_id: "a3e1b2c4-...",
    call_id: "c7f9d2e1-...",
    prompt: #{ text: "You are a helpful assistant." },
  },
  returnType: #{ code: "200", message: "AI started" },
})
op amazonBedrock(...AmazonBedrockParams): AmazonBedrockResult;
