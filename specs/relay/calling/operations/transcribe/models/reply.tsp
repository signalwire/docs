import "@signalwire/typespec-asyncapi";

import "../../../models/core.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

@summary("Transcribe result")
model TranscribeResult {
  ...RelayResult<"Transcribing">;

  @doc("Full storage URL of the audio recording captured for this transcription. Always a `.wav` file whose name is the recording's UUID.")
  @example("https://example.com/0d4a9c3e-8b7f-4e2a-9c1d-3b5e7f9a1c2d/a1b2c3d4-e5f6-4a7b-8c9d-0e1f2a3b4c5d/recordings/e5c3f2b1-8d0a-4b4c-9f3e-2a1b0c9d8e7f.wav")
  url?: string;
}

@summary("Transcribe stop result")
model TranscribeStopResult {
  ...RelayResult<"Stopping transcribe">;
}
