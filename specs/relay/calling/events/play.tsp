import "@signalwire/typespec-asyncapi";

import "../models/core.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

// ─────────────────────────────────────────────────────────────────────────────
// calling.call.play
// ─────────────────────────────────────────────────────────────────────────────

/** The current state of audio playback on the call. */
union CallPlayState {
  "playing",
  "paused",
  "error",
  "finished",
}

model CallPlayParams {
  ...CallAddress;

  /** The `control_id` of the playback this event refers to, returned when you started it with `calling.play`. */
  control_id: string;

  /** Where the playback currently stands. */
  state: CallPlayState;
}

/** Fires when audio playback on a call starts, pauses, resumes, finishes, or errors, so you can track a `calling.play` through to completion. */
@event("calling.call.play")
@example(#{
  node_id: "a3e1b2c4-1234-5678-9abc-def012345678",
  call_id: "c7f9d2e1-8765-4321-0fed-cba987654321",
  control_id: "b2d4f6a8-1111-2222-3333-444455556666",
  state: "finished",
})
model CallPlayEvent {
  ...CallPlayParams;
}
