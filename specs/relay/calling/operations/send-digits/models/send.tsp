import "@signalwire/typespec-asyncapi";

import "../../../models/core.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

model SendDigitsParams {
  ...CallAddress;

  @doc("Your own identifier for this send-digits operation. Use it to correlate the request with the `calling.call.send_digits` events it produces.")
  control_id: string;

  @doc("""
    The string of DTMF tones to play, in order. Allowed characters are the digits
    `0`-`9`, `*`, `#`, and `A`-`D` (case-insensitive), plus `w` for a short pause
    and `W` for a longer pause (repeat them for longer waits). The whole string is
    rejected if it contains any other character.
    """)
  digits: string;
}
