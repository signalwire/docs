import "@signalwire/typespec-asyncapi";

using SignalWire.AsyncAPI;

namespace Relay.WebRTC;

@doc("The reply to your Verto frame: the Verto outcome plus the node now hosting the call.")
@summary("Verto reply")
model VertoResult {
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

@doc("The reply to a `webrtc.message` request: the Verto outcome plus the node hosting the call.")
@summary("WebRTC message reply")
model WebRTCMessageResult {
  @doc("""
    Result code as a string. `"200"` means success. `"400"` means a non-invite frame
    was sent without a `node_id`. Other failures carry a lowercase error identifier
    such as `not_allowed`, `invalid_params`, `internal_error`, or `response_timeout`.
    """)
  @example("200")
  code: string;

  @doc("The Verto reply payload. The shape depends on the Verto method.")
  result?: Record<unknown>;

  @doc("A human-readable status message. Present on errors.")
  @example("Must be a verto.invite or specify node_id")
  message?: string;

  @doc("The node hosting the call. Capture it and send it on later frames for this call.")
  @example("a3f1c2d4-5e6f-7a8b-9c0d-1e2f3a4b5c6d")
  node_id?: string;
}
