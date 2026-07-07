import "@signalwire/typespec-asyncapi";
import "@typespec/openapi";

import "../../../models/core.tsp";
import "../../../../common/frames.tsp";

using TypeSpec.OpenAPI;

namespace Relay.Calling;

@doc("""
  What this queue event reports: `enqueue` when the call joins the queue,
  `dequeue` when it is pulled from the queue to be connected, `leave` when it
  exits without connecting, and `stats` for a periodic position/size update while
  it waits. Other values may appear for future event types, so handle unrecognized
  strings gracefully.
  """)
@summary("Queue event type")
union CallQueueStatus {
  "enqueue",
  "dequeue",
  "leave",
  "stats",
  string,
}

@summary("Queue event")
model CallQueueParams {
  ...CallAddress;

  @doc("The `control_id` of the queue session this event refers to, returned when the call entered with `calling.queue.enter`.")
  @example("d4b2e1a0-7c9f-4a3b-8e2d-1f0a9b8c7d6e")
  control_id: string;

  @doc("The call's current standing in the queue.")
  @example("enqueue")
  status?: CallQueueStatus;

  @doc("The queue's unique id.")
  @example("q-9a3f1c2d")
  id?: string;

  @doc("The queue's name.")
  @example("support")
  name?: string;

  @doc("Where this call currently sits in line, counting from the front.")
  @example(0)
  position?: float64;

  @doc("How many calls are currently waiting in the queue.")
  @example(2)
  size?: float64;

  @doc("The average time, in seconds, calls have been spending in this queue.")
  @example(45)
  avg_time?: float64;

  @doc("The time, as a Unix timestamp in seconds, when the call entered the queue.")
  @example(1712345678.123)
  enqueue_ts?: float64;

  @doc("The time, as a Unix timestamp in seconds, when the call was pulled from the queue.")
  @example(1712345723.456)
  dequeue_ts?: float64;

  @doc("The time, as a Unix timestamp in seconds, when the call left the queue.")
  @example(1712345730.789)
  leave_ts?: float64;

  @doc("The status callback URL, echoed back from `calling.queue.enter` when one was set.")
  @example("https://example.com/webhooks/relay")
  status_url?: url;
}

const callingCallQueue = "calling.call.queue";
@doc("Fires as a call moves through a queue — when it joins (`enqueue`), when it is pulled from the queue to be connected (`dequeue`), and when it leaves without connecting (`leave`) — and periodically reports its position and live queue stats (`stats`).")
@summary(callingCallQueue)
@extension("x-fern-display-name", callingCallQueue)
model CallQueueEvent is SignalwireEvent<typeof callingCallQueue, CallQueueParams>;
