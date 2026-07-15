import "@signalwire/typespec-asyncapi";
import "../../../../../swml/calling";

import "../../../models/core.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

// `voice_id` is intentionally unset via Relay. The backend reads it only from the top level of the
// config, but the `call_amazon_bedrock` request whitelist rejects a top-level `voice_id` as an
// unknown key, so there is no working placement — the agent always uses the default voice
// (`tiffany`). Exposing it via Relay requires a backend change (whitelist the key and keep reading
// it top-level); escalated by the lead.
union AmazonBedrockRelayOmit {
  "voice_id",
  "prompt",
}

@summary("Amazon Bedrock text prompt")
model RelayBedrockPromptText is SWML.Calling.BedrockPromptText {}

@summary("Amazon Bedrock structured prompt")
model RelayBedrockPromptPom is SWML.Calling.BedrockPromptPom {}

union RelayBedrockPrompt {
  OmitProperties<RelayBedrockPromptText, SWML.Calling.OmittedPromptProps>,
  OmitProperties<RelayBedrockPromptPom, SWML.Calling.OmittedPromptProps>,
}

@summary("Amazon Bedrock params")
model AmazonBedrockParams {
  ...CallAddress;
  ...OmitProperties<SWML.Calling.AmazonBedrockObject, AmazonBedrockRelayOmit>;

  @doc("Establishes the initial set of instructions and settings to configure the agent.")
  prompt?: RelayBedrockPrompt;
}
