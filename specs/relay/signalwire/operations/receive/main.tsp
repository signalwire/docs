import "@signalwire/typespec-asyncapi";
import "../../../common/frames.tsp";
import "@typespec/openapi";

import "../../models/core.tsp";
import "./models/send.tsp";
import "../../../calling/events/shared.tsp";

using SignalWire.AsyncAPI;
using TypeSpec.OpenAPI;

namespace Relay.Signalwire;
const GroupSignalwireReceive = #["signalwire", "receive"];
const GroupSignalwireUnreceive = #["signalwire", "unreceive"];

const signalwireReceive = "signalwire.receive";
const signalwireReceiveResponse = "${signalwireReceive} response";

model ReceiveRequest is JsonRpcRequest<typeof signalwireReceive, ReceiveParams>;

@extension("x-fern-display-name", signalwireReceiveResponse)
@reply model ReceiveReply is JsonRpcResponse<Acknowledgement>;

const signalwireUnreceive = "signalwire.unreceive";
const signalwireUnreceiveResponse = "${signalwireUnreceive} response";

model UnreceiveRequest is JsonRpcRequest<typeof signalwireUnreceive, UnreceiveParams>;

@extension("x-fern-display-name", signalwireUnreceiveResponse)
@reply model UnreceiveReply is JsonRpcResponse<Acknowledgement>;

@doc("""
  Subscribe to one or more contexts so you start receiving inbound events for
  them. This is how you ask SignalWire to deliver unsolicited notifications to
  your connection — most importantly the `calling.call.receive` event for an
  inbound call, which only reaches clients that have subscribed to the call's
  context.

  Subscribing also delivers other context-scoped inbound events — for example
  `queuing.relay.tasks` (see the Tasking channel). Each such event is documented
  on its own page, so the full set you may receive isn't repeated here.

  Legacy: `signalwire.receive` is a pre-4.0 method. It is rejected
  (`VERSION_INCOMPATIBLE`) for connections at version `4.0` or higher. On `4.0`
  connections, subscribe by passing `contexts` to `signalwire.connect` — that is
  the current subscription mechanism.
  """)
@channel(signalwireReceive)
@summary("Subscribe to inbound events on one or more contexts")
@extension("x-fern-display-name", signalwireReceive)
@extension("x-fern-sdk-group-name", GroupSignalwireReceive)
op receive(...ReceiveRequest): ReceiveReply | Relay.Calling.CallReceiveEvent | Relay.Calling.CallStateEvent;

@doc("""
  Unsubscribe from one or more contexts so you stop receiving their inbound events.

  Legacy: `signalwire.unreceive` is a pre-4.0 method. It is rejected
  (`VERSION_INCOMPATIBLE`) for connections at version `4.0` or higher. On `4.0`
  connections, manage subscriptions via the `contexts` you pass to
  `signalwire.connect` instead.
  """)
@channel(signalwireUnreceive)
@summary("Unsubscribe from inbound events on one or more contexts")
@extension("x-fern-display-name", signalwireUnreceive)
@extension("x-fern-sdk-group-name", GroupSignalwireUnreceive)
op unreceive(...UnreceiveRequest): UnreceiveReply;
