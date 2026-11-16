import "@signalwire/typespec-asyncapi";

import "../../../models/core.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

@summary("Answer parameters")
model AnswerParams {
  ...CallAddress;

  @doc("Maximum length of the call, in seconds, from 15 to 14400 (4 hours). The call ends automatically once this is reached. Defaults to 14400. A negative value is rejected with `\"400\"` before the call is answered. A value from 0 to 14, or above 14400, also returns `\"400\"`, but only after the call has been answered, so the call stays answered and keeps its existing limit.")
  @minValue(15)
  @maxValue(14400)
  @example(3600)
  max_duration?: int32;
}
