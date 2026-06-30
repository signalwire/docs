import "@signalwire/typespec-asyncapi";

import "../../../models/core.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

model TranscribeParams {
  ...CallAddress;

  @doc("Your identifier for this transcription. Use the same `control_id` with `calling.transcribe.stop` to stop it.")
  control_id: string;

  @doc("An `http` or `https` URL to receive transcription status updates as the transcription starts, runs, and ends.")
  status_url?: url;
}

model TranscribeStopParams {
  ...CallAddress;

  @doc("The `control_id` you passed to `calling.transcribe` when you started this transcription.")
  control_id: string;
}
