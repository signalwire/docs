import "@typespec/json-schema";
import "../../Shared/Types/main.tsp";
import "../../Methods";

using TypeSpec.JsonSchema;

@summary("EnterQueueObject object")
model EnterQueueObject {
  @doc("Name of the queue to enter.")
  @example("support-queue")
  queue_name: string;

  @doc("""
    SWML to execute after the bridge completes. This defines what should happen after the call is connected to an agent and the bridge ends.
    Can be either:
    - A URL (http or https) that returns a SWML document
    - An inline SWML document (as a JSON string)
    """)
  @example("https://example.com/post-call-survey")
  transfer_after_bridge: string | SWMLVar;

  @doc("HTTP or HTTPS URL to deliver queue status events. Default not set")
  @example("https://example.com/queue-status")
  status_url?: url;

  @doc("URL for media to play while waiting in the queue. Default hold music will be played if not set")
  @example("https://example.com/queue-music.mp3")
  wait_url?: url | SWMLVar;

  @doc("Maximum time in seconds to wait in the queue before timeout. Default `3600`")
  @minValue(1)
  @example(1800)
  wait_time?: integer | SWMLVar;
}

@summary("EnterQueue object")
model EnterQueue {
  @doc("Place the call in a queue.")
  @summary("enter_queue")
  enter_queue: EnterQueueObject;
}
