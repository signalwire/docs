import "@signalwire/typespec-asyncapi";

using SignalWire.AsyncAPI;

namespace Relay.Tasking;

/** Confirms that SignalWire accepted your `tasking.deliver` request. */
model DeliverResult {
  ...Result;
}
