import "@typespec/http";
import "../_shared/models.tsp";

using TypeSpec.Http;

@doc("Base room properties used in create/update requests.")
model RoomBaseProperties {
  @doc("Display name of the room. Maximum of 200 characters. Defaults to the value of name.")
  @example("My Room's Name")
  display_name?: string;

  @doc("Description of the room. Maximum of 3000 characters.")
  @example("This room will be used for full company all hands meetings")
  description?: string;

  @doc("The maximum number of members in the room at a time. Must be at least one to a maximum of 300. Defaults to 20.")
  @example(20)
  max_members?: int32;

  @doc("The room's resolution. Allowed values are `720p` or `1080p`. Defaults to `720p`.")
  @example("720p")
  quality?: string;

  @doc("Room does not accept new participants before this time. Overridable by token. Expects RFC 3339 datetime: `2022-01-01T23:59:60Z`. Date only: `2022-01-01` will be converted to `2022-01-01T00:00:00Z`")
  @example(utcDateTime.fromISO("2022-01-01T00:00:00Z"))
  join_from?: utcDateTime;

  @doc("Room stops accepting new participants at this time, but keeps running until all participants leave. Overridable by token. Expects RFC 3339 datetime: `2022-01-01T23:59:60Z`. Date only: `2022-01-01` will be converted to `2022-01-01T00:00:00Z`")
  @example(utcDateTime.fromISO("2022-12-31T23:59:59Z"))
  join_until?: utcDateTime;

  @doc("Remove users from the room at this time. Overridable by token. Expects RFC 3339 datetime: `2022-01-01T23:59:60Z`. Date only: `2022-01-01` will be converted to `2022-01-01T00:00:00Z`")
  @example(utcDateTime.fromISO("2022-12-31T23:59:59Z"))
  remove_at?: utcDateTime;

  @doc("Remove users after they are in the room for N seconds. Overridable by token.")
  @example(120)
  remove_after_seconds_elapsed?: int32;

  @doc("The room's initial layout. Defaults to `grid-responsive`. See documentation for a full list of supported layouts.")
  @example("grid-responsive")
  layout?: string;

  @doc("Specifies whether to start recording a Room Session when one is started for this Room")
  @example(true)
  record_on_start?: boolean;

  @doc("Whether a video with a preview of the content of the room is to be generated.")
  @example(true)
  enable_room_previews?: boolean;

  @doc("Enable/disable jitter buffer audio-video sync.")
  @example(true)
  audio_video_sync?: boolean;
}

@doc("Request body for creating a room.")
model CreateRoomRequest {
  @doc("A named unique identifier for the room. Allowed characters: `A-Za-z0-9_-`. Maximum of 100 characters.")
  @example("my_room")
  name?: string;

  ...RoomBaseProperties;
}

@doc("Request body for updating a room.")
model UpdateRoomRequest {
  ...RoomBaseProperties;
}

@doc("Room response object.")
model RoomResponse {
  @doc("A unique identifier for the room")
  @example("c22d24f6-5a47-4597-9a23-c7d01e696b92")
  id?: string;

  @doc("A named unique identifier for the room. Allowed characters: `A-Za-z0-9_-`. Maximum of 100 characters.")
  @example("my_room")
  name?: string;

  ...RoomBaseProperties;

  @doc("Frames Per Second parameter of room video quality")
  @example(20)
  fps?: int32;

  @doc("Active session information for the room.")
  active_session?: ActiveSession;

  @doc("Timestamp when the room was created.")
  @example(utcDateTime.fromISO("2022-01-01T10:00:00Z"))
  created_at?: utcDateTime;

  @doc("Timestamp when the room was last updated.")
  @example(utcDateTime.fromISO("2022-01-01T11:00:00Z"))
  updated_at?: utcDateTime;
}

@doc("List rooms response.")
model ListRoomsResponse {
  @doc("Pagination links.")
  links?: PaginationLinks;

  @doc("List of rooms.")
  data?: RoomResponse[];
}
