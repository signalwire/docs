import "@typespec/http";
import "../_shared/models.tsp";

using TypeSpec.Http;

@doc("Charge detail item for logs.")
model ChargeDetail {
  @doc("Description for this charge.")
  @example("Video conference session charge")
  description?: string;

  @doc("Charged amount.")
  @example(0.005)
  charge?: float64;
}

@doc("Log response object.")
model LogResponse {
  @doc("A unique identifier for the log")
  @example("c22d24f6-5a47-4597-9a23-c7d01e696b92")
  id?: string;

  @doc("Source of this log entry.")
  @example("realtime-api")
  source?: string;

  @doc("Type of this log entry.")
  @example("video_conference_session")
  type?: string;

  @doc("URL for the resource associated with this log entry (if available)")
  @example("https://example.signalwire.com/api/video/room_sessions/a1b2c3d4-5e6f-7890-abcd-ef1234567890")
  url?: string;

  @doc("A named unique identifier for the room. Allowed characters: `A-Za-z0-9_-`. Maximum of 100 characters.")
  @example("my_room")
  room_name?: string;

  @doc("Status of the log entry.")
  @example("completed")
  status?: string;

  @doc("Start time of the activity.")
  @example(utcDateTime.fromISO("2022-01-01T10:00:00Z"))
  start_time?: utcDateTime;

  @doc("End time of the activity.")
  @example(utcDateTime.fromISO("2022-01-01T11:00:00Z"))
  end_time?: utcDateTime;

  @doc("Charge amount for this activity.")
  @example(0.01)
  charge?: float64;

  @doc("Details on charges associated with this log.")
  charge_details?: ChargeDetail[];

  @doc("Timestamp when the log was created.")
  @example(utcDateTime.fromISO("2022-01-01T10:00:00Z"))
  created_at?: utcDateTime;

  @doc("Timestamp when the log was last updated.")
  @example(utcDateTime.fromISO("2022-01-01T11:00:00Z"))
  updated_at?: utcDateTime;
}

@doc("List logs response.")
model ListLogsResponse {
  @doc("Pagination links.")
  links?: PaginationLinks;

  @doc("List of logs.")
  data?: LogResponse[];
}
