import "@signalwire/typespec-asyncapi";
import "../../../../../swml/calling";

import "../../../models/core.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

model AmazonBedrockParams {
  ...CallAddress;
  ...SWML.Calling.AmazonBedrockObject;
}
