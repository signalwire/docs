import "@signalwire/typespec-asyncapi";

import "../models/core.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

// ─────────────────────────────────────────────────────────────────────────────
// calling.call.queue
// ─────────────────────────────────────────────────────────────────────────────

@doc("What just happened to the call in the queue: it entered (`enqueue`), was pulled out to be connected (`dequeue`), or left on its own (`leave`).")
union CallQueueStatus {
  "enqueue",
  "dequeue",
  "leave",
}

model CallQueueParams {
  ...CallAddress;

  @doc("The `control_id` of the queue session this event refers to, returned when the call entered with `calling.queue.enter`.")
  control_id: string;

  @doc("What just happened to the call in the queue.")
  status?: CallQueueStatus;

  @doc("The queue's unique id.")
  id?: string;

  @doc("The queue's name.")
  name?: string;

  @doc("Where this call currently sits in line, counting from the front.")
  position?: float64;

  @doc("How many calls are currently waiting in the queue.")
  size?: float64;

  @doc("The average time, in seconds, calls have been spending in this queue.")
  avg_time?: float64;

  @doc("The time, as a Unix timestamp in seconds, when the call entered the queue.")
  enqueue_ts?: float64;

  @doc("The time, as a Unix timestamp in seconds, when the call was pulled from the queue.")
  dequeue_ts?: float64;

  @doc("The time, as a Unix timestamp in seconds, when the call left the queue.")
  leave_ts?: float64;
}

@doc("Fires as a call moves through a queue — when it joins, gets connected, or leaves — and reports its position along with live queue stats.")
@summary("calling.call.queue")
model CallQueueEvent is SignalwireEvent<"calling.call.queue", CallQueueParams>;
