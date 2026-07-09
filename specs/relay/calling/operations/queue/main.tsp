import "@signalwire/typespec-asyncapi";
import "../../../common/frames.tsp";
import "@typespec/openapi";

import "./models/send.tsp";
import "./models/reply.tsp";
import "./models/events.tsp";

using SignalWire.AsyncAPI;
using TypeSpec.OpenAPI;

namespace Relay.Calling;

const callingQueueEnter = "calling.queue.enter";
const callingQueueEnterResponse = "${callingQueueEnter} response";

model QueueEnterRequest
  is JsonRpcRequest<typeof callingQueueEnter, QueueEnterParams>;
@extension("x-fern-display-name", callingQueueEnterResponse)
@reply
model QueueEnterReply is JsonRpcResponse<QueueEnterResult>;

@doc("Places the active call into a named queue (creating the queue if it doesn't exist yet). Use it to hold callers while you wait for an agent or resource to free up. You get a result confirming entry, and the call's queue position, size, and wait estimate arrive as queue events keyed on your `control_id`.")
@channel(callingQueueEnter)
@summary("Place the call into a queue")
@extension("x-fern-display-name", callingQueueEnter)
op queueEnter(...QueueEnterRequest): QueueEnterReply | CallQueueEvent;

const callingQueueLeave = "calling.queue.leave";
const callingQueueLeaveResponse = "${callingQueueLeave} response";

model QueueLeaveRequest
  is JsonRpcRequest<typeof callingQueueLeave, QueueLeaveParams>;
@extension("x-fern-display-name", callingQueueLeaveResponse)
@reply
model QueueLeaveReply is JsonRpcResponse<QueueLeaveResult>;

@doc("Removes the active call from the queue it's waiting in. Use it to pull a caller out early, for example to hand them to an agent or end their wait.")
@channel(callingQueueLeave)
@summary("Remove the call from a queue")
@extension("x-fern-display-name", callingQueueLeave)
op queueLeave(...QueueLeaveRequest): QueueLeaveReply;
