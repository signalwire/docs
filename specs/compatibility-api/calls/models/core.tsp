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

@doc("Call subresource URIs.")
model CallSubresourceUris {
  @doc("The URI for notifications.")
  notifications?: string;

  @doc("The URI for recordings.")
  recordings?: string;
}

@doc("Call model representing a voice call.")
model Call {
  @doc("The unique identifier for the account that created this call.")
  @format("uuid")
  account_sid?: string;

  @doc("The annotation for the call.")
  annotation?: string;

  @doc("Who/what the call was answered by. Possible values are `human` or `machine`.")
  @example("machine")
  answered_by?: string;

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
  @example("inbound")
  direction?: string;

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
  parent_call_sid?: string;

  @doc("The unique identifier for the phone number.")
  @format("uuid")
  phone_number_sid?: string;

  @doc("The charge for the call.")
  @example(0.003)
  price?: float32;

  @doc("The currency, in ISO 4127 format, for the price of the call.")
  @example("USD")
  price_unit?: string;

  @doc("The unique identifier for the call.")
  @format("uuid")
  sid?: string;

  @doc("The time, in RFC 2822 GMT format, on which the call began.")
  @example("Wed, 19 Sept 2018 20:00:01 +0000")
  start_time?: string;

  @doc("The status of the call.")
  @example("queued")
  status?: string;

  @doc("A Map of available sub-resources.")
  subresource_uris?: CallSubresourceUris;

  @doc("The address that received the call.")
  @example("+13105678901")
  to?: string;

  @doc("The formatted number that received the call.")
  @example("(310) 567-8901")
  formatted_to?: string;

  @doc("The URI for the call.")
  uri?: string;
}

@doc("Call recording model.")
model CallRecording {
  @doc("The unique identifier for the account.")
  @format("uuid")
  account_sid?: string;

  @doc("The version of the SignalWire API.")
  @example("2010-04-01")
  api_version?: string;

  @doc("The unique identifier for the call.")
  @format("uuid")
  call_sid?: string;

  @doc("The unique identifier for the conference.")
  @format("uuid")
  conference_sid?: string;

  @doc("The date, in RFC 2822 GMT format, this recording was created.")
  @example("Wed, 19 Sept 2018 20:00:00 +0000")
  date_created?: string;

  @doc("The date, in RFC 2822 GMT format, this recording was updated.")
  @example("Wed, 19 Sept 2018 21:00:00 +0000")
  date_updated?: string;

  @doc("The duration, in seconds, of the recording.")
  @example(20)
  duration?: string;

  @doc("The error code for the recording.")
  error_code?: int32;

  @doc("The price of the recording.")
  price?: string;

  @doc("The currency for the price.")
  @example("USD")
  price_unit?: string;

  @doc("The unique identifier for the recording.")
  @format("uuid")
  sid?: string;

  @doc("The source of the recording.")
  source?: string;

  @doc("The status of the recording.")
  status?: string;

  @doc("The URI for the recording.")
  uri?: string;
}

@doc("Call stream model.")
model CallStream {
  @doc("The unique identifier for the account.")
  @format("uuid")
  account_sid?: string;

  @doc("The unique identifier for the call.")
  @format("uuid")
  call_sid?: string;

  @doc("The date, in RFC 2822 GMT format, this stream was created.")
  date_created?: string;

  @doc("The date, in RFC 2822 GMT format, this stream was updated.")
  date_updated?: string;

  @doc("The name of the stream.")
  name?: string;

  @doc("The unique identifier for the stream.")
  @format("uuid")
  sid?: string;

  @doc("The status of the stream.")
  status?: string;

  @doc("The URI for the stream.")
  uri?: string;
}
