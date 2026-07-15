import "@signalwire/typespec-asyncapi";

import "../../../models/core.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

@summary("Transcribe result")
model TranscribeResult {
  ...RelayResult<"Transcribing">;

  @doc("Location of the audio recording captured for this transcription (for example, `recordings/<UUID>.wav`).")
  @example("recordings/e5c3f2b1-8d0a-4b4c-9f3e-2a1b0c9d8e7f.wav")
  url?: string;
}

@summary("Transcribe stop result")
model TranscribeStopResult {
  ...RelayResult<"Stopping transcribe">;
}
