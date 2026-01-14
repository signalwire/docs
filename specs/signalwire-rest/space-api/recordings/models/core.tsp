import "../../../types";

using TypeSpec.Http;
using Types;

model RecordingPathID {
  @doc("Unique ID of the recording.")
  @example("3fa85f64-5717-4562-b3fc-2c963f66afa6")
  @format("uuid")
  @path
  id: uuid;
}

@doc("Recording status.")
enum RecordingStatus {
  InProgress: "in-progress",
  Completed: "completed",
  Failed: "failed",
}

@doc("Recording model.")
model Recording {
  @doc("The unique identifier of the recording.")
  @example("3fa85f64-5717-4562-b3fc-2c963f66afa6")
  @format("uuid")
  id: uuid;

  @doc("The call SID associated with the recording.")
  @example("CA1234567890abcdef1234567890abcdef")
  call_sid?: string;

  @doc("The conference SID associated with the recording.")
  conference_sid?: string;

  @doc("The duration of the recording in seconds.")
  @example(120)
  duration?: int32;

  @doc("The status of the recording.")
  status?: RecordingStatus;

  @doc("The number of channels in the recording.")
  @example(1)
  channels?: int32;

  @doc("The source of the recording.")
  @example("StartCallRecordingAPI")
  source?: string;

  @doc("The URL to access the recording.")
  @example("https://api.signalwire.com/api/relay/rest/recordings/3fa85f64-5717-4562-b3fc-2c963f66afa6/audio")
  uri?: string;

  @doc("The URL to access the recording audio.")
  audio_url?: string;

  @doc("Timestamp when the recording started.")
  start_time?: utcDateTime;

  @doc("Timestamp when the recording ended.")
  end_time?: utcDateTime;

  @doc("Timestamp when the recording was created.")
  created_at?: utcDateTime;

  @doc("Timestamp when the recording was last updated.")
  updated_at?: utcDateTime;
}
