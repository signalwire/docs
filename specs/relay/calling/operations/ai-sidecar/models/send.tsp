import "@signalwire/typespec-asyncapi";
import "../../../../../swml/calling";

import "../../../models/core.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

model AiSidecarParams {
  ...CallAddress;
  ...SWML.Calling.AISidecarObject;
}

model AiSidecarPokeParams {
  ...CallAddress;

  @doc("The message to send to the sidecar.")
  @example("The customer just asked about enterprise pricing.")
  text: string;
}

model AiSidecarAskParams {
  ...CallAddress;

  @doc("The question for the sidecar to answer.")
  @example("What is the best next question to ask this customer?")
  text: string;
}

model AiSidecarStopParams {
  ...CallAddress;
}

model AiSidecarStatusParams {
  ...CallAddress;
}
