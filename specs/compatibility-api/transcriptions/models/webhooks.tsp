import "../../../_shared/webhook/decorator.tsp";

@summary("Transcription status callback")
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
