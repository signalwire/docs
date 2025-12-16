import "../../Methods";

@summary("JoinRoom object")
model JoinRoom {
  @doc("Joins a RELAY room.")
  @summary("join_room")
  join_room: {
    @doc("The name of the room to join.")
    @example("my-video-room")
    name: string;
  };
}
