@doc("""
  Payload sent by SignalWire to your RecordingStatusCallback URL when recording status events occur.
  Configure RecordingStatusCallback (and optionally RecordingStatusCallbackEvent) when creating a call
  or when using Dial, Conference, or Record. SignalWire sends an HTTP GET or POST to your URL with
  these parameters. Use recordingStatusCallbackEvent to request one or more of: in-progress, completed, absent.
  Default is completed.
  """)
model RecordingStatusCallbackPayload {
  @doc("The unique ID of the project this call is associated with.")
  AccountSid: string;

  @doc("A unique identifier for the call. May be used to later retrieve this call from the REST API.")
  CallSid: string;

  @doc("The unique identifier for the recording.")
  RecordingSid: string;

  @doc("The URL for the audio recording.")
  RecordingUrl: string;

  @doc("""
    The status of the recording. Possible values: in-progress (recording has begun),
    completed (file is available), absent (recording was too short or no audio detected).
  """)
  RecordingStatus: string;

  @doc("The duration, in seconds, of the recording.")
  RecordingDuration: int32;

  @doc("The number of channels in the recording.")
  RecordingChannels: int32;

  @doc("The type of call that initiated the recording.")
  RecordingSource: string;
}

@doc("""
  Payload sent by SignalWire to your Inbound Call Status Callback URL for inbound calls to a phone number.
  This webhook is enabled at the phone number level in the dashboard: Phone Numbers → select number → Phone Number Settings.
  By default the webhook is called when the call is completed or failed. Suited for tracking inbound calls,
  success rate, call quality, and total calls.
  """)
model InboundCallStatusCallbackPayload {
  @doc("A unique identifier for the call. May be used to later retrieve this call from the REST API.")
  CallSid: string;

  @doc("The unique ID of the project this call is associated with.")
  AccountSid: string;

  @doc("The From number in E.164 format.")
  From: string;

  @doc("The To number in E.164 format.")
  To: string;

  @doc("The timestamp of the call creation date/time.")
  Timestamp: string;

  @doc("The status of the call. Typically failed or completed.")
  CallStatus: string;

  @doc("The duration, in seconds, of the call.")
  CallDuration: string;

  @doc("The score that represents the quality of the call (1-5).")
  AudioInMos: string;
}

@doc("""
  Payload sent by SignalWire to your 10DLC Status Callback URL when the state of a 10DLC registration object changes.
  Use this webhook to monitor the lifecycle of messaging brands, campaigns, number assignment orders,
  and number assignments in real time.
  """)
model TenDlcStatusCallbackPayload {
  @doc("The unique ID of the project this object is associated with.")
  project_id: string;

  @doc("The timestamp of when the event occurred, in ISO 8601 format.")
  event_at: string;

  @doc("""
    The category of the event.
    One of: brand, campaign, number_assignment_order, number_assignment.
  """)
  event_category: string;

  @doc("""
    The specific type of event that occurred.
    See the 10DLC status callback event types documentation for all possible values.
  """)
  event_type: string;

  @doc("The current state of the object after the event. Possible values depend on the object type.")
  state: string;

  @doc("The unique identifier for the brand. Present in all event types.")
  brand_id: string;

  @doc("The unique identifier for the campaign. Present in campaign, number assignment order, and number assignment events.")
  campaign_id?: string;

  @doc("The unique identifier for the number assignment order. Present in number assignment order and number assignment events.")
  number_assignment_order_id?: string;

  @doc("The unique identifier for the number assignment. Present only in number assignment events.")
  number_assignment_id?: string;

  @doc("The unique identifier for the phone route itself. Present only in number assignment events.")
  phone_number_id?: string;

  @doc("The phone number in E.164 format. Present only in number assignment events.")
  phone_number?: string;
}

@doc("""
  Payload sent by SignalWire to your SMS Status Callback URL when the status of an SMS/MMS message changes.
  Configure this callback using the StatusCallback parameter when sending an outgoing message.
  """)
model SmsStatusCallbackPayload {
  @doc("The current status of the message at the time of the callback.")
  MessageStatus: string;

  @doc("If the message has failed or is undelivered, the error code may provide more information about what went wrong.")
  ErrorCode?: string;

  @doc("The unique ID of this message.")
  MessageSid: string;

  @doc("The unique ID of the project this message is associated with.")
  AccountSid: string;

  @doc("The From number of the message.")
  From: string;

  @doc("The To number of the message.")
  To: string;

  @doc("The body of the message.")
  Body: string;

  @doc("The number of media files that were included with the message.")
  NumMedia: int32;

  @doc("The number of segments that make up the entire message.")
  NumSegments: int32;
}

@doc("""
  Payload sent by SignalWire to your Voice Status Callback URL when the status of a call changes.
  Configure this callback using the StatusCallback and StatusCallbackEvent parameters when creating a call
  via the API or using Dial with Number, SIP, or Conference.
  """)
model VoiceStatusCallbackPayload {
  @doc("The unique ID of the project this call is associated with.")
  AccountSid: string;

  @doc("The version of the SignalWire API used.")
  ApiVersion: string;

  @doc("The average time between packets for the inbound stream.")
  AudioInAveragePtime: int32;

  @doc("The number of DTMF packets in the inbound media stream.")
  AudioInDtmfPacketCount: int32;

  @doc("The number of incoming packets removed from the jitter buffer due to overflow or underflow.")
  AudioInFlushPacketCount: int32;

  @doc("The maximum variance of jitter for incoming audio RTP packets.")
  AudioInJitterMaxVariance: int32;

  @doc("The minimum variance of jitter for incoming audio RTP packets.")
  AudioInJitterMinVariance: int32;

  @doc("The largest jitter buffer size recorded for incoming audio RTP packets during the session.")
  AudioInLargestJbSize: int32;

  @doc("A mean opinion score (1-5) that helps determine inbound audio quality.")
  AudioInMos: string;

  @doc("The number of audio packets received in the inbound media stream.")
  AudioInMediaPacketCount: int32;

  @doc("The number of lost packets from the inbound stream.")
  AudioInSkipPacketCount: int32;

  @doc("The total number of DTMF packets generated in the outbound media stream.")
  AudioOutDtmfPacketCount: int32;

  @doc("The number of audio packets sent in the outbound media stream.")
  AudioOutMediaPacketCount: int32;

  @doc("The source of the status callback.")
  CallbackSource: string;

  @doc("The duration, in seconds, of the finished call. Present on completed events.")
  CallDuration?: int32;

  @doc("The name of the caller, when Caller ID lookup is enabled.")
  CallerName?: string;

  @doc("A unique identifier for the call.")
  CallSid: string;

  @doc("The status of the call (e.g., ringing, initiated, in-progress, queued, failed, busy, no-answer, completed).")
  CallStatus: string;

  @doc("""
    The direction of the call.
    One of: outbound-dial, outbound-api, inbound.
  """)
  Direction: string;

  @doc("The number this call was forwarded from.")
  ForwardedFrom?: string;

  @doc("The phone number that sent this call, in E.164 format.")
  From: string;

  @doc("A unique identifier for the call that created this call.")
  ParentCallSid?: string;

  @doc("The duration, in seconds, of the recording.")
  RecordingDuration?: int32;

  @doc("The unique identifier for the audio recording.")
  RecordingSid?: string;

  @doc("The URL of the recorded audio call.")
  RecordingUrl?: string;

  @doc("The order in which events occur, starting at 0.")
  SequenceNumber: int32;

  @doc("Textual description of the result of the SIP INVITE request.")
  SipInviteResultPhrase?: string;

  @doc("The numeric SIP response code received for the INVITE request.")
  SipResultCode?: string;

  @doc("The timestamp, in RFC 2822 format, of when the event occurred.")
  Timestamp: string;

  @doc("The phone number of the call recipient, in E.164 format.")
  To: string;
}

@doc("""
  Payload sent by SignalWire to your Transcription Status Callback URL when the status of a transcription changes.
  Configure this callback by enabling transcription (transcribe=true) on a recording and setting transcribeCallback
  to your webhook URL.
  """)
model TranscriptionStatusCallbackPayload {
  @doc("The unique ID of the transcription.")
  TranscriptionSid: string;

  @doc("The text of the transcription.")
  TranscriptionText: string;

  @doc("The status of the transcription (completed or failed).")
  TranscriptionStatus: string;

  @doc("The URL for the transcription's REST API resource.")
  TranscriptionUrl: string;

  @doc("The unique ID of the recording from which the transcription was generated.")
  RecordingSid: string;

  @doc("The URL for the audio recording from which the transcription was generated.")
  RecordingUrl: string;
}


