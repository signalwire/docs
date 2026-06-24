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

  @doc("Where to download the finished recording. Not available until the state is `finished`.")
  url?: url;

  @doc("How long the recording is, in seconds. Set once the state is `finished`.")
  duration?: float64;

  @doc("How large the recording file is, in bytes. Set once the state is `finished`.")
  size?: int32;

  @doc("The settings this recording was captured with.")
  record?: RecordEventSpec;
}

@doc("Fires when a recording starts, pauses, resumes, or finishes. The finished event includes the download URL, duration, and file size.")
@event("calling.call.record")
@example(#{
  node_id: "a3e1b2c4-1234-5678-9abc-def012345678",
  call_id: "c7f9d2e1-8765-4321-0fed-cba987654321",
  control_id: "b2d4f6a8-1111-2222-3333-444455556666",
  state: "finished",
  url: "https://example.com/recordings/c7f9d2e1.mp3",
  duration: 20.0,
  size: 123456788,
  record: #{ audio: #{ format: "mp3", stereo: false, direction: "both" } },
})
model CallRecordEvent {
  ...CallRecordParams;
}
