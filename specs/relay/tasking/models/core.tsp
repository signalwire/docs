import "@signalwire/typespec-asyncapi";

using SignalWire.AsyncAPI;

namespace Relay.Tasking;

@doc("""
  The standard result you get back from a Relay call: a `code` and a `message`.
  `code` is a string, and you'll see `"200"` when the call succeeds.
  """)
model Result {
  @doc("The result code, as a string. `\"200\"` means success.")
  code: string;
  @doc("A human-readable description of the result.")
  message: string;
}
