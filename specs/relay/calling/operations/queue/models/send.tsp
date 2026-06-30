import "@signalwire/typespec-asyncapi";

import "../../../models/core.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

model QueueEnterParams {
  ...CallAddress;

  @doc("Your own identifier for this queue placement. Reuse it to leave the queue later, and it comes back on queue events so you can correlate them.")
  control_id: string;

  @doc("Name of the queue to place the call in. If no queue by this name exists yet, one is created and the call joins it.")
  queue_name: string;

  @doc("HTTPS URL where SignalWire POSTs queue status updates as the call moves through the queue.")
  status_url?: url;

  @doc("URL of audio to play to the caller while they wait in the queue.")
  wait_url?: url;

  @doc("How long, in seconds, to keep the caller in the queue before giving up.")
  @minValue(0)
  wait_time?: int32;

  @doc("Destination to send the call to after it leaves the queue.")
  execute_after_queue?: string;

  @doc("URL of audio to play to the agent when the queued call is bridged.")
  whisper_url?: url;
}

model QueueLeaveParams {
  ...CallAddress;

  @doc("The `control_id` you used when the call entered the queue.")
  control_id: string;

  @doc("Name of the queue to remove the call from.")
  queue_name: string;

  @doc("ID of the queue to remove the call from. The queue id is reported on queue events.")
  queue_id?: string;

  @doc("HTTPS URL where SignalWire POSTs queue status updates.")
  status_url?: url;
}
