import "@signalwire/typespec-asyncapi";
import "../../../models/core.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Fabric;

@doc("Parameters for `call.layout.list`.")
@summary("Layout list parameters")
model LayoutListParams {
  @doc("The call leg you're operating from — your own leg on this call.")
  self: Target;

  @doc("The call leg addressing the room whose layouts to list — required. Normally set `target` equal to `self`.")
  target: Target;
}

@doc("Parameters for `call.layout.set`.")
@summary("Layout set parameters")
model LayoutSetParams {
  @doc("The call leg you're operating from — your own leg on this call.")
  self: Target;

  @doc("The call leg addressing the room to set the layout on — required. Normally set `target` equal to `self`.")
  target: Target;

  @doc("The layout to apply, by name.")
  @example("grid-responsive")
  layout: string;
}
