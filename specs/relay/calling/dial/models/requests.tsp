import "@signalwire/typespec-asyncapi";

import "../../models/devices.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

model DialParams {
  /** Your label for this dial. Every resulting `calling.call.*` and `calling.call.dial` event carries this `tag`, so use it to match events back to this request. */
  tag: string;

  /** Geographic region to place the outbound call from. */
  region?: string;

  /**
   * Devices to dial. The outer array is sequential ringing groups; the inner
   * array is simultaneous (parallel) dials within a group. The first device to
   * answer wins.
   */
  devices: DialDevice[][];

  /** Highest price per minute you're willing to pay. Devices that would exceed this rate aren't dialed. */
  max_price_per_minute?: float64;
}
