import "@signalwire/typespec-asyncapi";
import "../../../../common/frames.tsp";
import "@typespec/openapi";

import "../../../models/core.tsp";

using TypeSpec.OpenAPI;

namespace Relay.Calling;

@doc("""
  Payload of a `calling.user_event` event: the custom object the sender passed as
  `event`, delivered with the call address fields added. The payload is
  whatever object you provide, so only the address fields are fixed — every other
  field is one you chose (conventionally a `topic` naming the event).
  """)
@summary("User event payload")
model CallUserEventParams {
  ...CallEventAddress;
  ...Record<unknown>;
}

const callingCallUserEvent = "calling.user_event";
@doc("""
  A custom event on the call. You receive one whenever a `calling.user_event` is
  emitted on the call — by your own application, by another subscriber, or by a
  SWML `user_event` method running server-side — so it can arrive without your
  application emitting anything. The payload is whatever object the sender
  provided, plus the call address.
  """)
@summary(callingCallUserEvent)
@extension("x-fern-display-name", callingCallUserEvent)
model CallUserEvent is SignalwireEvent<typeof callingCallUserEvent, CallUserEventParams>;
