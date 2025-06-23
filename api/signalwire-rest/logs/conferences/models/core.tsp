@doc("Core conference object.")

@discriminator("type")

model Conference {
  @doc("Unique identifier for the conference.")
  id: string;
  @example("b9028451-b1d3-4690-b5d3-37b19d25f573")

  @doc("Creation timestamp.")
  created_at: string;

  @doc("Last updated timestamp.")
  updated_at: string;
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
  @example("2025-03-11T01:49:51.069Z")
  started_at: string;

  @doc("Ended at date of the conference.")
  @example("2025-03-11T01:50:55.752Z")
  ended_at: string;

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
