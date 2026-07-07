import "@signalwire/typespec-asyncapi";

import "../../../models/core.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

@summary("Answer result")
model AnswerResult {
  ...RelayResultBase<"Answering call">;
}
