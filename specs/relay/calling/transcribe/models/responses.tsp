import "@signalwire/typespec-asyncapi";

import "../../models/core.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

model TranscribeResult {
  ...RelayResult;

  @doc("Path of the audio recording captured for this transcription, e.g. `recordings/<UUID>.wav`.")
  url?: string;
}

model TranscribeStopResult {
  ...RelayResult;
}
