import "@signalwire/typespec-asyncapi";

import "../../../models/core.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

model RecordResult {
  ...RelayResult;

  @doc("Echoes back the `control_id` you sent, so you can match this result to your request.")
  control_id?: string;

  @doc("URL of the finished recording.")
  url?: url;
}

model RecordPauseResult {
  ...RelayResult;

  @doc("Echoes back the `control_id` you sent, so you can match this result to your request.")
  control_id?: string;
}

model RecordResumeResult {
  ...RelayResult;

  @doc("Echoes back the `control_id` you sent, so you can match this result to your request.")
  control_id?: string;
}

model RecordStopResult {
  ...RelayResult;

  @doc("Echoes back the `control_id` you sent, so you can match this result to your request.")
  control_id?: string;
}
