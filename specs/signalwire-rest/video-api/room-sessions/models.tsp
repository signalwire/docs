import "@typespec/http";
import "../_shared/models.tsp";

using TypeSpec.Http;

@doc("Room session response object.")
model RoomSessionResponse {
  @doc("Unique ID of the session.")
  id?: string;

  @doc("Unique ID of the Room if the Session was created from a Room and was not an auto-created Session.")
  room_id?: string;

  @doc("The named identifier of room session.")
  @example("my_example_room")
  name?: string;

  @doc("Display name of room, no character limitations. Maximum of 200 characters. Defaults to the value of name.")
  @example("My Room's Name")
  display_name?: string;

  @doc("Room Session does not accept new Members before this time.")
  join_from?: utcDateTime;

  @doc("Room Session stops accepting new Members at this time.")
  join_until?: utcDateTime;

  @doc("Remove Members from the Room Session at this time.")
  remove_at?: utcDateTime;

  @doc("Remove Members after they are in the Room Session for N seconds.")
  @example(120)
  remove_after_seconds_elapsed?: int32;

  @doc("The Room Session's initial layout. Defaults to `grid-responsive`. See documentation for a full list of supported layouts.")
  @example("grid-responsive")
  layout?: string;

  @doc("The maximum number of members allowed in the room at a time.")
  @example(20)
  max_members?: int32;

  @doc("The Room Session's frames per second. Possible values are `20` or `30`.")
  @example(20)
  fps?: int32;

  @doc("The Room Session's resolution. Possible values are `720p` or `1080p`.")
  @example("720p")
  quality?: string;

  @doc("Start time of the session.")
  start_time?: utcDateTime;

  @doc("End time of the session.")
  end_time?: utcDateTime;

  @doc("How long, in seconds, the Room Session lasted.")
  @example(120)
  duration?: int32;

  @doc("Status of the session.")
  @example("completed")
  status?: string;

  @doc("Whether a recording was automatically started when this Room Session began.")
  record_on_start?: boolean;

  @doc("Whether a video with a preview of the content of the room is to be generated.")
  enable_room_previews?: boolean;

  @doc("If room previews are enabled and the room session is in progress, this is the URL of the preview video.")
  @example("https://...")
  preview_url?: string;

  @doc("Enable/disable jitter buffer audio-video sync.")
  @example(true)
  audio_video_sync?: boolean;
}

@doc("List room sessions response.")
model ListRoomSessionsResponse {
  @doc("Pagination links.")
  links?: PaginationLinks;

  @doc("List of room sessions.")
  data?: RoomSessionResponse[];
}

@doc("Room recording response object.")
model RoomRecordingResponse {
  @doc("Unique ID of the Room Recording")
  id?: string;

  @doc("Unique ID of the Room Session the Room Recording was made in.")
  room_session_id?: string;

  @doc("Status of the recording.")
  @example("completed")
  status?: string;

  @doc("Timestamp of when the Room Recording started.")
  started_at?: utcDateTime;

  @doc("Timestamp of when the Room Recording stopped.")
  finished_at?: utcDateTime;

  @doc("The length of the Room Recording in seconds.")
  @example(120)
  duration?: int32;

  @doc("The number of bytes of the Room Recording file.")
  @example(20971520)
  size_in_bytes?: int32;

  @doc("The MIME type of the Room Recording file.")
  @example("video/mp4")
  format?: string;

  @doc("A temporary URL for accessing your recording file. This URL, by default, is only valid for 15 minutes.")
  @example("https://files.signalwire.com/temporary/link/to/the/recording/file")
  uri?: string;

  @doc("Timestamp when the recording was created.")
  created_at?: utcDateTime;

  @doc("Timestamp when the recording was last updated.")
  updated_at?: utcDateTime;
}

@doc("List room session recordings response.")
model ListRoomSessionRecordingsResponse {
  @doc("Pagination links.")
  links?: PaginationLinks;

  @doc("List of room recordings.")
  data?: RoomRecordingResponse[];
}

@doc("Room session member response object.")
model RoomSessionMemberResponse {
  @doc("Unique ID of the Member")
  id?: string;

  @doc("Display name of the Member")
  name?: string;

  @doc("Unique ID of the Room Session.")
  room_session_id?: string;

  @doc("Timestamp of when the Member joined the Room Session")
  join_time?: utcDateTime;

  @doc("Timestamp of when the Member left the Room Session")
  leave_time?: utcDateTime;

  @doc("How long the Member stayed in the Room Session, in seconds.")
  @example(120)
  duration?: int32;
}

@doc("List room session members response.")
model ListRoomSessionMembersResponse {
  @doc("Pagination links.")
  links?: PaginationLinks;

  @doc("List of room session members.")
  data?: RoomSessionMemberResponse[];
}
