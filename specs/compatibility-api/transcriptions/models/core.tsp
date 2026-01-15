using TypeSpec.Http;

model TranscriptionsAccountSidPath {
  @doc("The unique identifier for the account that created this transcription.")
  @example("b3877c40-da60-4998-90ad-b792e98472ac")
  @format("uuid")
  @path
  AccountSid: string;
}

model TranscriptionSidPath {
  @doc("The unique identifier for the transcription.")
  @example("b3877c40-da60-4998-90ad-b792e98472tr")
  @format("uuid")
  @path
  Sid: string;
}

@doc("Transcription status.")
enum TranscriptionStatus {
  InProgress: "in-progress",
  Completed: "completed",
  Failed: "failed",
}

@doc("Transcription model.")
model Transcription {
  @doc("The unique identifier for the account that created this transcription.")
  @format("uuid")
  @example("b3877c40-da60-4998-90ad-b792e98472ac")
  account_sid?: string;

  @doc("The version of the SignalWire API.")
  @example("2010-04-01")
  api_version?: string;

  @doc("The date, in RFC 2822 GMT format, this transcription was created.")
  @example("Thur, 27 Sept 2018 02:00:00 +0000")
  date_created?: string;

  @doc("The date, in RFC 2822 GMT format, this transcription was updated.")
  @example("Fri, 28 Sept 2018 03:00:00 +0000")
  date_updated?: string;

  @doc("The time, in seconds, of the transcribed audio.")
  @example("1")
  duration?: string;

  @doc("The charge for the transcription.")
  @example("-0.00025")
  price?: string;

  @doc("The currency, in ISO 4127 format, for the price of the transcription.")
  @example("USD")
  price_unit?: string;

  @doc("The unique identifier for the recording that this transcription was created from.")
  @example("b3877c40-da60-4998-90ad-b792e98472re")
  recording_sid?: string;

  @doc("The unique identifier for the transcription.")
  @example("b3877c40-da60-4998-90ad-b792e98472tr")
  sid?: string;

    @doc("The status of the transcription.")
    status?: TranscriptionStatus;

  @doc("The text content of a transcription.")
  @example("Hello, this is a test transcription.")
  transcription_text?: string;

  @doc("Type of the transcription.")
  @example("fast")
  type?: string;

  @doc("The URI of the transcription.")
  @example("/api/laml/2010-04-01/Accounts/b3877c40-da60-4998-90ad-b792e98472ac/Transcriptions/b3877c40-da60-4998-90ad-b792e98472tr.json")
  uri?: string;
}
