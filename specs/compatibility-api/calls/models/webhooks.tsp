
model VoiceStatusCallbackPayload {
  @doc("The unique ID of the project this call is associated with.")
  @example("b3877c40-da60-4998-90ad-b792e98472af")
  AccountSid: string;

  @doc("""
    The version of the SignalWire API.
    Incoming calls use the API version placed on the number called.
    Outgoing calls use the version of the REST API request.
    """)
  @example("2010-04-01")
  ApiVersion: string;

  @doc("The value of the `P-Asserted-Identity` SIP header received for the call, when present.")
  @example("<sip:+15551234567@example.com>")
  AssertedIdentity?: string;

  @doc("The average time between packets for the inbound stream.")
  @example(20.03)
  AudioInAveragePtime?: float64;

  @doc("The number of DTMF packets in the inbound media stream.")
  @example(0)
  AudioInDtmfPacketCount?: int32;

  @doc("""
    The number of incoming packets removed from the jitter buffer due to buffer overflow or underflow,
    causing these packets to be discarded or lost.
    """)
  @example(2)
  AudioInFlushPacketCount?: int32;

  @doc("The maximum variance of jitter for incoming audio RTP packets.")
  @example(1.08)
  AudioInJitterMaxVariance?: float64;

  @doc("The minimum variance of jitter for incoming audio RTP packets.")
  @example(0.55)
  AudioInJitterMinVariance?: float64;

  @doc("The largest jitter buffer size recorded for incoming audio RTP packets during the session.")
  @example(4)
  AudioInLargestJbSize?: int32;

  @doc("A mean opinion score on a scale of 1–5 that helps determine audio quality.")
  @example(4.3)
  AudioInMos?: float64;

  @doc("The number of audio packets received in the inbound media stream.")
  @example(1842)
  AudioInMediaPacketCount?: int32;

  @doc("""
    Increased with every packet not received at a given ptime.
    Increases with every lost packet from the inbound stream.
    """)
  @example(1)
  AudioInSkipPacketCount?: int32;

  @doc("The total number of DTMF packets generated in the outbound media stream.")
  @example(0)
  AudioOutDtmfPacketCount?: int32;

  @doc("The average jitter, in milliseconds, of the outgoing audio stream.")
  @example(10.2)
  AudioOutJitterAvg?: float64;

  @doc("The maximum jitter, in milliseconds, of the outgoing audio stream.")
  @example(15.3)
  AudioOutJitterMax?: float64;

  @doc("The minimum jitter, in milliseconds, of the outgoing audio stream.")
  @example(5.1)
  AudioOutJitterMin?: float64;

  @doc("The number of outgoing audio RTP packets reported lost.")
  @example(0)
  AudioOutLost?: int32;

  @doc("The number of audio packets sent in the outbound media stream.")
  @example(1840)
  AudioOutMediaPacketCount?: int32;

  @doc("The total number of packets sent in the outbound media stream.")
  @example(1840)
  AudioOutPacketCount?: int32;

  @doc("The average audio round-trip time, in milliseconds.")
  @example(50.5)
  AudioRttAvg?: float64;

  @doc("The maximum audio round-trip time, in milliseconds.")
  @example(100.8)
  AudioRttMax?: float64;

  @doc("The minimum audio round-trip time, in milliseconds.")
  @example(30.2)
  AudioRttMin?: float64;

  @doc("The source of the status callback.")
  @example("call-progress-events")
  CallbackSource: string;

  @doc("The duration, in seconds, of the finished call. Only present on the `completed` event.")
  @example(94)
  CallDuration?: int32;

  @doc("A unique identifier for the call.")
  @example("b3877c40-da60-4998-90ad-b792e98472ca")
  CallSid: string;

  @doc("""
    The status of the call.

    | Status | Description |
    |--------|-------------|
    | `initiated` | The initial dial has begun. |
    | `ringing` | The call is ringing. |
    | `answered` | The call was answered. Sent only when `StatusCallbackEvent` includes `answered`, and followed by an `in-progress` callback. |
    | `in-progress` | The call was answered and is in progress. |
    | `queued` | The call is ready and in line to initiate. |
    | `failed` | The call could not be completed. Usually occurs when the phone number does not exist. SignalWire also stops a call created through the REST API before dialing it when its caller ID is on the Do Not Originate registry, a spam rule blocks it, it exceeds the outbound call rate limit (`ErrorCode` `20429`), no endpoint is registered to receive it, or a temporary platform error interrupts it. Retrying usually succeeds after a temporary error. |
    | `busy` | The caller encountered a busy signal. |
    | `no-answer` | The call ended without an answer. |
    | `completed` | The call was answered and ended normally. |
    | `canceled` | The REST API canceled the call while it was ringing or queued. |
    """)
  @example("completed")
  CallStatus: "initiated" | "ringing" | "answered" | "in-progress" | "queued" | "failed" | "busy" | "no-answer" | "completed" | "canceled";

  @doc("""
    The direction of the call.
    - `outbound-dial`: calls launched through the Dial verb.
    - `outbound-api`: calls launched through the REST API.
    - `inbound`: inbound calls.
    """)
  @example("outbound-api")
  Direction: "outbound-dial" | "outbound-api" | "inbound";

  @doc("The code for why the call failed, when SignalWire has one. `20429` means the call exceeded the outbound call rate limit. See [Error codes](/docs/compatibility-api/rest/error-codes#20429).")
  @example("20429")
  ErrorCode?: string;

  @doc("The description of `ErrorCode`.")
  @example("Your call was temporarily rate limited due to recent activity. Please reduce your call attempt rate, or contact Support to raise the limits on your account.")
  ErrorMessage?: string;

  @doc("The phone number that sent this call, in E.164 format.")
  @example("+15551234567")
  From: string;

  @doc("The `From` or `To` value of the party that ended the call, as indicated by `HangupDirection`. Present once the call has ended.")
  @example("+15559876543")
  HangupBy?: string;

  @doc("""
    Which side ended the call. Present once the call has ended.
    - `inbound`: the remote party hung up, so `HangupBy` is `From` on an inbound call and `To` on an outbound call.
    - `outbound`: the call was ended from the SignalWire side, so `HangupBy` is `To` on an inbound call and `From` on an outbound call.
    """)
  @example("inbound")
  HangupDirection?: string;

  @doc("A unique identifier for the call that created this call.")
  @example("b3877c40-da60-4998-90ad-b792e98472pa")
  ParentCallSid?: string;

  @doc("The value of the `P-Preferred-Identity` SIP header received for the call, when present.")
  @example("<sip:+15551234567@example.com>")
  PreferredIdentity?: string;

  @doc("The SIP `Call-ID` of the call.")
  @example("f8acbf3b-6d1a-4c55-9f0e-2a7d3c1b9e40")
  SipCallId?: string;

  @doc("A textual description of the result of the SIP INVITE request, indicating success or failure with additional details.")
  @example("OK")
  SipInviteResultPhrase?: string;

  @doc("The numeric SIP response code received for the INVITE request, indicating the outcome of the call attempt. See the [list of SIP response codes](https://en.wikipedia.org/wiki/List_of_SIP_response_codes) for possible values.")
  @example("200")
  SipResultCode?: string;

  @doc("The timestamp, in RFC 2822 format, of when the event occurred.")
  @example("Thu, 04 Apr 2024 18:32:15 +0000")
  Timestamp: string;

  @doc("The phone number of the call recipient, in E.164 format.")
  @example("+15559876543")
  To: string;
}

model RecordingStatusCallbackPayload {
  @doc("The unique ID of the project this call is associated with.")
  @example("b3877c40-da60-4998-90ad-b792e98472af")
  AccountSid: string;

  @doc("""
    A unique identifier for the recorded call. May be used to later retrieve this call from the REST API.
    Present for call recordings; conference recordings send `ConferenceSid` instead.
    """)
  @example("b3877c40-da60-4998-90ad-b792e98472ca")
  CallSid?: string;

  @doc("""
    A unique identifier for the recorded conference.
    Present for conference recordings; call recordings send `CallSid` instead.
    """)
  @example("b3877c40-da60-4998-90ad-b792e984cf01")
  ConferenceSid?: string;

  @doc("The unique identifier for the recording.")
  @example("b3877c40-da60-4998-90ad-b792e984re01")
  RecordingSid: string;

  @doc("""
    The URL for the audio recording.
    For call recordings on accounts created before February 15, 2020, this is a path relative to your Space URL rather than a full URL.
    """)
  @example("https://example.signalwire.com/api/laml/2010-04-01/Accounts/b3877c40-da60-4998-90ad-b792e98472af/Recordings/b3877c40-da60-4998-90ad-b792e984re01")
  RecordingUrl: string;

  @doc("""
    The status of the recording.
    - `in-progress`: Recording has begun.
    - `paused`: Recording was paused. Call recordings only.
    - `resumed`: Recording resumed after a pause. Call recordings only.
    - `completed`: File is available.
    - `absent`: Recording was too short or no audio was detected.
    """)
  @example("completed")
  RecordingStatus: "in-progress" | "paused" | "resumed" | "completed" | "absent";

  @doc("The duration, in seconds, of the recording. Only present when `RecordingStatus` is `completed`.")
  @example(94)
  RecordingDuration?: int32;

  @doc("The number of channels in the recording.")
  @example(1)
  RecordingChannels: int32;

  @doc("The type of call that initiated the recording.")
  @example("RecordVerb")
  RecordingSource: string;

  @doc("""
    Which audio track was recorded.
    - `inbound`: audio received by SignalWire.
    - `outbound`: audio sent by SignalWire.
    - `both`: both tracks.
    """)
  @example("both")
  RecordingTrack: "inbound" | "outbound" | "both";

  @doc("The timestamp, in RFC 2822 format, of when the recording started.")
  @example("Thu, 04 Apr 2024 18:32:15 +0000")
  RecordingStartTime?: string;

  @doc("Whether leading and trailing silence was trimmed from the recording: `trim-silence` or `do-not-trim`.")
  @example("trim-silence")
  Trim?: string;
}
