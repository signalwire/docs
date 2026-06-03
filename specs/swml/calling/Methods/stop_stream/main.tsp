namespace SWML.Calling;
@summary("stop_stream Method")
model StopStream {
  @summary("stop_stream")
  @doc("Stop an active audio stream.")
  stop_stream: {
    @doc("""
      ID of the stream to stop.
      If not set, it will stop the most recent stream started.
      """)
    @example("stream_001")
    control_id?: string;
  };
}
