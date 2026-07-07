import "@signalwire/typespec-asyncapi";
import "../../../../common/frames.tsp";
import "@typespec/openapi";

import "../../../models/core.tsp";

using TypeSpec.OpenAPI;

namespace Relay.Calling;

@doc("""
  Payload of a `calling.user_event` event: the custom object the sender passed as
  `event`, delivered with the call address fields added. The payload is
  caller-defined, so only the address fields are fixed — every other field is one
  you chose (conventionally a `topic` naming the event).
  """)
@summary("User event payload")
model CallUserEventParams {
  ...CallEventAddress;
  ...Record<unknown>;
}

const callingCallUserEvent = "calling.user_event";
@doc("Delivers a custom event sent with `calling.user_event` on this call. The payload is whatever object the sender provided, plus the call address.")
@summary(callingCallUserEvent)
@extension("x-fern-display-name", callingCallUserEvent)
model CallUserEvent is SignalwireEvent<typeof callingCallUserEvent, CallUserEventParams>;
