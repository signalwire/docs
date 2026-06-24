import "@signalwire/typespec-asyncapi";

import "../../models/core.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

model RecordResult {
  ...RelayResult;

  /** Echoes back the `control_id` you sent, so you can match this result to your request. */
  control_id?: string;

  /** URL of the finished recording. */
  url?: url;
}

model RecordPauseResult {
  ...RelayResult;

  /** Echoes back the `control_id` you sent, so you can match this result to your request. */
  control_id?: string;
}

model RecordResumeResult {
  ...RelayResult;

  /** Echoes back the `control_id` you sent, so you can match this result to your request. */
  control_id?: string;
}

model RecordStopResult {
  ...RelayResult;

  /** Echoes back the `control_id` you sent, so you can match this result to your request. */
  control_id?: string;
}
