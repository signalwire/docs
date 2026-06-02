import "../../../Shared/Types/main.tsp";

namespace SWML.Calling;

@summary("transcribe Method")
model Transcribe {
  @summary("transcribe")
  @doc("""
    Start transcribing the call in the background.
    Execution continues to the next instruction while transcription runs.
    The call is recorded and the recording is transcribed; the status events report the recording's URL and ID.
    Only one transcription can be active on a call at a time.
    To stop it, use the `transcribe_stop` method.
    """)
  transcribe: {
    @doc("http or https URL to deliver transcription status events")
    @example("https://example.com/transcribe-status")
    status_url?: url;
  };
}
