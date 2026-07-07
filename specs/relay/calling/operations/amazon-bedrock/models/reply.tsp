import "@signalwire/typespec-asyncapi";

import "../../../models/core.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

@summary("Amazon Bedrock result")
model AmazonBedrockResult {
  ...RelayResultWithCall<"success">;
}
