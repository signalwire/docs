import "@signalwire/typespec-asyncapi";
import "../../../common/frames.tsp";
import "@typespec/openapi";

import "./models/send.tsp";
import "./models/reply.tsp";

using SignalWire.AsyncAPI;
using TypeSpec.OpenAPI;

namespace Relay.Calling;

const callingJoinRoom = "calling.join_room";
const callingJoinRoomResponse = "${callingJoinRoom} response";

model JoinRoomRequest is JsonRpcRequest<typeof callingJoinRoom, JoinRoomParams>;
@extension("x-fern-display-name", callingJoinRoomResponse)
@reply model JoinRoomReply is JsonRpcResponse<JoinRoomResult>;

@doc("Connects this call into a named audio/video room, bridging it with everyone else already in that room.")
@channel(callingJoinRoom)
@summary("Join a video/audio room")
@extension("x-fern-display-name", callingJoinRoom)
op joinRoom(...JoinRoomRequest): JoinRoomReply;

const callingLeaveRoom = "calling.leave_room";
const callingLeaveRoomResponse = "${callingLeaveRoom} response";

model LeaveRoomRequest is JsonRpcRequest<typeof callingLeaveRoom, LeaveRoomParams>;
@extension("x-fern-display-name", callingLeaveRoomResponse)
@reply model LeaveRoomReply is JsonRpcResponse<LeaveRoomResult>;

@doc("Removes this call from the room it is currently in. There is no room parameter — it always acts on the call's current room.")
@channel(callingLeaveRoom)
@summary("Leave the current room")
@extension("x-fern-display-name", callingLeaveRoom)
op leaveRoom(...LeaveRoomRequest): LeaveRoomReply;
