import "@signalwire/typespec-asyncapi";
import "../../../../../swml/calling";

import "../../../models/core.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

// The Relay request whitelist checks only top-level keys, and the Bedrock engine reads the agent
// voice from `prompt.voice_id`, so the SWML Bedrock prompt shapes apply unchanged. `prompt` is
// re-declared only to make it optional: the engine supplies a default prompt when it is absent.
@summary("Amazon Bedrock params")
model AmazonBedrockParams {
  ...CallAddress;
  ...OmitProperties<SWML.Calling.AmazonBedrockObject, "prompt">;

  @doc("Establishes the initial set of instructions and settings to configure the agent.")
  prompt?: SWML.Calling.BedrockPrompt;
}
