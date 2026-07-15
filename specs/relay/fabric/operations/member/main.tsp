import "@signalwire/typespec-asyncapi";
import "../../../common/frames.tsp";
import "@typespec/openapi";

import "./models/send.tsp";
import "./models/reply.tsp";

using SignalWire.AsyncAPI;
using TypeSpec.OpenAPI;

namespace Relay.Fabric;

const callMemberList = "call.member.list";
const callMemberListResponse = "${callMemberList} response";
model MemberListRequest
  is JsonRpcRequest<typeof callMemberList, MemberListParams>;
@extension("x-fern-display-name", callMemberListResponse)
@reply
model MemberListReply is JsonRpcResponse<FabricMemberListResult>;

@doc("Lists the members currently in the room.")
@channel(callMemberList)
@summary("List room members")
@extension("x-fern-display-name", callMemberList)
op memberList(...MemberListRequest): MemberListReply;

const callMemberRemove = "call.member.remove";
const callMemberRemoveResponse = "${callMemberRemove} response";
model MemberRemoveRequest
  is JsonRpcRequest<typeof callMemberRemove, MemberRemoveParams>;
model MemberRemoveResult { ...FabricResult<"Removed">; }
@extension("x-fern-display-name", callMemberRemoveResponse)
@reply
model MemberRemoveReply is JsonRpcResponse<MemberRemoveResult>;

@doc("Removes one or more members from the room. Fires `member.left` for each removed member.")
@channel(callMemberRemove)
@summary("Remove members from the room")
@extension("x-fern-display-name", callMemberRemove)
op memberRemove(...MemberRemoveRequest): MemberRemoveReply;

const callMemberPositionSet = "call.member.position.set";
const callMemberPositionSetResponse = "${callMemberPositionSet} response";
model MemberPositionSetRequest
  is JsonRpcRequest<typeof callMemberPositionSet, MemberPositionSetParams>;
model MemberPositionSetResult { ...FabricResult<"Position set">; }
@extension("x-fern-display-name", callMemberPositionSetResponse)
@reply
model MemberPositionSetReply is JsonRpcResponse<MemberPositionSetResult>;

@doc("Sets the layout position of one or more members. A `member.updated` event follows for each affected member.")
@channel(callMemberPositionSet)
@summary("Set members' layout positions")
@extension("x-fern-display-name", callMemberPositionSet)
op memberPositionSet(...MemberPositionSetRequest): MemberPositionSetReply;
