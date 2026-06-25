import "@signalwire/typespec-asyncapi";

import "../../../models/core.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

model RecordResult {
  ...RelayResult;

  @doc("URL of the finished recording.")
  url?: url;
}

model RecordPauseResult {
  ...RelayResult;
}

model RecordResumeResult {
  ...RelayResult;
}

model RecordStopResult {
  ...RelayResult;
}
