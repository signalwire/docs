
model TranscriptionStatusCallbackPayload {
  @doc("The unique, 34-character ID of the transcription.")
  @example("b3877c40-da60-4998-90ad-b792e984tr01")
  TranscriptionSid: string;

  @doc("The text of the transcription.")
  @example("Hello, I'd like to schedule an appointment for next Tuesday.")
  TranscriptionText: string;

  @doc("The status of the transcription.")
  @example("completed")
  TranscriptionStatus: "completed" | "failed";

  @doc("The path, relative to your Space URL, of the transcription's REST API resource.")
  @example("/api/laml/2010-04-01/Accounts/b3877c40-da60-4998-90ad-b792e98472af/Transcriptions/b3877c40-da60-4998-90ad-b792e984tr01")
  TranscriptionUrl: string;

  @doc("The unique, 34-character identifier for the recording from which the transcription was generated.")
  @example("b3877c40-da60-4998-90ad-b792e984re01")
  RecordingSid: string;

  @doc("The path, relative to your Space URL, of the audio recording from which the transcription was generated.")
  @example("/api/laml/2010-04-01/Accounts/b3877c40-da60-4998-90ad-b792e98472af/Calls/b3877c40-da60-4998-90ad-b792e98472ca/Recordings/b3877c40-da60-4998-90ad-b792e984re01")
  RecordingUrl: string;

  @doc("A unique identifier for the recorded call.")
  @example("b3877c40-da60-4998-90ad-b792e98472ca")
  CallSid: string;

  @doc("The unique ID of the project this transcription is associated with.")
  @example("b3877c40-da60-4998-90ad-b792e98472af")
  AccountSid: string;

  @doc("The phone number that placed the recorded call, in E.164 format.")
  @example("+15551234567")
  From: string;

  @doc("The phone number that received the recorded call, in E.164 format.")
  @example("+15559876543")
  To: string;

  @doc("The status of the recorded call at the time of the callback.")
  @example("completed")
  CallStatus: "queued" | "initiated" | "ringing" | "canceled" | "in-progress" | "busy" | "failed" | "no-answer" | "completed";

  @doc("The version of the SignalWire API.")
  @example("2010-04-01")
  ApiVersion: string;

  @doc("""
    The direction of the recorded call.
    - `outbound-dial`: calls launched through the Dial verb.
    - `outbound-api`: calls launched through the REST API.
    - `inbound`: inbound calls.
    """)
  @example("inbound")
  Direction: "outbound-dial" | "outbound-api" | "inbound";
}
