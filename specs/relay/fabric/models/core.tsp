import "@signalwire/typespec-asyncapi";

using SignalWire.AsyncAPI;

namespace Relay.Fabric;

@doc("""
  The standard result envelope returned by Call Fabric methods: a status `code` and a
  `message`. Most methods return exactly this; `call.member.list` and
  `call.layout.list` add a field on top.
  """)
@summary("Call Fabric result (base)")
model FabricResult {
  @doc("""
    Result code as a string. `"200"` is success. Failures use `"400"` (bad request),
    `"403"` (permission denied, or the operation does not apply to this call),
    `"404"` (not found), `"409"` (conflict), or `"500"` (internal error). When the
    request could not be delivered, `code` is a named string instead, such as
    `"response_timeout"`, `"invalid_params"`, `"not_available"`, `"parse_error"`, or
    `"unknown:<n>"`.
    """)
  @example("200")
  code: string;

  @doc("Human-readable description of the result. Always `\"Success\"` on success; on failure it describes the error, for example `\"Permission denied\"`.")
  @example("Success")
  message?: string;
}

@doc("""
  Addresses a call leg in a Call Fabric session. Call Fabric identifies legs explicitly
  with `{node_id, call_id, member_id}`. Capture these from your `call.state` and member
  events and echo them back on later requests.
  """)
@summary("Call Fabric target")
model Target {
  @doc("The node the target's call leg lives on.")
  @example("a3f1c2d4-5e6f-7a8b-9c0d-1e2f3a4b5c6d")
  node_id: string;

  @doc("The call ID the target was created through.")
  @example("c2a1e9f4-6b3d-4e7a-8f1c-2d3e4f5a6b7c")
  call_id: string;

  @doc("The member ID of the target. Equals `call_id` for a call leg that is not in a conference.")
  @example("c2a1e9f4-6b3d-4e7a-8f1c-2d3e4f5a6b7c")
  member_id: string;
}

@doc("A `target` paired with the layout `position` to move it to. Used by `call.member.position.set`.")
@summary("Target position")
model TargetPosition {
  @doc("The call leg to reposition.")
  target: Target;

  @doc("""
    The layout position to move the member to: `standard-<n>` (for example
    `standard-1`; bare `standard` is rejected), `reserved` or `reserved-<n>`, `auto`,
    `off-canvas`, `full-screen`, or `playback`. `<n>` is 1 to 4 digits.
    """)
  @example("standard-1")
  @pattern("^(standard-\\d{1,4}|reserved(-\\d{1,4})?|auto|off-canvas|full-screen|playback)$")
  position: string;
}

@doc("The state a Call Fabric call leg has moved into.")
@summary("Call Fabric call state")
union FabricCallState {
  "created",
  "ringing",
  "answered",
  "ending",
  "ended",
}
