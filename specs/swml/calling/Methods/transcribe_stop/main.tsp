
namespace SWML.Calling;
@summary("transcribe_stop Method")
model TranscribeStop {
  @summary("transcribe_stop")
  @doc("""
    Stop the transcription currently running on the call, started with `transcribe`.
    No parameters are required.
    """)
  @example(#{})
  transcribe_stop: {};
}
