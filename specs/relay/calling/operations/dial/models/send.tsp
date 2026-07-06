import "@signalwire/typespec-asyncapi";

import "../../../models/devices.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

model DialParams {
  @doc("Your label for this dial. Every resulting `calling.call.*` and `calling.call.dial` event carries this `tag`, so use it to match events back to this request.")
  @example("my-tag-1")
  tag: string;

  @doc("""
    Devices to dial. The outer array is sequential ringing groups; the inner
    array is simultaneous (parallel) dials within a group. The first device to
    answer wins.
    """)
  devices: DialDevice[][];

  @doc("Maximum length of the call, in seconds. The call ends automatically once this is reached.")
  @minValue(0)
  @example(3600)
  max_duration?: int32;

  @doc("Default ring timeout, in seconds, used when a device doesn't set its own.")
  @minValueExclusive(0)
  @example(30)
  timeout?: float64;

  @doc("Highest price per minute you're willing to pay. Devices that would exceed this rate aren't dialed.")
  @example(0.05)
  max_price_per_minute?: float64;
}
