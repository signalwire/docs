import "../../../Shared/Types/main.tsp";

namespace SWML.Calling;

@summary("transcribe Method")
model Transcribe {
  @summary("transcribe")
  @doc("""
    Transcribe the entire call in the background.
    Execution continues to the next instruction while the call proceeds; the transcription covers the whole call and completes when the call ends.
    For real-time transcription delivered as the call happens, use `live_transcribe` instead.
    Only one transcription can be active on a call at a time.
    To stop it, use the `transcribe_stop` method.
    """)
  transcribe: {
    @doc("An HTTP or HTTPS URL that receives the status callback when the transcription finishes")
    @example("https://example.com/transcribe-status")
    status_url?: url;
  };
}
