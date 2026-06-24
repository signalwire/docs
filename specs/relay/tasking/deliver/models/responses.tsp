import "@signalwire/typespec-asyncapi";

using SignalWire.AsyncAPI;

namespace Relay.Tasking;

@doc("Confirms that SignalWire accepted your `tasking.deliver` request.")
model DeliverResult {
  ...Result;
}
