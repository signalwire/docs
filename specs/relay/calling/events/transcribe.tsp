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
@event("calling.call.transcribe")
@example(#{
  node_id: "a3e1b2c4-5d6f-7a8b-9c0d-1e2f3a4b5c6d",
  call_id: "c7f9d2e1-3a4b-5c6d-7e8f-9a0b1c2d3e4f",
  control_id: "8f14e45f-ceea-167a-5a36-dedd4bea2543",
  state: "finished",
  url: "recordings/d4f5a6b7-c8d9-0e1f-2a3b-4c5d6e7f8a9b.wav",
  recording_id: "d4f5a6b7-c8d9-0e1f-2a3b-4c5d6e7f8a9b",
  status_url: "https://example.com/callback",
  duration: 30.0,
  size: 123456,
  start_time: 1772717474.381,
  end_time: 1772717504.381,
})
model CallTranscribeEvent {
  ...CallTranscribeParams;
}
