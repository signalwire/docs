import "@signalwire/typespec-asyncapi";
import "../../../models/core.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Fabric;

@doc("Parameters for `call.member.list`.")
@summary("Member list parameters")
model MemberListParams {
  @doc("The call leg making the request — your own first leg on your call stack.")
  self: Target;
}

@doc("Parameters for `call.member.remove`. Unlike the single-member methods, this takes a list of `targets` to remove in one request.")
@summary("Member remove parameters")
model MemberRemoveParams {
  @doc("The call leg making the request — your own first leg on your call stack.")
  self: Target;

  @doc("The call legs to remove.")
  targets: Target[];
}

@doc("Parameters for `call.member.position.set`. Takes a list of `target`/`position` pairs to reposition in one request.")
@summary("Member position parameters")
model MemberPositionSetParams {
  @doc("The call leg making the request — your own first leg on your call stack.")
  self: Target;

  @doc("The members to reposition, each paired with the layout position to move it to.")
  targets: TargetPosition[];
}
