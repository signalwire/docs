import "@signalwire/typespec-asyncapi";

import "../../models/core.tsp";
import "../../models/devices.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

model ConnectParams {
  ...CallAddress;

  /** Audio to play to the existing caller while the new device rings. Plays in order until the device answers. */
  ringback?: Ringback[];

  /** Your label for the new call leg. Its `calling.call.*` events carry this `tag`. */
  tag?: string;

  /**
   * Devices to call and connect. Uses the same layout as `calling.dial`: the outer
   * array rings groups in sequence, the inner array rings devices in a group at
   * once, and the first device to answer is the one that gets connected.
   */
  devices: ConnectDevice[][];

  /** Maximum length of the connected call, in seconds. The call ends automatically once this is reached. */
  max_duration?: int32;

  /** Highest price per minute you're willing to pay. Devices that would exceed this rate aren't called. */
  max_price_per_minute?: float64;

  /**
   * URL to receive `calling.call.connect` events via POST as the connection
   * progresses through the `connecting`, `connected`, `failed`, and `disconnected`
   * statuses.
   */
  status_url?: url;
}
