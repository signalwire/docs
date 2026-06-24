import "@signalwire/typespec-asyncapi";

import "../../models/core.tsp";

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
