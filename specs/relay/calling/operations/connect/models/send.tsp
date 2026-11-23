import "@signalwire/typespec-asyncapi";

import "../../../models/core.tsp";
import "../../../models/devices.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

@summary("Connect parameters")
model ConnectParams {
  ...CallAddress;

  @doc("Audio to play to the existing caller while the new device rings. Plays in order until the device answers.")
  ringback?: Ringback[];

  @doc("Your label for the new call leg. Its `calling.call.*` events carry this `tag`.")
  @example("my-tag-1")
  tag?: string;

  @doc("""
    Devices to call and connect. Uses the same layout as `calling.dial`: the outer
    array rings groups in sequence, the inner array rings devices in a group at
    once, and the first device to answer is the one that gets connected. When
    connecting to a `call` or `queue` device, pass exactly one device; only the
    first `stream` device is used.
    """)
  devices: ConnectDevice[][];

  @doc("Maximum length of the connected call, in seconds, from 15 to 14400 (4 hours). The call ends automatically once this is reached. Defaults to 14400; values outside the range are rejected with `\"400\"`.")
  @minValue(15)
  @maxValue(14400)
  @example(3600)
  max_duration?: int32;

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

  @doc("Highest price per minute you're willing to pay. Devices that would exceed this rate aren't called.")
  @minValue(0)
  @example(0.05)
  max_price_per_minute?: float64;

  @doc("""
    URL to receive `calling.call.connect` events via POST as the connection
    progresses through the `connecting`, `connected`, `disconnected`, and `failed`
    statuses.
    """)
  @example("https://example.com/webhooks/relay")
  status_url?: url;

  @doc("""
    What happens to your call when the connected leg hangs up. `true` (default) keeps
    your call up and under your control so you can continue with it, for example to
    play a message or connect it elsewhere. `false` hangs up your call too.
    """)
  @example(true)
  park_after_bridge?: boolean = true;
}
