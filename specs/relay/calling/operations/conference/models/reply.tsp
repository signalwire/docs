import "@signalwire/typespec-asyncapi";

import "../../../models/core.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

model JoinConferenceResult {
  ...RelayResult<"Joining conference">;

  @doc("The UUID of the conference the call joined. Always propagated by the transform.")
  @example("d02c88a9-cf83-4a5a-9c8b-2f4e6b1a0f77")
  conference_id?: string;
}

model LeaveConferenceResult {
  ...RelayResult<"Leaving conference">;
}
