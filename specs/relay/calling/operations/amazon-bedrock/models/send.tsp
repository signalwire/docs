import "@signalwire/typespec-asyncapi";
import "../../../../../swml/calling";

import "../../../models/core.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

union AmazonBedrockRelayOmit {
  "voice_id",
  "prompt",
}

model RelayBedrockPromptText is SWML.Calling.BedrockPromptText {
  @doc("""
    The voice the agent speaks with. Accepts an Amazon Nova Sonic voice name, which is mapped
    internally to the underlying TTS voice. When omitted, the default voice (`tiffany`) is used.
    On the Relay API this is set inside `prompt` rather than at the top level.
    """)
  @example("matthew")
  voice_id?: "tiffany" | "matthew" | "amy" | "lupe" | "carlos" = "tiffany";
}

model RelayBedrockPromptPom is SWML.Calling.BedrockPromptPom {
  @doc("""
    The voice the agent speaks with. Accepts an Amazon Nova Sonic voice name, which is mapped
    internally to the underlying TTS voice. When omitted, the default voice (`tiffany`) is used.
    On the Relay API this is set inside `prompt` rather than at the top level.
    """)
  @example("matthew")
  voice_id?: "tiffany" | "matthew" | "amy" | "lupe" | "carlos" = "tiffany";
}

union RelayBedrockPrompt {
  OmitProperties<RelayBedrockPromptText, SWML.Calling.OmittedPromptProps>,
  OmitProperties<RelayBedrockPromptPom, SWML.Calling.OmittedPromptProps>,
}

model AmazonBedrockParams {
  ...CallAddress;
  ...OmitProperties<SWML.Calling.AmazonBedrockObject, AmazonBedrockRelayOmit>;

  @doc("Establishes the initial set of instructions and settings to configure the agent.")
  prompt?: RelayBedrockPrompt;
}
