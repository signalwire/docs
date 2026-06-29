import "@signalwire/typespec-asyncapi";

import "../../models/core.tsp";
import "./models/requests.tsp";
import "../../../calling/events/state.tsp";
import "../../../tasking/events/tasks.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Signalwire;

model ReceiveRequest is JsonRpcRequest<"signalwire.receive", ReceiveParams>;
@reply model ReceiveReply is JsonRpcResponse<Acknowledgement>;
model UnreceiveRequest is JsonRpcRequest<"signalwire.unreceive", UnreceiveParams>;
@reply model UnreceiveReply is JsonRpcResponse<Acknowledgement>;

@doc("""
  Subscribe to one or more contexts so you start receiving inbound events for
  them. This is how you ask SignalWire to deliver unsolicited notifications to
  your connection — most importantly the `calling.call.receive` event for an
  inbound call, which only reaches clients that have subscribed to the call's
  context.
  """)
@channel("signalwire.receive")
@summary("Subscribe to inbound events on one or more contexts")
op receive(...ReceiveRequest): ReceiveReply | Relay.Calling.CallReceiveEvent | Relay.Tasking.TasksEvent;

@doc("Unsubscribe from one or more contexts so you stop receiving their inbound events.")
@channel("signalwire.unreceive")
@summary("Unsubscribe from inbound events on one or more contexts")
op unreceive(...UnreceiveRequest): UnreceiveReply;
