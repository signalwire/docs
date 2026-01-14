using TypeSpec.Http;

@doc("Request body for updating a conference.")
model UpdateConferenceRequest {
  @doc("Whether the request to `AnnounceUrl` is a `GET` or a `POST`. Default is `POST`.")
  @example("POST")
  AnnounceMethod?: "GET" | "POST" = "POST";

  @doc("The URL to send conference announcements to.")
  AnnounceUrl?: string;

  @doc("The status of this conference.")
  @example("completed")
  Status?: string;
}

@doc("Request body for updating a conference participant.")
model UpdateConferenceParticipantRequest {
  @doc("Whether the participant is coaching another call.")
  @example(false)
  Coaching?: boolean;

  @doc("The unique identifier of the participant who is being coached.")
  @format("uuid")
  CallSidToCoach?: string;

  @doc("Whether or not a participant is on hold.")
  Hold?: boolean;

  @doc("Whether the request to `HoldUrl` is a `GET` or a `POST`. Default is `POST`.")
  @example("POST")
  HoldMethod?: "GET" | "POST" = "POST";

  @doc("The URL to send hold music to that will be played when participant is on hold.")
  HoldUrl?: string;

  @doc("Whether or not a participant is muted.")
  Muted?: boolean;
}

@doc("Request body for creating a conference stream.")
model CreateConferenceStreamRequest {
  @doc("The URL to stream audio to.")
  Url: string;

  @doc("The name of the stream.")
  Name?: string;

  @doc("The track to stream. Default is `both_tracks`.")
  Track?: "inbound_track" | "outbound_track" | "both_tracks" = "both_tracks";

  @doc("The URL to send status callbacks to.")
  StatusCallback?: string;

  @doc("The HTTP method for status callbacks. Default is `POST`.")
  StatusCallbackMethod?: "GET" | "POST" = "POST";
}
