import "@signalwire/typespec-asyncapi";

import "./models/requests.tsp";
import "./models/responses.tsp";
import "../../events/queue.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

model QueueEnterRequest is JsonRpcRequest<"calling.queue.enter", QueueEnterParams>;
@reply model QueueEnterReply is JsonRpcResponse<QueueEnterResult>;

@doc("Places the active call into a named queue (creating the queue if it doesn't exist yet). Use it to hold callers while you wait for an agent or resource to free up. You get a result confirming entry, and the call's queue position, size, and wait estimate arrive as queue events keyed on your `control_id`.")
@channel("calling.queue.enter")
@summary("Place the call into a queue")
op queueEnter(...QueueEnterRequest): QueueEnterReply | CallQueueEvent;

model QueueLeaveRequest is JsonRpcRequest<"calling.queue.leave", QueueLeaveParams>;
@reply model QueueLeaveReply is JsonRpcResponse<QueueLeaveResult>;

@doc("Removes the active call from the queue it's waiting in. Use it to pull a caller out early, for example to hand them to an agent or end their wait.")
@channel("calling.queue.leave")
@summary("Remove the call from a queue")
op queueLeave(...QueueLeaveRequest): QueueLeaveReply;
