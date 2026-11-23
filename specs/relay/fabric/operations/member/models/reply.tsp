import "@signalwire/typespec-asyncapi";
import "../../../models/core.tsp";
import "../../../models/entities.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Fabric;

@doc("The result of `call.member.list`: the standard `FabricResult` fields plus the room's members.")
@summary("Member list result")
model FabricMemberListResult {
  ...FabricResult;

  @doc("The members currently in the room. On a 1:1 call these are `CallMember` objects (keyed by `member_id`); in a conference they are `Member` objects.")
  members: (CallMember | Member)[];
}
