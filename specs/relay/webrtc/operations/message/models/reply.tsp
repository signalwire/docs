import "@signalwire/typespec-asyncapi";

using SignalWire.AsyncAPI;

namespace Relay.WebRTC;

@doc("The reply to a Verto frame: the Verto outcome plus the node now hosting the call.")
model MessageResult {
  @doc("""
    Result code as a string. `"200"` means success. On failure this is an in-band
    lowercase error slug (for example `not_allowed`, `invalid_params`,
    `internal_error`, `response_timeout`) delivered inside an otherwise-normal
    result — it is not a JSON-RPC error object, so branch on `code`, not on the
    presence of an error.
    """)
  @example("200")
  code: string;

  @doc("The Verto reply payload — for example the answer to a `verto.invite`.")
  result?: Record<unknown>;

  @doc("A status message accompanying the result, present on error and copied replies.")
  @example("Received")
  message?: string;

  @doc("The node now hosting the call. Capture it and send it on later frames for this call.")
  @example("a3f1c2d4-5e6f-7a8b-9c0d-1e2f3a4b5c6d")
  node_id?: string;
}
