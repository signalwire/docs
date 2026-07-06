import "@signalwire/typespec-asyncapi";

import "../../../models/core.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

model TranscribeResult {
  ...RelayResult<"Transcribing">;

  @doc("Path of the audio recording captured for this transcription, e.g. `recordings/<UUID>.wav`.")
  @example("recordings/e5c3f2b1-8d0a-4b4c-9f3e-2a1b0c9d8e7f.wav")
  url?: string;
}

model TranscribeStopResult {
  ...RelayResult<"Stopping transcribe">;
}
