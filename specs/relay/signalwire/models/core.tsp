import "@signalwire/typespec-asyncapi";

using SignalWire.AsyncAPI;

namespace Relay.Signalwire;

@doc("A `{code, message}` acknowledgement returned by receive and unreceive.")
model Acknowledgement {
  @doc("The result code as a string. `\"200\"` means success; `\"402\"` means payment required.")
  @example("200")
  code: string;

  @doc("A human-readable message describing the result.")
  @example("Receiving all inbound related to the requested relay contexts and available scopes")
  message: string;
}
