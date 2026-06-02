import "../../../Shared/Types/main.tsp";

namespace SWML.Calling;

@summary("transcribe Method")
model Transcribe {
  @summary("transcribe")
  @doc("""
    Start background call transcription.
    A shadow recording (WAV, stereo, both directions) is created with transcription enabled.
    Only one active transcription per call is allowed at a time.
    To stop a transcription started with `transcribe`, use the `transcribe_stop` method.
    """)
  transcribe: {
    @doc("http or https URL to deliver transcription status events")
    @example("https://example.com/transcribe-status")
    status_url?: url;
  };
}
