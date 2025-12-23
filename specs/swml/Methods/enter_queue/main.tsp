import "@typespec/json-schema";
import "../../Shared/Types/main.tsp";
import "../../Methods";

using TypeSpec.JsonSchema;

@summary("EnterQueueObject object")
model EnterQueueObject {
  @doc("Name of the queue to enter.")
  queue_name: string;

  @doc("""
    SWML to execute after the bridge completes. This defines what should happen after the call is connected to an agent and the bridge ends.
    Can be either:
    - A URL (http or https) that returns a SWML document
    - An inline SWML document (as a JSON string)
    """)
  transfer_after_bridge: string | SWMLVar;

  @doc("HTTP or HTTPS URL to deliver queue status events. Default not set")
  status_url?: url;

  @doc("URL for media to play while waiting in the queue. Default hold music will be played if not set")
  wait_url?: url | SWMLVar;

  @doc("Maximum time in seconds to wait in the queue before timeout. Default `3600`")
  @minValue(1)
  wait_time?: integer | SWMLVar;
}

@summary("EnterQueue object")
model EnterQueue {
  @doc("Place the call in a queue.")
  @summary("enter_queue")
  enter_queue: EnterQueueObject;
}
