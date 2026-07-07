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
    once, and the first device to answer is the one that gets connected.
    """)
  devices: ConnectDevice[][];

  @doc("Maximum length of the connected call, in seconds. The call ends automatically once this is reached.")
  @example(3600)
  max_duration?: int32;

  @doc("Default ring timeout, in seconds, used when a device doesn't set its own.")
  @minValueExclusive(0)
  @example(30)
  timeout?: float64;

  @doc("DTMF (touch-tone) digits to send once the call is answered. Use `w` or `W` to insert pauses.")
  @example("1234#")
  send_digits?: string;

  @doc("Highest price per minute you're willing to pay. Devices that would exceed this rate aren't called.")
  @example(0.05)
  max_price_per_minute?: float64;

  @doc("""
    URL to receive `calling.call.connect` events via POST as the connection
    progresses through the `connecting`, `connected`, `failed`, and `disconnected`
    statuses.
    """)
  @example("https://example.com/webhooks/relay")
  status_url?: url;
}
