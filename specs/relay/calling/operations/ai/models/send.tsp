import "@signalwire/typespec-asyncapi";
import "@signalwire/typespec-emit-filter";
import "../../../../../swml/calling";

import "../../../models/core.tsp";

using SignalWire.AsyncAPI;
using SignalWire.EmitFilter;

namespace Relay.Calling;

@@excludeFromEmit(SWMLVar);

model AiParams {
  ...CallAddress;

  @doc("""
    Your own identifier for this AI session. Reuse it later to control the
      session — for example, pass it to `calling.ai.stop` to end the agent.
    """)
  control_id: string;

  ...SWML.Calling.AIObject;
}

model AiStopParams {
  ...CallAddress;

  @doc("The `control_id` assigned in `calling.ai`.")
  control_id: string;
}
