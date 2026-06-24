import "@signalwire/typespec-asyncapi";

import "../models/core.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

// ─────────────────────────────────────────────────────────────────────────────
// calling.call.queue
// ─────────────────────────────────────────────────────────────────────────────

/** What just happened to the call in the queue: it entered (`enqueue`), was pulled out to be connected (`dequeue`), or left on its own (`leave`). */
union CallQueueStatus {
  "enqueue",
  "dequeue",
  "leave",
}

model CallQueueParams {
  ...CallAddress;

  /** The `control_id` of the queue session this event refers to, returned when the call entered with `calling.queue.enter`. */
  control_id: string;

  /** What just happened to the call in the queue. */
  status?: CallQueueStatus;

  /** The queue's unique id. */
  id?: string;

  /** The queue's name. */
  name?: string;

  /** Where this call currently sits in line, counting from the front. */
  position?: float64;

  /** How many calls are currently waiting in the queue. */
  size?: float64;

  /** The average time, in seconds, calls have been spending in this queue. */
  avg_time?: float64;

  /** The time, as a Unix timestamp in seconds, when the call entered the queue. */
  enqueue_ts?: float64;

  /** The time, as a Unix timestamp in seconds, when the call was pulled from the queue. */
  dequeue_ts?: float64;

  /** The time, as a Unix timestamp in seconds, when the call left the queue. */
  leave_ts?: float64;
}

/** Fires as a call moves through a queue — when it joins, gets connected, or leaves — and reports its position along with live queue stats. */
@event("calling.call.queue")
@example(#{
  node_id: "a3e1b2c4-1234-5678-9abc-def012345678",
  call_id: "c7f9d2e1-8765-4321-0fed-cba987654321",
  control_id: "b2d4f6a8-1111-2222-3333-444455556666",
  status: "enqueue",
  id: "q1a2b3c4-aaaa-bbbb-cccc-ddddeeeeffff",
  name: "support",
  position: 3,
  size: 5,
  avg_time: 42.0,
  enqueue_ts: 1718600000.0,
})
model CallQueueEvent {
  ...CallQueueParams;
}
