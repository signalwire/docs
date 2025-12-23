@summary("StopTap object")
model StopTap {
  @summary("stop_tap")
  @doc("Stop an active tap stream.")
  stop_tap: {
    @doc("""
      ID of the tap to stop.
      If not set, it will shut off the most recent tap session.
      """)
    control_id?: string;
  };
}
