import "@signalwire/typespec-asyncapi";

import "../../../models/core.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

@summary("Amazon Bedrock result")
@doc("""
  Sent when the Bedrock session ends, not when it starts. Once the request passes
  validation, the result is `"200"` / `success` even if the agent failed to run.
  """)
model AmazonBedrockResult {
  ...RelayResultWithCall<"success">;
}
