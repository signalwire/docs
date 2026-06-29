import "@signalwire/typespec-asyncapi";

import "../models/core.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

// ─────────────────────────────────────────────────────────────────────────────
// calling.call.transcribe
// ─────────────────────────────────────────────────────────────────────────────

@doc("Whether transcription is currently `transcribing` or has `finished`.")
union TranscribeState {
  "transcribing",
  "finished",
}

model CallTranscribeParams {
  ...CallAddress;

  @doc("The `control_id` of the transcription this event belongs to.")
  control_id: string;

  @doc("Whether transcription is still running (`transcribing`) or has stopped (`finished`).")
  state: TranscribeState;

  @doc("Location of the recording captured alongside the transcription (for example, `recordings/<UUID>.wav`).")
  url?: string;

  @doc("The UUID of the recording captured alongside the transcription.")
  recording_id?: string;

  @doc("The callback URL you provided to receive transcription updates, if any.")
  status_url?: string;

  @doc("Length of the recording in seconds. Present only when `state` is `finished`.")
  duration?: float64;

  @doc("Size of the recording in bytes. Present only when `state` is `finished`.")
  size?: int32;

  @doc("Unix timestamp for when the recording started. Present only when `state` is `finished`.")
  start_time?: float64;

  @doc("Unix timestamp for when the recording ended. Present only when `state` is `finished`.")
  end_time?: float64;
}

@doc("Fires when transcription starts and again when it stops. The `finished` event includes the recording's duration, size, and timestamps.")
@summary("calling.call.transcribe")
model CallTranscribeEvent is SignalwireEvent<"calling.call.transcribe", CallTranscribeParams>;
