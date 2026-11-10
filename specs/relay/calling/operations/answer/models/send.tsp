import "@signalwire/typespec-asyncapi";

import "../../../models/core.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

@summary("Answer parameters")
model AnswerParams {
  ...CallAddress;

  @doc("Maximum length of the call, in seconds, from 15 to 14400 (4 hours). The call ends automatically once this is reached. Defaults to 14400; values outside the range are rejected with `\"400\"`.")
  @minValue(15)
  @maxValue(14400)
  @example(3600)
  max_duration?: int32;
}
