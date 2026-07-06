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
  @example("d4b2e1a0-7c9f-4a3b-8e2d-1f0a9b8c7d6e")
  control_id: string;

  ...SWML.Calling.AIObject;
}

model AiStopParams {
  ...CallAddress;

  @doc("The `control_id` assigned in `calling.ai`.")
  @example("d4b2e1a0-7c9f-4a3b-8e2d-1f0a9b8c7d6e")
  control_id: string;
}
