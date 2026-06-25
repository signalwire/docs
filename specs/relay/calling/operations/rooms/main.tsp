import "@signalwire/typespec-asyncapi";

import "./models/requests.tsp";
import "./models/responses.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

@doc("Connects this call into a named audio/video room, bridging it with everyone else already in that room.")
@channel("calling.join_room")
@summary("Join a video/audio room")
@opExample(#{
  parameters: #{ node_id: "a3e1b2c4-...", call_id: "c7f9d2e1-...", name: "my_room" },
  returnType: #{ code: "200", message: "Joining room" },
})
op joinRoom(...JoinRoomParams): JoinRoomResult;

@doc("Removes this call from the room it is currently in. There is no room parameter — it always acts on the call's current room.")
@channel("calling.leave_room")
@summary("Leave the current room")
@opExample(#{
  parameters: #{ node_id: "a3e1b2c4-...", call_id: "c7f9d2e1-..." },
  returnType: #{ code: "200", message: "Leaving room" },
})
op leaveRoom(...LeaveRoomParams): LeaveRoomResult;
