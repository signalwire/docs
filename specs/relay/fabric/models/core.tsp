import "@signalwire/typespec-asyncapi";

using SignalWire.AsyncAPI;

namespace Relay.Fabric;

@doc("""
  The standard result envelope returned by Call Fabric methods: a status `code`, an
  optional `message`, and optional per-member `data`. Most methods return exactly this;
  a few add fields on top.
  """)
@summary("Call Fabric result (base)")
model FabricResult<Message extends valueof string = "OK"> {
  @doc("Result code as a string, e.g. `\"200\"` (success), `\"400\"`, `\"404\"`.")
  @example("200")
  code: string;

  @doc("Human-readable description of the result. Always check `code`; `message` may be omitted when there is nothing extra to report.")
  @example(Message)
  message?: string;

  @doc("Present on partial failures: an array of per-member error entries describing which members the operation could not be applied to and why.")
  data?: unknown[];
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

  @doc("The layout position to move the member to, such as `standard-1`.")
  @example("standard-1")
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
