import "../..";

namespace SWML.Calling;

@summary("join_room Method")
model JoinRoom {
  @doc("""
    Join a Relay room. If the call is an unanswered inbound call, the method first tries to answer it.
    If the room doesn't exist, it creates a new room. A room created this way is set to be deleted after its
    room sessions end; an existing room keeps its own settings.
    """)
  @summary("join_room")
  join_room: {
    @doc("""
      Name of the room to join. Allowed characters: A-Z, a-z, 0-9, underscore, and hyphen.
      The room name, after variable expansion, can be at most 100 characters.
      """)
    @example("my-video-room")
    name: string;
  };
}
