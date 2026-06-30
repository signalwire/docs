import "@signalwire/typespec-asyncapi";

import "../../../models/core.tsp";
import "./send.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

model TapResult {
  ...RelayResult;

  @doc("""
    Your requested delivery device echoed back with every parameter resolved
    (codec, sample rate, and so on), so the receiving end knows exactly what
    audio it will get.
    """)
  source_device?: TapDevice;
}

model TapStopResult {
  ...RelayResult;
}
