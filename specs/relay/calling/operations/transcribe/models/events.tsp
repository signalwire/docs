import "@signalwire/typespec-asyncapi";
import "../../../../common/frames.tsp";
import "@typespec/openapi";

import "../../../models/core.tsp";

using TypeSpec.OpenAPI;

namespace Relay.Calling;

@doc("Whether transcription is currently `transcribing` or has `finished`.")
union TranscribeState {
  "transcribing",
  "finished",
}

@summary("Transcribe event")
model CallTranscribeParams {
  ...CallEventAddress;

  @doc("The `control_id` of the transcription this event belongs to.")
  @example("d4b2e1a0-7c9f-4a3b-8e2d-1f0a9b8c7d6e")
  control_id: string;

  @doc("Whether transcription is still running (`transcribing`) or has stopped (`finished`).")
  @example("finished")
  state: TranscribeState;

  @doc("Location of the recording captured alongside the transcription (for example, `recordings/<UUID>.wav`).")
  @example("recordings/e5c3f2b1-8d0a-4b4c-9f3e-2a1b0c9d8e7f.wav")
  url?: string;

  @doc("The UUID of the recording captured alongside the transcription.")
  @example("e5c3f2b1-8d0a-4b4c-9f3e-2a1b0c9d8e7f")
  recording_id?: string;

  @doc("The callback URL you provided to receive transcription updates, if any.")
  @example("https://example.com/webhooks/relay")
  status_url?: string;

  @doc("Length of the recording in seconds. Present only when `state` is `finished`.")
  @example(30.0)
  duration?: float64;

  @doc("Size of the recording in bytes. Present only when `state` is `finished`.")
  @example(123456)
  size?: int64;

  @doc("Unix timestamp for when the recording started. Present only when `state` is `finished`.")
  @example(1772717474.381)
  start_time?: float64;

  @doc("Unix timestamp for when the recording ended. Present only when `state` is `finished`.")
  @example(1772717504.381)
  end_time?: float64;
}

const callingCallTranscribe = "calling.call.transcribe";
@doc("Fires when transcription starts and again when it stops. The `finished` event includes the recording's duration, size, and timestamps.")
@summary(callingCallTranscribe)
@extension("x-fern-display-name", callingCallTranscribe)
model CallTranscribeEvent is SignalwireEvent<typeof callingCallTranscribe, CallTranscribeParams>;
