import "@signalwire/typespec-asyncapi";

import "../../../models/core.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

model QueueEnterParams {
  ...CallAddress;

  @doc("Your own identifier for this queue placement. Reuse it to leave the queue later, and it comes back on queue events so you can correlate them.")
  @example("d4b2e1a0-7c9f-4a3b-8e2d-1f0a9b8c7d6e")
  control_id: string;

  @doc("Name of the queue to place the call in. If no queue by this name exists yet, one is created and the call joins it.")
  @example("support")
  queue_name: string;

  @doc("HTTP or HTTPS URL where SignalWire POSTs queue status updates as the call moves through the queue.")
  @example("https://example.com/webhooks/relay")
  status_url?: url;

  @doc("URL of audio to play to the caller while they wait in the queue. Has no effect on calls controlled over Relay; it applies only when a call enters the queue from SWML.")
  @example("https://example.com/hold.mp3")
  wait_url?: url;

  @doc("How long, in seconds, to keep the caller in the queue before giving up. Default `180` (3 minutes). Has no effect on calls controlled over Relay; it applies only when a call enters the queue from SWML.")
  @minValue(1)
  @example(180)
  wait_time?: int32;

  @doc("Where to send the call after it leaves the queue — a URL or inline SWML to execute. Has no effect on calls controlled over Relay; it applies only when a call enters the queue from SWML.")
  @example("https://example.com/swml/after-queue")
  execute_after_queue?: string;

  @doc("SWML to run on the queued call just before it is bridged — a URL to a SWML document or inline SWML (a JSON string starting with `{`). Has no effect on calls controlled over Relay; it applies only when a call enters the queue from SWML.")
  @example("https://example.com/swml/whisper")
  whisper_url?: string;
}

model QueueLeaveParams {
  ...CallAddress;

  @doc("The `control_id` you used when the call entered the queue.")
  @example("d4b2e1a0-7c9f-4a3b-8e2d-1f0a9b8c7d6e")
  control_id: string;

  @doc("Name of the queue to remove the call from.")
  @example("support")
  queue_name: string;

  @doc("The id of the queue to remove the call from. The queue id is reported on queue events.")
  @example("q-9a3f1c2d")
  queue_id?: string;

  @doc("HTTP or HTTPS URL where SignalWire POSTs queue status updates.")
  @example("https://example.com/webhooks/relay")
  status_url?: url;
}
