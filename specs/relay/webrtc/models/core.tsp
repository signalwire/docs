import "@signalwire/typespec-asyncapi";

using SignalWire.AsyncAPI;

namespace Relay.WebRTC;

@doc("""
  The result envelope returned by every WebRTC method. `code` is a string
  (`"200"` on success); on failure you get a non-`"200"` `code` and a
  `message` explaining what went wrong.
  """)
model Result {
  @doc("Result code (string), e.g. `\"200\"`, `\"400\"`, `\"404\"`.")
  code: string;

  @doc("Human-readable result message.")
  message: string;
}
