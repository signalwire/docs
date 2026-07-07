import "@signalwire/typespec-asyncapi";
import "../../../common/frames.tsp";
import "@typespec/openapi";

import "./models/send.tsp";
import "./models/reply.tsp";
import "./models/events.tsp";

using SignalWire.AsyncAPI;
using TypeSpec.OpenAPI;

namespace Relay.Calling;

const callingUserEvent = "calling.user_event";
const callingUserEventResponse = "${callingUserEvent} response";

model UserEventRequest is JsonRpcRequest<typeof callingUserEvent, UserEventParams>;
@extension("x-fern-display-name", callingUserEventResponse)
@reply model UserEventReply is JsonRpcResponse<UserEventResult>;

@doc("""
  Emits a custom, caller-defined event on this call. Whatever you put in `event` is
  delivered — with the call address added — to every application subscribed to the
  call's context as a `calling.user_event` event. This channel is two-way: you can
  emit events here, and you also receive `calling.user_event` events others emit
  (see the event below), so you don't need to call this to listen.
  """)
@channel(callingUserEvent)
@summary("Send a custom user-defined event")
@extension("x-fern-display-name", callingUserEvent)
op userEvent(...UserEventRequest): UserEventReply | CallUserEvent;
