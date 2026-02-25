import "../../../../_shared/webhook/decorator.tsp";

@summary("Call status callback")
@doc("""
  Payload sent by SignalWire to your `status_url` when call status events occur.
  Configure the callback URL and events using the `status_url` and `status_events`
  parameters when creating a call with the `dial` command.
  """)
model CallStatusCallbackPayload {
  @doc("The unique identifier of the call.")
  @example("0e9c80d7-a149-4917-892d-420043709f45")
  call_id: string;

  @doc("The current status of the call.")
  @example("answered")
  status: "answered" | "queued" | "initiated" | "ringing" | "ending" | "ended";

  @doc("The origin number or SIP address.")
  @example("+12069708643")
  from: string;

  @doc("The destination number or SIP address.")
  @example("+15550198765")
  to: string;

  @doc("The direction of the call.")
  @example("outbound-api")
  direction: "outbound-api";

  @doc("The type of call.")
  @example("relay_pstn_call")
  type: "relay_pstn_call" | "relay_sip_call" | "relay_webrtc_call";

  @doc("The duration of the call in seconds at the time of the event. Null if the call has not yet been answered.")
  @example(null)
  duration: integer | null;

  @doc("The duration of the call in milliseconds at the time of the event. Null if the call has not yet been answered.")
  @example(null)
  duration_ms: integer | null;

  @doc("The date and time when the call was created.")
  @example("2025-01-15T10:30:00Z")
  created_at: string;
}

@summary("Transcription event callback")
@doc("""
  Payload sent by SignalWire to your webhook URL during live transcription or translation.
  Contains real-time utterance data as speech is recognized.
  """)
model TranscriptionEventPayload {
  @doc("The unique identifier of the call being transcribed.")
  @example("0e9c80d7-a149-4917-892d-420043709f45")
  call_id: string;

  @doc("The type of transcription event.")
  @example("utterance")
  event_type: "utterance" | "summary";

  @doc("The transcribed or translated text.")
  @example("Hello, how can I help you today?")
  text: string;

  @doc("The language of the transcribed text.")
  @example("en-US")
  language: string;

  @doc("The direction of the speaker.")
  @example("local-caller")
  direction: "local-caller" | "remote-caller";

  @doc("Confidence score of the transcription (0-1).")
  @example(0.95)
  confidence: float;

  @doc("Timestamp of the event in ISO 8601 format.")
  @example("2025-01-15T10:30:05Z")
  timestamp: string;
}
