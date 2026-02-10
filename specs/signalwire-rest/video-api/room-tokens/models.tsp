import "@typespec/http";
import "../_shared/models.tsp";

using TypeSpec.Http;

@doc("Join as type for room tokens.")
enum JoinAsType {
  @doc("Join as audience participant (cannot send audio or video)")
  audience,

  @doc("Join as member")
  member,
}

@doc("Media allowed type for room tokens.")
enum MediaAllowedType {
  @doc("All media allowed")
  all,

  @doc("Video only")
  `video-only`,

  @doc("Audio only")
  `audio-only`,
}

@doc("Request body for creating a room token.")
model CreateRoomTokenRequest {
  @doc("Room's unique named identifier. Allowed characters: A-Za-z0-9_-. Up to 100 characters. The room does not have to exist when the token is created, but must exist prior to joining, or ensure auto_create_room is set to true.")
  @example("my_room")
  room_name: string;

  @doc("A display name to use for the user. Up to 100 characters. (If not supplied, a random alphanumeric string will be returned for each authorization with this token.)")
  @example("John Smith")
  user_name?: string;

  @doc("A list of permissions, which define what user can do once they join the room.")
  @example(#[
    "room.self.audio_mute",
    "room.self.audio_unmute",
    "room.self.video_mute",
    "room.self.video_unmute",
    "room.self.deaf",
    "room.self.undeaf",
    "room.self.set_input_volume",
    "room.self.set_output_volume",
    "room.self.set_input_sensitivity"
  ])
  permissions?: string[];

  @doc("The user can't join the room before this time. Expects RFC 3339 datetime: `2022-01-01T23:59:60Z`. Date only: `2022-01-01` will be converted to `2022-01-01T00:00:00Z`")
  @example(utcDateTime.fromISO("2022-01-01T00:00:00Z"))
  join_from?: utcDateTime;

  @doc("The user can't join the room after this time. Expects RFC 3339 datetime: `2022-01-01T23:59:60Z`. Date only: `2022-01-01` will be converted to `2022-01-01T00:00:00Z`")
  @example(utcDateTime.fromISO("2022-12-31T23:59:59Z"))
  join_until?: utcDateTime;

  @doc("Remove user from the room at this time. Expects RFC 3339 datetime: `2022-01-01T23:59:60Z`. Date only: `2022-01-01` will be converted to `2022-01-01T00:00:00Z`")
  @example(utcDateTime.fromISO("2022-12-31T23:59:59Z"))
  remove_at?: utcDateTime;

  @doc("Remove user after they are in the room for N seconds.")
  @example(900)
  remove_after_seconds_elapsed?: int32;

  @doc("Whether the user joins the room with their audio muted.")
  @example(false)
  join_audio_muted?: boolean;

  @doc("Whether the user joins the room with their video muted.")
  @example(false)
  join_video_muted?: boolean;

  @doc("By default, if the user tries to use this token to join a room that doesn't exist, it will be created with default configuration. Set this to false to require the room to exist beforehand.")
  @example(false)
  auto_create_room?: boolean;

  @doc("Whether to generate a video with a preview of the content of the room. This parameter has effect only if this token auto-creates the room, thus it will be ignored if the room already exists.")
  @example(true)
  enable_room_previews?: boolean;

  @doc("Display name used if a room is auto-created when the token joins. Maximum of 200 characters. Defaults to the value of room_name.")
  @example("My Room")
  room_display_name?: string;

  @doc("Whether to end the room session when the member using this token leaves the room.")
  @example(false)
  end_room_session_on_leave?: boolean;

  @doc("Whether the user should join as a member or as a non-interactive audience participant. Audience participants cannot send audio or video.")
  @example(JoinAsType.member)
  join_as?: JoinAsType;

  @doc("Indicates what media the user is allowed to receive.")
  @example(MediaAllowedType.`video-only`)
  media_allowed?: MediaAllowedType;

  @doc("Set the room meta.")
  room_meta?: Record<unknown>;

  @doc("Set the member meta.")
  meta?: Record<unknown>;

  @doc("Enable/disable jitter buffer audio-video sync.")
  @example(true)
  audio_video_sync?: boolean;
}

@doc("Room token response object.")
model RoomTokenResponse {
  @doc("A Room Token to be used by clients to connect to the Room.")
  @example("eyJ0eXAiOiJWUlQiLCJhbGciOiJIUzUxMiJ9.eyJpYXQiOjE2MjIxMjAxMjMsImp0aSI6ImRmMzFjYTQ4LWRiZGMtNGJjZi1hYWU2LTQ1NWEwOGM5NDg2YSIsInN1YiI6IjBjOTdmNjM1LTFjMTMtNGZjMS04NmY3LWJiMmJlODU5ZDhiOSIsInUiOiJKb2huIERvZSIsInIiOiJteV9zdXBlcl9hd2Vzb21lX3Jvb20iLCJzIjpbInJvb20uc2VsZi5hdWRpb191bm11dGUiXSwiYWNyIjp0cnVlLCJqZiI6MTYyMDg5NjQwMCwianUiOjE2MjA5MDU5NjgsInJhdCI6MTYyMDkwMDAwMCwicnNlIjo5MDB9.5mu_H2PjQLtNBbMsBlS0c91EgsDjJzvZUFgj5-tP4VA0VoHZPIGgV_DLRGKt-BqG-DqC5LhpsdMWEFjhVkTBpQ")
  token?: string;
}

@doc("Room token validation error item.")
model RoomTokenValidationErrorItem {
  @doc("Error type.")
  @example("validation_error")
  type?: string;

  @doc("Error code.")
  @example("invalid_parameter")
  code?: string;

  @doc("Error message.")
  @example("room_name must be present")
  message?: string;

  @doc("Attribute associated with the error.")
  @example("room_name")
  attribute?: string;

  @doc("URL for more information.")
  @example("https://developer.signalwire.com/rest/signalwire-rest/overview/error-codes#field-invalid-parameter")
  url?: string;
}

@doc("Room token validation error response.")
@error
model RoomTokenValidationError {
  @statusCode statusCode: 422;

  @doc("A list of errors")
  errors?: RoomTokenValidationErrorItem[];
}
