import "@signalwire/typespec-asyncapi";

using SignalWire.AsyncAPI;

namespace Relay.WebRTC;

@doc("The reply to a Verto frame (the WebRTC signaling message format used for peer calls): the Verto outcome plus the node now hosting the call.")
@summary("Verto reply")
model MessageResult {
  @doc("""
    Result code as a string. `"200"` means success. On failure this is a lowercase
    error identifier such as `not_allowed`, `invalid_params`, `internal_error`, or
    `response_timeout`. Always check `code` to tell success from failure.
    """)
  @example("200")
  code: string;

  @doc("The Verto reply payload — for example the answer to a `verto.invite`. The shape depends on the Verto method.")
  result?: Record<unknown>;

  @doc("A human-readable status message. Present on errors and on some informational replies.")
  @example("Received")
  message?: string;

  @doc("The node now hosting the call. Capture it and send it on later frames for this call.")
  @example("a3f1c2d4-5e6f-7a8b-9c0d-1e2f3a4b5c6d")
  node_id?: string;
}
