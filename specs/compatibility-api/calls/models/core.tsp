import "../../recordings/models/core.tsp";

using TypeSpec.Http;

model CallsAccountSidPath {
  @doc("The Project ID that uniquely identifies the Account.")
  @example("b3877c40-da60-4998-90ad-b792e98472af")
  @path
  AccountSid: uuid;
}

model CallSidPath {
  @doc("The unique identifier for the call.")
  @example("b3877c40-da60-4998-90ad-b792e98472af")
  @path
  Sid: uuid;
}

model CallSidPathForRecording {
  @doc("The unique identifier for the call.")
  @example("b3877c40-da60-4998-90ad-b792e98472af")
  @path
  CallSid: uuid;
}

@doc("Call status.")
enum CallStatus {
  Queued: "queued",
  Ringing: "ringing",
  InProgress: "in-progress",
  Canceled: "canceled",
  Completed: "completed",
  Busy: "busy",
  Failed: "failed",
  NoAnswer: "no-answer",
}

@doc("Call direction.")
enum CallDirection {
  Inbound: "inbound",
  OutboundApi: "outbound-api",
  OutboundDial: "outbound-dial",
}

@doc("Who/what answered the call.")
enum AnsweredBy {
  Human: "human",
  Machine: "machine",
}

@doc("Stream status.")
enum StreamStatus {
  Queued: "queued",
  InProgress: "in-progress",
  Stopped: "stopped",
}

@doc("Stream track options.")
enum StreamTrack {
  InboundTrack: "inbound_track",
  OutboundTrack: "outbound_track",
  BothTracks: "both_tracks",
}

@doc("Call subresource URIs.")
model CallSubresourceUris {
  @doc("The URI for notifications. Always null.")
  @example(null)
  notifications: string | null;

  @doc("The URI for recordings.")
  @example("/api/laml/2010-04-01/Accounts/b3877c40-da60-4998-90ad-b792e98472af/Calls/b3877c40-da60-4998-90ad-b792e98472ca/Recordings.json")
  recordings: string;
}

@doc("Call model representing a voice call.")
model Call {
  @doc("The unique identifier for the call.")
  @example("b3877c40-da60-4998-90ad-b792e98472ca")
  sid: uuid;

  @doc("The unique identifier for the account that created this call.")
  @example("b3877c40-da60-4998-90ad-b792e98472af")
  account_sid: uuid;

  @doc("The date, in RFC 2822 GMT format, this call was created.")
  @example("Wed, 19 Sep 2018 20:00:00 +0000")
  date_created: string;

  @doc("The date, in RFC 2822 GMT format, this call was updated.")
  @example("Wed, 19 Sep 2018 21:00:00 +0000")
  date_updated: string;

  @doc("The unique identifier for the call that created this call.")
  @example("b3877c40-da60-4998-90ad-b792e98472af")
  parent_call_sid: uuid | null;

  @doc("The address that received the call.")
  @example("+13105678901")
  to: string;

  @doc("The formatted number that received the call.")
  @example("(310) 567-8901")
  formatted_to: string;

  @doc("The formatted number that received the call. Alias for formatted_to.")
  @example("(310) 567-8901")
  to_formatted: string;

  @doc("The address that initiated the call.")
  @example("+13103384645")
  from: string;

  @doc("The formatted number that initiated the call.")
  @example("(310) 338-4645")
  formatted_from: string;

  @doc("The formatted number that initiated the call. Alias for formatted_from.")
  @example("(310) 338-4645")
  from_formatted: string;

  @doc("The unique identifier for the phone number.")
  @example("b3877c40-da60-4998-90ad-b792e98472pn")
  phone_number_sid: uuid | null;

  @doc("The status of the call.")
  status: CallStatus;

  @doc("The time, in RFC 2822 GMT format, on which the call began.")
  @example("Wed, 19 Sep 2018 20:00:01 +0000")
  start_time: string | null;

  @doc("The time, in RFC 2822 GMT format, on which the call was terminated.")
  @example("Fri, 21 Sep 2018 10:00:00 +0000")
  end_time: string | null;

  @doc("The duration, in seconds, of the call.")
  @example(20)
  duration: int32;

  @doc("The charge for the call.")
  @example(0.003)
  price: float32 | null;

  @doc("The currency, in ISO 4127 format, for the price of the call.")
  @example("USD")
  price_unit: string;

  @doc("""
    The direction of the call.
    - `inbound`: inbound calls.
    - `outbound-api`: calls launched through the REST API.
    - `outbound-dial`: calls launched through the Dial verb.
    """)
  @example(CallDirection.OutboundApi)
  direction: CallDirection;

  @doc("Who/what the call was answered by.")
  answered_by: AnsweredBy | null;

  @doc("The version of the SignalWire API.")
  @example("2010-04-01")
  api_version: string;

  @doc("The number this call was forwarded from. Always null.")
  @example(null)
  forwarded_from: string | null;

  @doc("The caller name. Always null.")
  @example(null)
  caller_name: string | null;

  @doc("The URI for the call.")
  @example("/api/laml/2010-04-01/Accounts/b3877c40-da60-4998-90ad-b792e98472af/Calls/b3877c40-da60-4998-90ad-b792e98472ca.json")
  uri: string;

  @doc("A Map of available sub-resources.")
  subresource_uris: CallSubresourceUris;

  @doc("The annotation for the call. Always null.")
  @example(null)
  annotation: string | null;

  @doc("The group SID for the call. Always null.")
  @example(null)
  group_sid: string | null;

  @doc("The estimated Mean Opinion Score (MOS) for inbound audio quality, from 1 to 4.5, based on the share of incoming audio packets that arrived without loss or delay. Returned as a decimal string. Null if the call has no quality measurement.")
  @example("4.5")
  audio_in_mos: string | null;

  @doc("The SIP result code for the call.")
  @example("200")
  sip_result_code: string | null;

  @doc("The average round-trip time for audio in milliseconds, in steps of 10.")
  @example(40)
  audio_rtt_avg: float64 | null;

  @doc("The minimum round-trip time for audio in milliseconds, in steps of 10.")
  @example(30)
  audio_rtt_min: float64 | null;

  @doc("The maximum round-trip time for audio in milliseconds, in steps of 10.")
  @example(50)
  audio_rtt_max: float64 | null;

  @doc("The smallest variance measured in the time between incoming audio packets, in milliseconds squared.")
  @example(0.25)
  audio_in_jitter_min: float64 | null;

  @doc("The largest variance measured in the time between incoming audio packets, in milliseconds squared.")
  @example(8.5)
  audio_in_jitter_max: float64 | null;

  @doc("The minimum outbound audio jitter in milliseconds.")
  @example(0)
  audio_out_jitter_min: float64 | null;

  @doc("The maximum outbound audio jitter in milliseconds.")
  @example(2.5)
  audio_out_jitter_max: float64 | null;

  @doc("The average outbound audio jitter in milliseconds.")
  @example(0.56)
  audio_out_jitter_avg: float64 | null;

  @doc("The number of audio packets received in the inbound media stream.")
  @example(1842)
  audio_in_media_packet_count: int32 | null;

  @doc("Not populated. Always `null`; use `audio_out_media_packet_count` for the number of audio packets sent.")
  @example(null)
  audio_out_packet_count: int32 | null;

  @doc("The number of audio packets sent in the outbound media stream.")
  @example(1840)
  audio_out_media_packet_count: int32 | null;

  @doc("The number of outbound audio packets lost.")
  @example(1)
  audio_out_lost: int32 | null;

  @doc("The mean interval between inbound audio packets in milliseconds.")
  @example(20.03)
  audio_in_mean_interval: float64 | null;

  @doc("The number of DTMF packets in the inbound media stream.")
  @example(0)
  audio_in_dtmf_packet_count: int32 | null;

  @doc("The number of DTMF packets in the outbound media stream.")
  @example(0)
  audio_out_dtmf_packet_count: int32 | null;

  @doc("The number of inbound packets not received at the expected interval. Increases with every packet lost from the inbound stream.")
  @example(1)
  audio_in_skip_packet_count: int32 | null;

  @doc("The number of inbound packets removed from the jitter buffer because of buffer overflow or underflow.")
  @example(2)
  audio_in_flush_packet_count: int32 | null;

  @doc("The largest jitter buffer size recorded for inbound audio during the call.")
  @example(4)
  audio_in_largest_jb_size: int32 | null;
}

@doc("Call recording model.")
model CallRecording {
  @doc("The unique identifier for the recording.")
  @example("19e436af-5688-4307-b03b-bdb2b42b8142")
  sid: uuid;

  @doc("The unique identifier for the account that is associated with this recording.")
  @example("720796a0-8ee9-4350-83bd-2d07a3121f1e")
  account_sid: uuid;

  @doc("The version of the SignalWire API.")
  @example("2010-04-01")
  api_version: string;

  @doc("The unique identifier for the call that is associated with this recording. Null if this is a conference recording.")
  @example("43bb71ee-553f-4074-bb20-8e2747647cce")
  call_sid: uuid | null;

  @doc("The unique identifier for the conference that is associated with this recording. Null if this is a call recording.")
  @example(null)
  conference_sid: uuid | null;

  @doc("The number of channels in a recording (singular key). Returns '1' for mono or '2' for stereo.")
  @example("1")
  channel: "1" | "2";

  @doc("The number of channels in a recording. Returns '1' for mono or '2' for stereo.")
  @example("1")
  channels: "1" | "2";

  @doc("The date, in RFC 2822 format, this recording was created.")
  @example("Tue, 25 Sep 2018 23:00:00 +0000")
  date_created: string;

  @doc("The date, in RFC 2822 format, this recording was updated.")
  @example("Wed, 26 Sep 2018 23:00:04 +0000")
  date_updated: string;

  @doc("The time, in RFC 2822 format, this recording started.")
  @example("Tue, 25 Sep 2018 23:00:00 +0000")
  start_time: string | null;

  @doc("The time, in RFC 2822 format, this recording ended.")
  @example("Wed, 26 Sep 2018 23:00:04 +0000")
  end_time: string | null;

  @doc("The length, in seconds, of the recording.")
  @example(4)
  duration: int32;

  @doc("The cost of the recording.")
  @example(0.0025)
  price: float64;

  @doc("The currency of the price of the recording.")
  @example("USD")
  price_unit: string;

  @doc("How the recording was started. A call recording is never `Conference`. Null for a recording made because the call was created through the REST API with `Record` set to `true`.")
  @example(RecordingSource.StartCallRecordingAPI)
  source: RecordingSource | null;

  @doc("The status of the recording.")
  status: RecordingStatus;

  @doc("Further details about a failed recording.")
  @example(null)
  error_code: string | null;

  @doc("The URI of the recording.")
  @example("/api/laml/2010-04-01/Accounts/720796a0-8ee9-4350-83bd-2d07a3121f1e/Recordings/19e436af-5688-4307-b03b-bdb2b42b8142.json")
  uri: string;

  @doc("Subresource URIs.")
  subresource_uris: RecordingSubresourceUris;

  @doc("Encryption details. Always null.")
  @example(null)
  encryption_details: string | null;

  @doc("Whether leading and trailing silence is trimmed from a recording: `trim-silence` or `do-not-trim`. Can be null.")
  @example("do-not-trim")
  trim: string | null;
}

@doc("Call stream model.")
model CallStream {
  @doc("The unique identifier for the stream.")
  @example("b3877c40-da60-4998-90ad-b792e98472st")
  sid: uuid;

  @doc("The unique identifier for the account.")
  @example("b3877c40-da60-4998-90ad-b792e98472af")
  account_sid: uuid;

  @doc("The unique identifier for the call.")
  @example("b3877c40-da60-4998-90ad-b792e98472ca")
  call_sid: uuid;

  @doc("The name of the stream.")
  @example("my_first_stream")
  name: string;

  @doc("The status of the stream.")
  status: StreamStatus;

  @doc("The date, in RFC 2822 GMT format, this stream was updated.")
  @example("Wed, 19 Sep 2018 21:00:00 +0000")
  date_updated: string;

  @doc("The URI for the stream.")
  @example("/api/laml/2010-04-01/Accounts/b3877c40-da60-4998-90ad-b792e98472af/Calls/b3877c40-da60-4998-90ad-b792e98472ca/Streams/b3877c40-da60-4998-90ad-b792e98472st.json")
  uri: string;
}
