import "@signalwire/typespec-asyncapi";

import "../models/core.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

// ─────────────────────────────────────────────────────────────────────────────
// calling.call.record
// ─────────────────────────────────────────────────────────────────────────────

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
  format?: string;

  @doc("Whether the recording was captured in stereo.")
  stereo?: boolean;

  @doc("Which side(s) of the conversation were captured.")
  direction?: RecordEventDirection;
}

@doc("Describes how the recording was made. The `audio` field is present when you recorded audio.")
model RecordEventSpec {
  @doc("The audio settings used for this recording.")
  audio?: RecordEventAudio;
}

model CallRecordParams {
  ...CallAddress;

  @doc("The `control_id` of the recording this event refers to, returned when you started it with `calling.record`.")
  control_id: string;

  @doc("Where the recording currently stands.")
  state: CallRecordState;

  @doc("The unique identifier of the recording.")
  recording_id?: string;

  @doc("Where to download the finished recording. Not available until the state is `finished`.")
  url?: url;

  @doc("How long the recording is, in seconds. Set once the state is `finished`.")
  duration?: float64;

  @doc("How large the recording file is, in bytes. Set once the state is `finished`.")
  size?: int32;

  @doc("Unix timestamp for when the recording started, in seconds. Set once the state is `finished`.")
  start_time?: float64;

  @doc("Unix timestamp for when the recording ended, in seconds. Set once the state is `finished`.")
  end_time?: float64;

  @doc("How paused time is handled in the recording: `silence` inserts silence for the paused span, while `skip` leaves it out entirely.")
  pause_behavior?: "silence" | "skip";

  @doc("The settings this recording was captured with.")
  record?: RecordEventSpec;
}

@doc("Fires when a recording starts, pauses, resumes, or finishes. The finished event includes the download URL, duration, and file size.")
@summary("calling.call.record")
model CallRecordEvent is SignalwireEvent<"calling.call.record", CallRecordParams>;
