import "@signalwire/typespec-asyncapi";

import "../../../models/core.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

model RecordResult {
  ...RelayResult<"Recording">;

  @doc("URL of the finished recording.")
  @example("https://example.com/recordings/c2a1e9f4.mp3")
  url?: url;
}

model RecordPauseResult {
  ...RelayResult<"Pausing recording">;
}

model RecordResumeResult {
  ...RelayResult<"Resuming recording">;
}

model RecordStopResult {
  ...RelayResult<"Stopping recording">;
}
