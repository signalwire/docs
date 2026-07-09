import "@signalwire/typespec-asyncapi";
import "../../../models/core.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Fabric;

@doc("Parameters for `call.layout.list`.")
@summary("Layout list parameters")
model LayoutListParams {
  @doc("The call leg making the request — your own first leg on your call stack.")
  self: Target;
}

@doc("Parameters for `call.layout.set`.")
@summary("Layout set parameters")
model LayoutSetParams {
  @doc("The call leg making the request — your own first leg on your call stack.")
  self: Target;

  @doc("The layout to apply, by name.")
  @example("grid-responsive")
  layout: string;
}
