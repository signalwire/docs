import "@signalwire/typespec-asyncapi";

using SignalWire.AsyncAPI;

namespace Relay.WebRTC;

@doc("The reply to a Verto frame: the Verto outcome plus the node now hosting the call.")
model MessageResult {
  @doc("Result code as a string, e.g. `\"200\"`.")
  code: string;

  @doc("The Verto reply payload — for example the answer to a `verto.invite`.")
  result?: Record<unknown>;

  @doc("The node now hosting the call. Capture it and send it on later frames for this call.")
  node_id?: string;
}
