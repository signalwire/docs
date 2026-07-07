import "@signalwire/typespec-asyncapi";

import "../../../models/core.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

@summary("Live transcribe result")
model LiveTranscribeResult {
  ...RelayResultWithCall<"+OK">;
}
