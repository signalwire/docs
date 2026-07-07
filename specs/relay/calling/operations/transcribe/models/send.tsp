import "@signalwire/typespec-asyncapi";

import "../../../models/core.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

model TranscribeParams {
  ...CallAddress;

  @doc("Your identifier for this transcription. Use the same `control_id` with `calling.transcribe.stop` to stop it.")
  @example("d4b2e1a0-7c9f-4a3b-8e2d-1f0a9b8c7d6e")
  control_id: string;

  @doc("An `http` or `https` URL where SignalWire POSTs the transcript text and transcription status updates as the transcription starts, runs, and ends.")
  @example("https://example.com/webhooks/relay")
  status_url?: url;
}

model TranscribeStopParams {
  ...CallAddress;

  @doc("The `control_id` you passed to `calling.transcribe` when you started this transcription.")
  @example("d4b2e1a0-7c9f-4a3b-8e2d-1f0a9b8c7d6e")
  control_id: string;
}
