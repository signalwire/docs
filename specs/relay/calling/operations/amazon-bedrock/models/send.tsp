import "@signalwire/typespec-asyncapi";
import "../../../../../swml/calling";

import "../../../models/core.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

union AmazonBedrockRelayOmit {
  "voice_id",
  "prompt",
}

@summary("Amazon Bedrock text prompt")
model RelayBedrockPromptText is SWML.Calling.BedrockPromptText {
  @doc("""
    The voice the agent speaks with. Accepts an Amazon Nova Sonic voice name; when omitted, the
    default voice (`tiffany`) is used.
    """)
  @example("matthew")
  voice_id?: "tiffany" | "matthew" | "amy" | "lupe" | "carlos" = "tiffany";
}

@summary("Amazon Bedrock structured prompt")
model RelayBedrockPromptPom is SWML.Calling.BedrockPromptPom {
  @doc("""
    The voice the agent speaks with. Accepts an Amazon Nova Sonic voice name; when omitted, the
    default voice (`tiffany`) is used.
    """)
  @example("matthew")
  voice_id?: "tiffany" | "matthew" | "amy" | "lupe" | "carlos" = "tiffany";
}

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
