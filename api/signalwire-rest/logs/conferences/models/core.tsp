@doc("Core conference object.")

model Conference {
  @doc("Unique identifier for the conference.")
  @example("b9028451-b1d3-4690-b5d3-37b19d25f573")
  id: string;

  @doc("Creation timestamp.")
  @example(utcDateTime.fromISO("2025-03-11T01:49:49.630Z"))
  created_at: utcDateTime;
}

model BaseConference extends Conference {
  @doc("Project ID of the conference.")
  @example("a77ce7d0-6ae8-4b33-a7a6-0bf1750d1e19")
  project_id: uuid;

  @doc("Region of the conference.")
  @example("us1")
  region: string;

  @doc("Name of the conference.")
  @example("conference")
  name: string;

  @doc("Status of the conference.")
  @example("in-progress")
  status: string;

  @doc("Maximum size of the conference.")
  @example(2)
  max_size: integer;

  @doc("Current participants in the conference.")
  @example(1)
  current_participants: integer;

  @doc("Updated timestamp.")
  @example(utcDateTime.fromISO("2025-03-12T01:49:49.630Z"))
  updated_at: utcDateTime;
}

model LamlConference extends BaseConference {}

model RelayConference extends BaseConference {
  @doc("Recording URL of the conference.")
  @example("http://record.com")
  recording_url: string;

  @doc("Recording duration of the conference.")
  @example(123)
  recording_duration: integer;

  @doc("Recording file size of the conference.")
  @example(12345)
  recording_file_size: integer;
}

model VideoRoomSessionConference extends Conference {
  @doc("Source of the conference.")
  @example("realtime_api")
  source: string;

  @doc("Type of the conference.")
  @example("video_conference_session")
  type: "video_conference_session";

  @doc("Url of the conference.")
  @example("https://test.signalwire.com/api/video/room_sessions/b9028451-b1d3-4690-b5d3-37b19d25f573")
  url: string;

  @doc("Name of the conference.")
  @example("dmjjSRZphrx8Y1do2MwE")
  room_name: string;

  @doc("Status of the conference.")
  @example("completed")
  status: string;

  @doc("Locks the conference.")
  @example(false)
  locked: boolean;

  @doc("Started at date of the conference.")
  @example(utcDateTime.fromISO("2025-03-11T01:49:51.069Z"))
  started_at: utcDateTime;

  @doc("Ended at date of the conference.")
  @example(utcDateTime.fromISO("2025-03-11T01:50:55.752Z"))
  ended_at: utcDateTime;

  @doc("Total charge amount of the conference.")
  @example("0.0")
  charge: string;

  @doc("Details on charges associated with this conference.")
  charge_details: ChargeDetails[];
}

model ChargeDetails {
  @doc("Description for this charge.")
  @example("Tax")
  description: string;

  @doc("Charged amount.")
  @example(60000)
  amount: integer;
}
