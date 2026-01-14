import "@typespec/http";
import "../../types/status-codes";

using TypeSpec.Http;
using Types.StatusCodes;

@doc("Pagination links for list responses.")
model PaginationLinks {
  @doc("Link to the current page.")
  self?: string;

  @doc("Link to the first page.")
  first?: string;

  @doc("Link to the next page.")
  next?: string;

  @doc("Link to the previous page.")
  prev?: string;
}

@doc("Video quality resolution.")
enum VideoQuality {
  @doc("720p resolution")
  `720p`,

  @doc("1080p resolution")
  `1080p`,
}

@doc("Video API error response.")
@error
model VideoError {
  @statusCode statusCode: 400 | 401 | 422;

  @doc("Error type.")
  @example("validation_error")
  type: string;

  @doc("Error code.")
  @example("invalid_parameter")
  code: string;

  @doc("Error details.")
  @example("Name must be present")
  message: string;

  @doc("Request parameter associated with this error.")
  @example("name")
  attribute?: string;

  @doc("Link to developer resource for this error.")
  @example("https://developer.signalwire.com/rest/signalwire-rest/overview/error-codes#field-invalid-parameter")
  url: string;
}

@doc("Active session information for a room.")
model ActiveSession {
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
