using TypeSpec.Http;

@doc("Request body for creating a call.")
model CreateCallRequest {
  @doc("The URL to handle the call. Required if `ApplicationSid` is not used.")
  @example("http://your-application.com/docs/voice.xml")
  Url?: string;

  @doc("The unique identifier of the application used to handle the call. Required if `Url` is not used.")
  @format("uuid")
  @example("b3877c40-da60-4998-90ad-b792e98472ap")
  ApplicationSid?: string;

  @doc("The address that initiated the call.")
  @example("+13103384645")
  From?: string;

  @doc("The address that received the call.")
  @example("+13105678901")
  To?: string;

  @doc("The number, in E.164 format, or identifier of the caller.")
  @example("+13102259067")
  CallerId?: string;

  @doc("Whether the request to `FallbackUrl` is a `GET` or a `POST`. Default is `POST`.")
  @example("GET")
  FallbackMethod?: "GET" | "POST" = "POST";

  @doc("The URL SignalWire will request if errors occur when fetching the `Url`.")
  @example("https://your-api-endpoint.com/path")
  FallbackUrl?: string;

  @doc("Whether a human or machine picked up the call.")
  @example("Enable")
  MachineDetection?: "Enable" | "DetectMessageEnd" | "none";

  @doc("Whether or not to execute machine detection asynchronously.")
  @example(false)
  AsyncAmd?: boolean = false;

  @doc("The URL to request when the machine detection is completed.")
  @example("https://your-api-endpoint.com/path")
  AsyncAmdStatusCallback?: string;

  @doc("Whether the request to `AsyncAmdStatusCallback` is a `GET` or a `POST`.")
  @example("GET")
  AsyncAmdStatusCallbackMethod?: "GET" | "POST";

  @doc("Whether or not to report partial (interim) results to the callback url.")
  @example(false)
  AsyncAmdPartialResults?: boolean;

  @doc("Number of milliseconds to wait for initial voice before giving up. Default is `5000` milliseconds.")
  @example(5000)
  MachineDetectionSilenceTimeout?: int32 = 5000;

  @doc("How many milliseconds of voice to decide it is a machine. Must be at least `1000` to a maximum of `6000`. Default is `2400` milliseconds.")
  @example(2400)
  MachineDetectionSpeechThreshold?: int32 = 2400;

  @doc("Number of milliseconds to wait for voice to finish. Must be at least `500` to a maximum of `5000`. Default is `1200` milliseconds.")
  @example(1200)
  MachineDetectionSpeechEndThreshold?: int32 = 1200;

  @doc("The time SignalWire will wait for machine detection before timing out. Default is `30` seconds.")
  @example(30)
  MachineDetectionTimeout?: int32 = 30;

  @doc("How many words to count to decide it is a machine. Must be at least one to a maximum of `100`. Default is `6`.")
  @example(6)
  MachineWordsThreshold?: int32 = 6;

    @doc("The maximum price in USD acceptable for the call to be created.")
    @example(0.0075)
    MaxPricePerMinute?: float32;

  @doc("Whether the request to `Url` is a `GET` or a `POST`. Default is `POST`.")
  @example("POST")
  Method?: "GET" | "POST" = "POST";

  @doc("Whether or not to record a call.")
  @example(false)
  Record?: boolean;

  @doc("The number of channels in the recording.")
  @example("mono")
  RecordingChannels?: "mono" | "dual";

  @doc("The URL to request when recording is available.")
  @example("https://your-api-endpoint.com/path")
  RecordingStatusCallback?: string;

  @doc("Whether the request to `RecordingStatusCallback` URL is a `GET` or a `POST`. Default is `POST`.")
  @example("POST")
  RecordingStatusCallbackMethod?: "GET" | "POST" = "POST";

  @doc("Specifies whether to record the `inbound`, `outbound`, or `both` audio. Defaults to `both`.")
  @example("both")
  RecordingTrack?: "inbound" | "outbound" | "both" = "both";

  @doc("The username to authenticate the caller when making an outbound SIP call.")
  @example("sipuser")
  SipAuthUsername?: string;

  @doc("The password to authenticate the caller when making an outbound SIP call.")
  @example("sippassword")
  SipAuthPassword?: string;

  @doc("The digits to press after a call is connected.")
  @example("w")
  SendDigits?: string;

  @doc("The URL SignalWire will send webhooks to on every requested `StatusCallbackEvent` event.")
  @example("https://your-api-endpoint.com/path")
  StatusCallback?: string;

  @doc("The status events that trigger a SignalWire webhook. Defaults to `completed`.")
  @example(#["completed"])
  StatusCallbackEvent?: string[];

  @doc("Whether the request to `StatusCallback` URL is a `GET` or a `POST`. Default is `POST`.")
  @example("GET")
  StatusCallbackMethod?: "GET" | "POST" = "POST";

  @doc("The time SignalWire will wait before assuming the call has no answer. Max wait time is `600 seconds`. Default is `60` seconds.")
  @example("60")
  Timeout?: string = "60";

  @doc("Whether leading and trailing silence is trimmed from a recording.")
  @example("trim-silence")
  Trim?: "trim-silence" | "do-not-trim" = "trim-silence";
}

@doc("Request body for updating a call.")
model UpdateCallRequest {
  @doc("The URL to handle the call.")
  @example("http://your-application.com/docs/voice.xml")
  Url?: string;

  @doc("Whether the request to `Url` is a `GET` or a `POST`.")
  @example("POST")
  Method?: "GET" | "POST";

  @doc("The status to update the call to.")
  @example("completed")
  Status?: "canceled" | "completed";

  @doc("The URL SignalWire will request if errors occur.")
  @example("https://your-api-endpoint.com/fallback")
  FallbackUrl?: string;

  @doc("Whether the request to `FallbackUrl` is a `GET` or a `POST`.")
  @example("POST")
  FallbackMethod?: "GET" | "POST";

  @doc("The URL SignalWire will send webhooks to.")
  @example("https://your-api-endpoint.com/status")
  StatusCallback?: string;

  @doc("Whether the request to `StatusCallback` is a `GET` or a `POST`.")
  @example("POST")
  StatusCallbackMethod?: "GET" | "POST";
}

@doc("Request body for creating a call stream.")
model CreateCallStreamRequest {
  @doc("Unique name for the Stream, per Call. It is used to stop a Stream by name.")
  @example("my_first_stream")
  Name?: string;

  @doc("This attribute can be one of inbound_track, outbound_track, both_tracks. Default is `both_tracks`.")
  @example("both_tracks")
  Track?: "inbound_track" | "outbound_track" | "both_tracks" = "both_tracks";

  @doc("Whether the request to `StatusCallback` URL is a `GET` or a `POST`. Default is `POST`.")
  @example("GET")
  StatusCallbackMethod?: "GET" | "POST" = "POST";

  @doc("The URL to request to when stream is available.")
  @example("https://your-api-endpoint.com/stream-status")
  StatusCallback?: string;

  @doc("Absolute or relative URL. A WebSocket connection to the url will be established and audio will start flowing towards the Websocket server. The only supported protocol is wss. For security reasons ws is NOT supported.")
  @example("wss://your-application.com/audiostream")
  Url?: string;

  @doc("Custom parameter name to pass towards the wss server")
  @example("FirstName")
  `Parameter1.Name`?: string;

  @doc("Custom parameter value to pass towards the wss server")
  @example("Jane")
  `Parameter1.Value`?: string;

  @doc("Custom parameter name to pass towards the wss server")
  @example("FirstName")
  `Parameter2.Name`?: string;

  @doc("Custom parameter value to pass towards the wss server")
  @example("Jane")
  `Parameter2.Value`?: string;
}

@doc("Request body for updating a call stream.")
model UpdateCallStreamRequest {
  @doc("The status of the stream.")
  @example("stopped")
  Status: "in-progress" | "stopped";
}

@doc("Request body for creating a call recording.")
model CreateCallRecordingRequest {
  @doc("The number of channels in the recording. Can be `mono` (both legs of call recorded under one channel into one recording file) or `dual` (each leg of call recorded in separate channels into one recording file).")
  @example("mono")
  RecordingChannels?: "mono" | "dual";

  @doc("The URL to request to when recording is available.")
  @example("https://your-api-endpoint.com/recording-status")
  RecordingStatusCallback?: string;

  @doc("The different recording statuses. To specify multiple events, separate with a space.")
  @example("completed")
  RecordingStatusCallbackEvent?: "completed" | "in-progress" | "absent";

  @doc("Whether the request to `RecordingStatusCallback` URL is a `GET` or a `POST`. Default is `POST`.")
  @example("GET")
  RecordingStatusCallbackMethod?: "GET" | "POST" = "POST";

  @doc("Specifies whether to record the `inbound` audio to SignalWire from the called party or the `outbound` audio from SignalWire to the called party or `both` the inbound and outbound audio. Defaults to `both`.")
  @example("inbound")
  RecordingTrack?: "inbound" | "outbound" | "both" = "both";

  @doc("Whether leading and trailing silence is trimmed from a recording.")
  @example("trim-silence")
  Trim?: "trim-silence" | "do-not-trim" = "trim-silence";
}

@doc("Request body for updating a call recording.")
model UpdateCallRecordingRequest {
  @doc("The status of the recording.")
  @example("paused")
  Status: "paused" | "in-progress" | "stopped";

  @doc("What to do while recording is paused.")
  @example("silence")
  PauseBehavior?: "skip" | "silence";
}
