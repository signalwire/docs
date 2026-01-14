using TypeSpec.Http;

@doc("Request body for creating a call.")
model CreateCallRequest {
  @doc("The URL to handle the call. Required if `ApplicationSid` is not used.")
  @example("http://your-application.com/docs/voice.xml")
  Url?: string;

  @doc("The unique identifier of the application used to handle the call. Required if `Url` is not used.")
  @format("uuid")
  ApplicationSid?: string;

  @doc("The address that initiated the call.")
  @example("+13103384645")
  From: string;

  @doc("The address that received the call.")
  @example("+13105678901")
  To: string;

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
  MachineDetection?: "Enable" | "DetectMessageEnd" | "none";

  @doc("Whether or not to execute machine detection asynchronously.")
  AsyncAmd?: boolean = false;

  @doc("The URL to request when the machine detection is completed.")
  @example("https://your-api-endpoint.com/path")
  AsyncAmdStatusCallback?: string;

  @doc("Whether the request to `AsyncAmdStatusCallback` is a `GET` or a `POST`.")
  @example("GET")
  AsyncAmdStatusCallbackMethod?: "GET" | "POST";

  @doc("Whether or not to report partial (interim) results to the callback url.")
  AsyncAmdPartialResults?: boolean;

  @doc("Number of milliseconds to wait for initial voice before giving up. Default is `5000` milliseconds.")
  MachineDetectionSilenceTimeout?: int32 = 5000;

  @doc("How many milliseconds of voice to decide it is a machine. Must be at least `1000` to a maximum of `6000`. Default is `2400` milliseconds.")
  MachineDetectionSpeechThreshold?: int32 = 2400;

  @doc("Number of milliseconds to wait for voice to finish. Must be at least `500` to a maximum of `5000`. Default is `1200` milliseconds.")
  MachineDetectionSpeechEndThreshold?: int32 = 1200;

  @doc("The time SignalWire will wait for machine detection before timing out. Default is `30` seconds.")
  MachineDetectionTimeout?: int32 = 30;

  @doc("How many words to count to decide it is a machine. Must be at least one to a maximum of `100`. Default is `6`.")
  MachineWordsThreshold?: int32 = 6;

  @doc("The maximum price in USD acceptable for the call to be created.")
  @example("0.0075")
  MaxPricePerMinute?: float32;

  @doc("Whether the request to `Url` is a `GET` or a `POST`. Default is `POST`.")
  Method?: "GET" | "POST" = "POST";

  @doc("Whether or not to record a call.")
  Record?: boolean;

  @doc("The number of channels in the recording.")
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
  SipAuthUsername?: string;

  @doc("The password to authenticate the caller when making an outbound SIP call.")
  SipAuthPassword?: string;

  @doc("The digits to press after a call is connected.")
  @example("w")
  SendDigits?: string;

  @doc("The URL SignalWire will send webhooks to on every requested `StatusCallbackEvent` event.")
  @example("https://your-api-endpoint.com/path")
  StatusCallback?: string;

  @doc("The status events that trigger a SignalWire webhook. Defaults to `completed`.")
  StatusCallbackEvent?: string[];

  @doc("Whether the request to `StatusCallback` URL is a `GET` or a `POST`. Default is `POST`.")
  @example("GET")
  StatusCallbackMethod?: "GET" | "POST" = "POST";

  @doc("The time SignalWire will wait before assuming the call has no answer. Max wait time is `600 seconds`. Default is `60` seconds.")
  @example("60")
  Timeout?: string = "60";

  @doc("Whether leading and trailing silence is trimmed from a recording. Possible values are `trim-silence` or `do-not-trim`. Default is `trim-silence`.")
  @example("trim-silence")
  Trim?: "trim-silence" | "do-not-trim" = "trim-silence";
}

@doc("Request body for updating a call.")
model UpdateCallRequest {
  @doc("The URL to handle the call.")
  @example("http://your-application.com/docs/voice.xml")
  Url?: string;

  @doc("Whether the request to `Url` is a `GET` or a `POST`.")
  Method?: "GET" | "POST";

  @doc("The status to update the call to.")
  Status?: "canceled" | "completed";

  @doc("The URL SignalWire will request if errors occur.")
  FallbackUrl?: string;

  @doc("Whether the request to `FallbackUrl` is a `GET` or a `POST`.")
  FallbackMethod?: "GET" | "POST";

  @doc("The URL SignalWire will send webhooks to.")
  StatusCallback?: string;

  @doc("Whether the request to `StatusCallback` is a `GET` or a `POST`.")
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
  @example("null")
  StatusCallback?: string;

  @doc("Absolute or relative URL. A WebSocket connection to the url will be established and audio will start flowing towards the Websocket server. The only supported protocol is wss. For security reasons ws is NOT supported.")
  @example("wss://your-application.com/audiostream")
  Url?: string;

  @doc("Custom parameter name to pass towards the wss server")
  @example("FirstName")
  @encodedName("application/x-www-form-urlencoded", "Parameter1.Name")
  Parameter1Name?: string;

  @doc("Custom parameter value to pass towards the wss server")
  @example("Jane")
  @encodedName("application/x-www-form-urlencoded", "Parameter1.Value")
  Parameter1Value?: string;

  @doc("Custom parameter name to pass towards the wss server")
  @example("FirstName")
  @encodedName("application/x-www-form-urlencoded", "Parameter2.Name")
  Parameter2Name?: string;

  @doc("Custom parameter value to pass towards the wss server")
  @example("Jane")
  @encodedName("application/x-www-form-urlencoded", "Parameter2.Value")
  Parameter2Value?: string;
}

@doc("Request body for updating a call stream.")
model UpdateCallStreamRequest {
  @doc("The status of the stream.")
  Status: "in-progress" | "stopped";
}

@doc("Request body for creating a recording.")
model CreateRecordingRequest {
  @doc("The number of channels in the recording. Can be `mono` (both legs of call recorded under one channel into one recording file) or `dual` (each leg of call recorded in separate channels into one recording file).")
  RecordingChannels?: "mono" | "dual";

  @doc("The URL to request when recording is available.")
  @example("null")
  RecordingStatusCallback?: string;

  @doc("The different recording statuses. Possible values are `completed`, `in-progress`, and `absent`. To specify multiple events, separate with a space. Defaults to `completed`.")
  @example("completed")
  RecordingStatusCallbackEvent?: "completed" | "in-progress" | "absent";

  @doc("Whether the request to `RecordingStatusCallback` URL is a `GET` or a `POST`. Default is `POST`.")
  @example("GET")
  RecordingStatusCallbackMethod?: "GET" | "POST" = "POST";

  @doc("Specifies whether to record the `inbound` audio to SignalWire from the called party or the `outbound` audio from SignalWire to the called party or `both` the inbound and outbound audio. Defaults to `both`.")
  @example("inbound")
  RecordingTrack?: "inbound" | "outbound" | "both" = "both";

  @doc("Whether leading and trailing silence is trimmed from a recording. Possible values are `trim-silence` and `do-not-trim`. Default is `trim-silence`.")
  @example("trim-silence")
  Trim?: "trim-silence" | "do-not-trim" = "trim-silence";
}

@doc("Request body for updating a recording.")
model UpdateRecordingRequest {
  @doc("The status of the recording.")
  Status: "paused" | "in-progress" | "stopped";

  @doc("What to do while recording is paused.")
  @example("silence")
  PauseBehavior?: "skip" | "silence";
}
