import "@signalwire/typespec-asyncapi";

using SignalWire.AsyncAPI;

namespace Relay.Signalwire;

/** A `{code, message}` acknowledgement returned by receive and unreceive. */
model Acknowledgement {
  /** The result code as a string. `"200"` means success; `"402"` means payment required. */
  code: string;
  /** A human-readable message describing the result. */
  message: string;
}
