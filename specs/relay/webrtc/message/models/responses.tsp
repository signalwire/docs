import "@signalwire/typespec-asyncapi";

using SignalWire.AsyncAPI;

namespace Relay.WebRTC;

/** Confirms that SignalWire received and forwarded your Verto frame. */
model MessageResult {
  ...Result;
}
