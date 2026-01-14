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
  @doc("The URL to send conference announcements to.")
  AnnounceUrl?: string;

  @doc("Whether the request to `AnnounceUrl` is a `GET` or a `POST`. Default is `POST`.")
  @example("POST")
  AnnounceMethod?: "GET" | "POST" = "POST";

  @doc("Whether or not to play the beep sound when updating the Participant.")
  Beep?: boolean;

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
  @doc("Unique name for the Stream, per Conference. It is used to stop a Stream by name.")
  @example("my_conference_stream")
  Name?: string;

  @doc("This attribute can be one of inbound_track, outbound_track, both_tracks. Default is `both_tracks`.")
  @example("both_tracks")
  Track?: "inbound_track" | "outbound_track" | "both_tracks" = "both_tracks";

  @doc("Whether the request to `StatusCallback` URL is a `GET` or a `POST`. Default is `POST`.")
  @example("GET")
  StatusCallbackMethod?: "GET" | "POST" = "POST";

  @doc("The URL to request to when stream is available.")
  StatusCallback?: string;

  @doc("Absolute or relative URL. A WebSocket connection to the url will be established and audio will start flowing towards the Websocket server. The only supported protocol is wss. For security reasons ws is NOT supported.")
  @example("wss://your-application.com/audiostream")
  Url?: string;

  @doc("The audio codec to use for the stream.")
  @example("PCMU")
  StreamCodec?: "PCMU" | "PCMA" | "L16" | "L16@16000h" | "L16@24000h";

  @doc("Enable real-time streaming for the conference stream.")
  @example(true)
  StreamRealTime?: boolean;
}

@doc("Request body for updating a conference stream.")
model UpdateConferenceStreamRequest {
  @doc("The status of the stream.")
  @example("stopped")
  Status: "in-progress" | "stopped";
}
