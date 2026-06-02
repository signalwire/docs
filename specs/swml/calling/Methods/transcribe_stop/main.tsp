
namespace SWML.Calling;
@summary("transcribe_stop Method")
model TranscribeStop {
  @summary("transcribe_stop")
  @doc("""
    Stop an active background transcription that was started with `transcribe`.
    Stops the transcription tracked for the current call; no parameters are required.
    """)
  @example(#{})
  transcribe_stop: {};
}
