import "@signalwire/typespec-asyncapi";
import "../../../../common/frames.tsp";
import "@typespec/openapi";

import "../../../models/core.tsp";

using TypeSpec.OpenAPI;

namespace Relay.Calling;

@doc("The outcome of the room membership change this event reports: the call `joined` the room, `failed` to join, chose to `leave`, `cancel`-led before joining, or was rejected because the room was `locked`.")
union CallRoomJoinStatus {
  "joined",
  "failed",
  "leave",
  "cancel",
  "locked",
}

model CallRoomParams {
  ...CallEventAddress;

  @doc("The outcome of the room membership change this event reports.")
  @example("joined")
  join_status: CallRoomJoinStatus;

  @doc("The name of the room this call joined or left. Present when the room is known.")
  @example("my_room")
  room_name?: string;
}

const callingCallRoom = "calling.call.room";
@doc("Fires when a call joins, leaves, or is prevented from joining a video/audio room. Check `join_status` to see what happened.")
@summary(callingCallRoom)
@extension("x-fern-display-name", callingCallRoom)
model CallRoomEvent is SignalwireEvent<typeof callingCallRoom, CallRoomParams>;
