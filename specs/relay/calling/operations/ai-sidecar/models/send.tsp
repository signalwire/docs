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
  text: string;
}

model AiSidecarAskParams {
  ...CallAddress;

  @doc("The question for the sidecar to answer.")
  text: string;
}

model AiSidecarStopParams {
  ...CallAddress;
}

model AiSidecarStatusParams {
  ...CallAddress;
}
