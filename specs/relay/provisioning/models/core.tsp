import "@signalwire/typespec-asyncapi";

using SignalWire.AsyncAPI;

namespace Relay.Provisioning;

@doc("""
  The `code` and `message` fields shared by every Relay response. `code` is a
  string (e.g. `"200"`); any value other than `"200"` means the request failed.
  """)
model Result {
  @doc("Result code (string). `\"200\"` on success; e.g. `\"400\"`/`\"404\"` on error.")
  code: string;

  @doc("Human-readable result message.")
  message: string;
}
