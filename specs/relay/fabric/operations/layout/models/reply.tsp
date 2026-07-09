import "@signalwire/typespec-asyncapi";
import "../../../models/core.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Fabric;

@doc("The result of `call.layout.list`: the standard `FabricResult` fields plus the available layout names.")
@summary("Layout list result")
model FabricLayoutListResult {
  ...FabricResult<"Retrieved layouts">;

  @doc("The names of the layouts available for the room.")
  @example(#["grid-responsive", "highlight-1-responsive"])
  layouts: string[];
}
