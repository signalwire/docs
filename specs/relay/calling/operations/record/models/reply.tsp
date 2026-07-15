import "@signalwire/typespec-asyncapi";

import "../../../models/core.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

@summary("Record result")
model RecordResult {
  ...RelayResult<"Recording">;

  @doc("URL of the recording, when available on the immediate result (the finished URL is normally delivered on the `calling.call.record` event).")
  @example("https://example.com/recordings/c2a1e9f4.mp3")
  url?: url;
}

@summary("Record pause result")
model RecordPauseResult {
  ...RelayResult<"Pausing recording">;
}

@summary("Record resume result")
model RecordResumeResult {
  ...RelayResult<"Resuming recording">;
}

@summary("Record stop result")
model RecordStopResult {
  ...RelayResult<"Stopping recording">;
}
