import "@signalwire/typespec-asyncapi";
import "../../../../common/frames.tsp";
import "@typespec/openapi";

import "../../../models/core.tsp";

using TypeSpec.OpenAPI;

namespace Relay.Calling;

// ─────────────────────────────────────────────────────────────────────────────
// calling.call.play
// ─────────────────────────────────────────────────────────────────────────────

@doc("The current state of audio playback on the call.")
union CallPlayState {
  "playing",
  "paused",
  "error",
  "finished",
}

model CallPlayParams {
  ...CallAddress;

  @doc("The `control_id` of the playback this event refers to, returned when you started it with `calling.play`.")
  control_id: string;

  @doc("Where the playback currently stands.")
  state: CallPlayState;
}

const callingCallPlay = "calling.call.play";
@doc("Fires when audio playback on a call starts, pauses, resumes, finishes, or errors, so you can track a `calling.play` through to completion.")
@summary(callingCallPlay)
@extension("x-fern-display-name", callingCallPlay)
model CallPlayEvent is SignalwireEvent<typeof callingCallPlay, CallPlayParams>;
