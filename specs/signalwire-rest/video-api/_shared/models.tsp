import "@typespec/http";
import "../../types/status-codes";

using TypeSpec.Http;
using Types.StatusCodes;

@doc("Pagination links for list responses.")
model PaginationLinks {
  @doc("Link to the current page.")
  @example("https://example.signalwire.com/api/video/rooms?page=2")
  self?: string;

  @doc("Link to the first page.")
  @example("https://example.signalwire.com/api/video/rooms?page=1")
  first?: string;

  @doc("Link to the next page.")
  @example("https://example.signalwire.com/api/video/rooms?page=3")
  next?: string;

  @doc("Link to the previous page.")
  @example("https://example.signalwire.com/api/video/rooms?page=1")
  prev?: string;
}

@doc("Video quality resolution.")
enum VideoQuality {
  @doc("720p resolution")
  `720p`,

  @doc("1080p resolution")
  `1080p`,
}

@doc("Active session information for a room.")
model ActiveSession {
  @doc("Unique ID of the session.")
  @example("c22d24f6-5a47-4597-9a23-c7d01e696b92")
  id?: string;

  @doc("Unique ID of the Room if the Session was created from a Room and was not an auto-created Session.")
  @example("a1b2c3d4-5e6f-7890-abcd-ef1234567890")
  room_id?: string;

  @doc("The named identifier of room session.")
  @example("my_example_room")
  name?: string;

  @doc("Display name of room, no character limitations. Maximum of 200 characters. Defaults to the value of name.")
  @example("My Room's Name")
  display_name?: string;

  @doc("Room Session does not accept new Members before this time.")
  @example(utcDateTime.fromISO("2022-01-01T00:00:00Z"))
  join_from?: utcDateTime;

  @doc("Room Session stops accepting new Members at this time.")
  @example(utcDateTime.fromISO("2022-12-31T23:59:59Z"))
  join_until?: utcDateTime;

  @doc("Remove Members from the Room Session at this time.")
  @example(utcDateTime.fromISO("2022-12-31T23:59:59Z"))
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
  @example(utcDateTime.fromISO("2022-01-01T10:00:00Z"))
  start_time?: utcDateTime;

  @doc("End time of the session.")
  @example(utcDateTime.fromISO("2022-01-01T11:00:00Z"))
  end_time?: utcDateTime;

  @doc("How long, in seconds, the Room Session lasted.")
  @example(120)
  duration?: int32;

  @doc("Status of the session.")
  @example("completed")
  status?: string;

  @doc("Whether a recording was automatically started when this Room Session began.")
  @example(true)
  record_on_start?: boolean;

  @doc("Whether a video with a preview of the content of the room is to be generated.")
  @example(true)
  enable_room_previews?: boolean;

  @doc("If room previews are enabled and the room session is in progress, this is the URL of the preview video.")
  @example("https://...")
  preview_url?: string;

  @doc("Enable/disable jitter buffer audio-video sync.")
  @example(true)
  audio_video_sync?: boolean;
}
