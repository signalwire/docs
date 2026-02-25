import "../../../_shared/webhook/decorator.tsp";

@summary("Voice status callback")
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

@summary("Recording status callback")
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
