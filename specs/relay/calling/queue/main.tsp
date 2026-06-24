import "@signalwire/typespec-asyncapi";

import "./models/requests.tsp";
import "./models/responses.tsp";
import "../events/queue.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

/** Places the active call into a named queue (creating the queue if it doesn't exist yet). Use it to hold callers while you wait for an agent or resource to free up. You get a result confirming entry, and the call's queue position, size, and wait estimate arrive as queue events keyed on your `control_id`. */
@channel("calling.queue.enter")
@summary("Place the call into a queue")
@opExample(#{
  parameters: #{
    node_id: "a3b3e8e0-1234-4a4b-8c8d-000000000001",
    call_id: "b4c4f9f1-2345-4b5c-9d9e-000000000002",
    control_id: "queue-1",
    queue_name: "support",
    status_url: "https://example.com/queue-webhook",
  },
  returnType: #{ code: "200", message: "Entering Queue", control_id: "queue-1" },
})
op queueEnter(...QueueEnterParams): QueueEnterResult | CallQueueEvent;

/** Removes the active call from the queue it's waiting in. Use it to pull a caller out early, for example to hand them to an agent or end their wait. */
@channel("calling.queue.leave")
@summary("Remove the call from a queue")
@opExample(#{
  parameters: #{
    node_id: "a3b3e8e0-1234-4a4b-8c8d-000000000001",
    call_id: "b4c4f9f1-2345-4b5c-9d9e-000000000002",
    control_id: "queue-1",
    queue_name: "support",
    queue_id: "q-7f9d2e1c",
    status_url: "https://example.com/queue-webhook",
  },
  returnType: #{ code: "200", message: "Leaving Queue", control_id: "queue-1" },
})
op queueLeave(...QueueLeaveParams): QueueLeaveResult;
