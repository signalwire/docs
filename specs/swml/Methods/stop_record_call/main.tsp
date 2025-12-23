@summary("StopRecordCall object")
model StopRecordCall {
  @summary("stop_record_call")
  @doc("Stop an active background recording.")
  stop_record_call: {
    @doc("""
      Identifier for the recording to stop.
      If not set, the last recording started will be stopped.
      """)
    control_id?: string;
  };
}
