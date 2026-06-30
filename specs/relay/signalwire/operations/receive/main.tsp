import "@signalwire/typespec-asyncapi";
import "../../../common/frames.tsp";
import "@typespec/openapi";

import "../../models/core.tsp";
import "./models/requests.tsp";
import "../../../calling/events/state.tsp";
import "../../../tasking/events/tasks.tsp";

using SignalWire.AsyncAPI;
using TypeSpec.OpenAPI;

namespace Relay.Signalwire;

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
  """)
@channel(signalwireReceive)
@summary("Subscribe to inbound events on one or more contexts")
@extension("x-fern-display-name", signalwireReceive)
op receive(...ReceiveRequest): ReceiveReply | Relay.Calling.CallReceiveEvent | Relay.Tasking.TasksEvent;

@doc("Unsubscribe from one or more contexts so you stop receiving their inbound events.")
@channel(signalwireUnreceive)
@summary("Unsubscribe from inbound events on one or more contexts")
@extension("x-fern-display-name", signalwireUnreceive)
op unreceive(...UnreceiveRequest): UnreceiveReply;
