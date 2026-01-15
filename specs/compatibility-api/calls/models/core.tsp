import "../../recordings/models/core.tsp";

using TypeSpec.Http;

model CallsAccountSidPath {
  @doc("The Project ID that uniquely identifies the Account.")
  @example("b3877c40-da60-4998-90ad-b792e98472af")
  @format("uuid")
  @path
  AccountSid: string;
}

model CallSidPath {
  @doc("The unique identifier for the call.")
  @example("b3877c40-da60-4998-90ad-b792e98472af")
  @format("uuid")
  @path
  Sid: string;
}

model CallSidPathForRecording {
  @doc("The unique identifier for the call.")
  @example("b3877c40-da60-4998-90ad-b792e98472af")
  @format("uuid")
  @path
  CallSid: string;
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
}

@doc("Call direction.")
enum CallDirection {
  Inbound: "inbound",
  Outbound: "outbound",
}

@doc("Who/what answered the call.")
enum AnsweredBy {
  Human: "human",
  Machine: "machine",
}

@doc("Stream status.")
enum StreamStatus {
  InProgress: "in-progress",
  Stopped: "stopped",
}

@doc("Call subresource URIs.")
model CallSubresourceUris {
  @doc("The URI for notifications.")
  @example("/api/laml/2010-04-01/Accounts/b3877c40-da60-4998-90ad-b792e98472af/Calls/b3877c40-da60-4998-90ad-b792e98472ca/Notifications.json")
  notifications?: string;

  @doc("The URI for recordings.")
  @example("/api/laml/2010-04-01/Accounts/b3877c40-da60-4998-90ad-b792e98472af/Calls/b3877c40-da60-4998-90ad-b792e98472ca/Recordings.json")
  recordings?: string;
}

@doc("Call model representing a voice call.")
model Call {
  @doc("The unique identifier for the account that created this call.")
  @format("uuid")
  @example("b3877c40-da60-4998-90ad-b792e98472af")
  account_sid?: string;

  @doc("The annotation for the call.")
  @example(null)
  annotation?: string | null;

    @doc("Who/what the call was answered by. Possible values are `human` or `machine`.")
    answered_by?: AnsweredBy;

  @doc("The version of the SignalWire API.")
  @example("2010-04-01")
  api_version?: string;

  @doc("The date, in RFC 2822 GMT format, this call was created.")
  @example("Wed, 19 Sept 2018 20:00:00 +0000")
  date_created?: string;

  @doc("The date, in RFC 2822 GMT format, this call was updated.")
  @example("Wed, 19 Sept 2018 21:00:00 +0000")
  date_updated?: string;

    @doc("The direction of the call. Possible values are `inbound` or `outbound`.")
    direction?: CallDirection;

  @doc("The duration, in seconds, of the call.")
  @example(20)
  duration?: int32;

  @doc("The time, in RFC 2822 GMT format, on which the call was terminated.")
  @example("Fri, 21 Sept 2018 10:00:00 +0000")
  end_time?: string;

  @doc("The number this call was forwarded from.")
  @example("+13102259067")
  forwarded_from?: string;

  @doc("The address that initiated the call.")
  @example("+13103384645")
  from?: string;

  @doc("The formatted number that initiated the call.")
  @example("+13102259067")
  formatted_from?: string;

  @doc("The unique identifier for the call that created this call.")
  @format("uuid")
  @example("b3877c40-da60-4998-90ad-b792e98472af")
  parent_call_sid?: string;

  @doc("The unique identifier for the phone number.")
  @format("uuid")
  @example("b3877c40-da60-4998-90ad-b792e98472pn")
  phone_number_sid?: string;

  @doc("The charge for the call.")
  @example(0.003)
  price?: float32;

  @doc("The currency, in ISO 4127 format, for the price of the call.")
  @example("USD")
  price_unit?: string;

  @doc("The unique identifier for the call.")
  @format("uuid")
  @example("b3877c40-da60-4998-90ad-b792e98472ca")
  sid?: string;

  @doc("The time, in RFC 2822 GMT format, on which the call began.")
  @example("Wed, 19 Sept 2018 20:00:01 +0000")
  start_time?: string;

    @doc("The status of the call.")
    status?: CallStatus;

  @doc("A Map of available sub-resources.")
  subresource_uris?: CallSubresourceUris;

  @doc("The address that received the call.")
  @example("+13105678901")
  to?: string;

  @doc("The formatted number that received the call.")
  @example("(310) 567-8901")
  formatted_to?: string;

  @doc("The URI for the call.")
  @example("/api/laml/2010-04-01/Accounts/b3877c40-da60-4998-90ad-b792e98472af/Calls/b3877c40-da60-4998-90ad-b792e98472ca.json")
  uri?: string;
}

@doc("Call recording model.")
model CallRecording {
  @doc("The unique identifier for the account that is associated with this recording.")
  @format("uuid")
  @example("720796a0-8ee9-4350-83bd-2d07a3121f1e")
  account_sid?: string;

  @doc("The version of the SignalWire API.")
  @example("2010-04-01")
  api_version?: string;

  @doc("The unique identifier for the call that is associated with this recording.")
  @example("43bb71ee-553f-4074-bb20-8e2747647cce")
  call_sid?: string;

  @doc("The unique identifier for the conference that is associated with this recording.")
  @example("2071320d-ee82-4578-84e0-379fb227eb77")
  conference_sid?: string;

  @doc("The number of channels in a recording. Possible values are `1` or `2`.")
  @example(1)
  channels?: 1 | 2;

  @doc("The date, in RFC 2822 format, this recording was created.")
  @example("Tue, 25 Sept 2018 23:00:00 +0000")
  date_created?: string;

  @doc("The date, in RFC 2822 format, this recording was updated.")
  @example("Wed, 26 Sept 2018 23:00:04 +0000")
  date_updated?: string;

  @doc("The time, in RFC 2822 format, this recording ended.")
  @example("Wed, 26 Sept 2018 23:00:04 +0000")
  end_time?: string;

  @doc("The cost for the recording.")
  @example("-0.0025")
  price?: string;

  @doc("The currency of the price of the recording.")
  @example("USD")
  price_unit?: string;

  @doc("The length, in seconds, of the recording.")
  @example("4")
  duration?: string;

  @doc("The unique identifier for the recording.")
  @example("19e436af-5688-4307-b03b-bdb2b42b8142")
  sid?: string;

    @doc("How the recording was made.")
    source?: RecordingSource;

    @doc("The status of the recording.")
    status?: RecordingStatus;

  @doc("Further details about a failed recording.")
  @example(null)
  error_code?: string | null;

  @doc("The URI of the recording.")
  uri?: string;

  @doc("Subresource URIs")
  subresource_uris?: RecordingSubresourceUris;
}

@doc("Call stream model.")
model CallStream {
  @doc("The unique identifier for the account.")
  @format("uuid")
  @example("b3877c40-da60-4998-90ad-b792e98472af")
  account_sid?: string;

  @doc("The version of the SignalWire API.")
  @example("2010-04-01")
  api_version?: string;

  @doc("The unique identifier for the call.")
  @format("uuid")
  @example("b3877c40-da60-4998-90ad-b792e98472ca")
  call_sid?: string;

  @doc("The date, in RFC 2822 GMT format, this stream was created.")
  @example("Wed, 19 Sept 2018 20:00:00 +0000")
  date_created?: string;

  @doc("The date, in RFC 2822 GMT format, this stream was updated.")
  @example("Wed, 19 Sept 2018 21:00:00 +0000")
  date_updated?: string;

  @doc("The error code for the stream.")
  @example(null)
  error_code?: int32 | null;

  @doc("The name of the stream.")
  @example("my_first_stream")
  name?: string;

  @doc("The unique identifier for the stream.")
  @format("uuid")
  @example("b3877c40-da60-4998-90ad-b792e98472st")
  sid?: string;

  @doc("The status of the stream.")
  status?: StreamStatus;

  @doc("The URI for the stream.")
  @example("/api/laml/2010-04-01/Accounts/b3877c40-da60-4998-90ad-b792e98472af/Calls/b3877c40-da60-4998-90ad-b792e98472ca/Streams/b3877c40-da60-4998-90ad-b792e98472st.json")
  uri?: string;
}
