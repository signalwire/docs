import "@signalwire/typespec-asyncapi";
import "../../../../common/frames.tsp";
import "@typespec/openapi";

import "../../../models/core.tsp";

using TypeSpec.OpenAPI;

namespace Relay.Calling;

@doc("Where the recording currently stands, including `no_input` when nothing was captured.")
union CallRecordState {
  "recording",
  "paused",
  "finished",
  "no_input",
}

@doc("Which side of the conversation was recorded.")
union RecordEventDirection {
  @doc("Only what the party hears.")
  "listen",

  @doc("Only what the party says.")
  "speak",

  @doc("Both sides of the conversation.")
  "both",
}

@doc("The audio settings the recording was captured with.")
model RecordEventAudio {
  @doc("The file format of the recording (for example `mp3` or `wav`).")
  @example("mp3")
  format?: string;

  @doc("Whether the recording was captured in stereo.")
  @example(false)
  stereo?: boolean;

  @doc("Which side(s) of the conversation were captured.")
  @example("speak")
  direction?: RecordEventDirection;
}

@doc("Describes how the recording was made. The `audio` field is present when you recorded audio.")
model RecordEventSpec {
  @doc("The audio settings used for this recording.")
  audio?: RecordEventAudio;
}

model CallRecordParams {
  ...CallEventAddress;

  @doc("The `control_id` of the recording this event refers to, returned when you started it with `calling.record`.")
  @example("d4b2e1a0-7c9f-4a3b-8e2d-1f0a9b8c7d6e")
  control_id: string;

  @doc("Where the recording currently stands.")
  @example("finished")
  state: CallRecordState;

  @doc("The unique identifier of the recording.")
  @example("c2a1e9f4-6b3d-4e7a-8f1c-2d3e4f5a6b7c")
  recording_id?: string;

  @doc("Where to download the finished recording. Not available until the state is `finished`.")
  @example("https://example.com/recordings/c2a1e9f4.mp3")
  url?: url;

  @doc("How long the recording is, in seconds. Set once the state is `finished`.")
  @example(20.0)
  duration?: float64;

  @doc("How large the recording file is, in bytes. Set once the state is `finished`.")
  @example(123456788)
  size?: int32;

  @doc("Unix timestamp for when the recording started, in seconds. Set once the state is `finished`.")
  @example(1712345678.842)
  start_time?: float64;

  @doc("Unix epoch (seconds) of the true first recorded PCM frame; present when available — a more accurate anchor than start_time.")
  @example(1712345678.123)
  first_frame_time?: float64;

  @doc("Unix timestamp for when the recording ended, in seconds. Set once the state is `finished`.")
  @example(1712345698.842)
  end_time?: float64;

  @doc("How paused time is handled in the recording: `silence` inserts silence for the paused span, while `skip` leaves it out entirely.")
  @example("skip")
  pause_behavior?: "silence" | "skip";

  @doc("The settings this recording was captured with.")
  record?: RecordEventSpec;
}

const callingCallRecord = "calling.call.record";
@doc("Fires when a recording starts, pauses, resumes, or finishes. The finished event includes the download URL, duration, and file size.")
@summary(callingCallRecord)
@extension("x-fern-display-name", callingCallRecord)
model CallRecordEvent is SignalwireEvent<typeof callingCallRecord, CallRecordParams>;
