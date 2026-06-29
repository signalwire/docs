import "@signalwire/typespec-asyncapi";

import "./models/requests.tsp";
import "./models/responses.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

model JoinRoomRequest is JsonRpcRequest<"calling.join_room", JoinRoomParams>;
@reply model JoinRoomReply is JsonRpcResponse<JoinRoomResult>;

@doc("Connects this call into a named audio/video room, bridging it with everyone else already in that room.")
@channel("calling.join_room")
@summary("Join a video/audio room")
op joinRoom(...JoinRoomRequest): JoinRoomReply;

model LeaveRoomRequest is JsonRpcRequest<"calling.leave_room", LeaveRoomParams>;
@reply model LeaveRoomReply is JsonRpcResponse<LeaveRoomResult>;

@doc("Removes this call from the room it is currently in. There is no room parameter — it always acts on the call's current room.")
@channel("calling.leave_room")
@summary("Leave the current room")
op leaveRoom(...LeaveRoomRequest): LeaveRoomReply;
