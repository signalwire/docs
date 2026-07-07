import "@signalwire/typespec-asyncapi";
import "../../../../../swml/calling";

import "../../../models/core.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

@summary("AI sidecar params")
model AiSidecarParams {
  ...CallAddress;
  ...SWML.Calling.AISidecarObject;
}

@summary("AI sidecar poke params")
model AiSidecarPokeParams {
  ...CallAddress;

  @doc("The message to send to the sidecar.")
  @example("The customer just asked about enterprise pricing.")
  text: string;
}

@summary("AI sidecar ask params")
model AiSidecarAskParams {
  ...CallAddress;

  @doc("The question for the sidecar to answer.")
  @example("What is the best next question to ask this customer?")
  text: string;
}

@summary("AI sidecar stop params")
model AiSidecarStopParams {
  ...CallAddress;
}

@summary("AI sidecar status params")
model AiSidecarStatusParams {
  ...CallAddress;
}
