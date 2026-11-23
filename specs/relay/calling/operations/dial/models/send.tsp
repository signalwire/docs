import "@signalwire/typespec-asyncapi";

import "../../../models/devices.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

@summary("Dial parameters")
model DialParams {
  @doc("Your label for this dial. Every resulting `calling.call.*` and `calling.call.dial` event carries this `tag`, so use it to match events back to this request. Optional, but set it: the dial result returns no `call_id`, so this tag is your only handle for correlating the resulting call and its events.")
  @example("my-tag-1")
  tag?: string;

  @doc("""
    Devices to dial. The outer array is sequential ringing groups; the inner
    array is simultaneous (parallel) dials within a group. The first device to
    answer wins. Up to 20 devices in total; devices beyond the limit are skipped
    and reported in the result's `message_data`.
    """)
  devices: DialDevice[][];

  @doc("Default ring timeout, in seconds, used when a device doesn't set its own. Fractions are truncated. Defaults to 60.")
  @minValue(1)
  @example(30)
  timeout?: float64;

  @doc("""
    DTMF (touch-tone) digits to send once the call is answered: `0`-`9`, `*`, `#`,
    and `A`-`D`. Use `w` or `W` to wait and `,` to pause. At most 98 characters.
    """)
  @minLength(1)
  @maxLength(98)
  @example("1234#")
  send_digits?: string;

  @doc("Highest price per minute you're willing to pay. Devices that would exceed this rate aren't dialed.")
  @minValue(0)
  @example(0.05)
  max_price_per_minute?: float64;
}
