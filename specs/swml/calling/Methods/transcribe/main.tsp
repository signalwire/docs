import "../../../Shared/Types/main.tsp";

namespace SWML.Calling;

@summary("transcribe Method")
model Transcribe {
  @summary("transcribe")
  @doc("""
    Record the call in the background and transcribe the recording after it stops.
    Recording starts when this instruction runs, so audio from earlier in the call is not included, and continues until it is stopped with `transcribe_stop` or the call ends.
    Execution continues to the next instruction while the call proceeds.
    Transcription runs after recording stops and completes asynchronously, so the transcript can arrive some time after the call ends.
    The recording is transcribed as U.S. English (`en-US`); there is no option to choose another language.
    For real-time transcription delivered as the call happens, use `live_transcribe` instead.
    Only one transcription can be active on a call at a time.
    """)
  transcribe: {
    @doc("""
      An HTTP or HTTPS URL that receives status callbacks for this transcription:
      recording events (`calling.call.transcribe`) when recording starts and finishes,
      the transcript result (`calling.transcript.completed` or `calling.transcript.failed`),
      and possibly `calling.error` if the transcription fails to start.
      Accepts a SWML variable reference that resolves to an HTTP or HTTPS URL.
      """)
    @example("https://example.com/transcribe-status")
    status_url?: url | SWMLVar;
  };
}
