import "@signalwire/typespec-asyncapi";

import "../../../models/core.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

@summary("Live translate result")
model LiveTranslateResult {
  ...RelayResultWithCall<"+OK">;
}
