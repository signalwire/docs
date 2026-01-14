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
  FallbackMethod?: "GET" | "POST";

  @doc("The URL SignalWire will request if errors occur when fetching the `Url`.")
  @example("https://your-api-endpoint.com/path")
  FallbackUrl?: string;

  @doc("Whether a human or machine picked up the call.")
  MachineDetection?: "Enable" | "DetectMessageEnd" | "none";

  @doc("Whether or not to execute machine detection asynchronously.")
  AsyncAmd?: boolean;

  @doc("The URL to request when the machine detection is completed.")
  @example("https://your-api-endpoint.com/path")
  AsyncAmdStatusCallback?: string;

  @doc("Whether the request to `AsyncAmdStatusCallback` is a `GET` or a `POST`.")
  @example("GET")
  AsyncAmdStatusCallbackMethod?: "GET" | "POST";

  @doc("Whether or not to report partial (interim) results to the callback url.")
  AsyncAmdPartialResults?: boolean;

  @doc("Number of milliseconds to wait for initial voice before giving up.")
  MachineDetectionSilenceTimeout?: int32;

  @doc("How many milliseconds of voice to decide it is a machine.")
  MachineDetectionSpeechThreshold?: int32;

  @doc("Number of milliseconds to wait for voice to finish.")
  MachineDetectionSpeechEndThreshold?: int32;

  @doc("The time SignalWire will wait for machine detection before timing out.")
  MachineDetectionTimeout?: int32;

  @doc("How many words to count to decide it is a machine.")
  MachineWordsThreshold?: int32;

  @doc("The maximum price in USD acceptable for the call to be created.")
  @example("0.0075")
  MaxPricePerMinute?: float32;

  @doc("Whether the request to `Url` is a `GET` or a `POST`. Default is `POST`.")
  Method?: "GET" | "POST";

  @doc("Whether or not to record a call.")
  Record?: boolean;

  @doc("The number of channels in the recording.")
  RecordingChannels?: "mono" | "dual";

  @doc("The URL to request when recording is available.")
  @example("https://your-api-endpoint.com/path")
  RecordingStatusCallback?: string;

  @doc("Whether the request to `RecordingStatusCallback` URL is a `GET` or a `POST`.")
  @example("POST")
  RecordingStatusCallbackMethod?: "GET" | "POST";

  @doc("Specifies whether to record the `inbound`, `outbound`, or `both` audio.")
  @example("both")
  RecordingTrack?: "inbound" | "outbound" | "both";

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

  @doc("The status events that trigger a SignalWire webhook.")
  StatusCallbackEvent?: string[];

  @doc("Whether the request to `StatusCallback` URL is a `GET` or a `POST`.")
  @example("GET")
  StatusCallbackMethod?: "GET" | "POST";

  @doc("The time SignalWire will wait before assuming the call has no answer.")
  @example("60")
  Timeout?: string;

  @doc("Whether leading and trailing silence is trimmed from a recording.")
  @example("trim-silence")
  Trim?: "trim-silence" | "do-not-trim";
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
  @doc("The URL to stream audio to.")
  Url: string;

  @doc("The name of the stream.")
  Name?: string;

  @doc("The track to stream.")
  Track?: "inbound_track" | "outbound_track" | "both_tracks";

  @doc("The URL to send status callbacks to.")
  StatusCallback?: string;

  @doc("The HTTP method for status callbacks.")
  StatusCallbackMethod?: "GET" | "POST";
}

@doc("Request body for updating a call stream.")
model UpdateCallStreamRequest {
  @doc("The status to update the stream to.")
  Status: "stopped";
}
