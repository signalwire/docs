import "@signalwire/typespec-asyncapi";

import "../../models/core.tsp";
import "./requests.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

model TapResult {
  ...RelayResult;

  @doc("The call id.")
  call_id?: string;

  @doc("Echo of the tap `control_id`.")
  control_id?: string;

  @doc("""
    Your requested delivery device echoed back with every parameter resolved
    (codec, sample rate, and so on), so the receiving end knows exactly what
    audio it will get.
    """)
  source_device?: TapDevice;
}

model TapStopResult {
  ...RelayResult;

  @doc("Echo of the tap `control_id`.")
  control_id?: string;

  @doc("The call id.")
  call_id?: string;
}
