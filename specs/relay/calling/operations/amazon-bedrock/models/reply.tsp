import "@signalwire/typespec-asyncapi";

import "../../../models/core.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

@summary("Amazon Bedrock result")
@doc("Confirmation that the Amazon Bedrock agent connected.")
model AmazonBedrockResult {
  ...RelayResultWithCall<"success">;
}
