import "../../Shared/Types/main.tsp";

@summary("RecordCall object")
model RecordCall {
  @summary("record_call")
  @doc("""
    Record call in the background.
    Unlike the `record` method, the `record_call` method will start the recording and continue executing the SWML script without allowing the recording to happen in the background.
    To stop call recordings started with `record_call`, use the `stop_call_record` method.
    """)
  record_call: {
    @doc("Identifier for this recording, to use with `stop_call_record`.")
    control_id?: string;

    @doc("""
      If `true`, record in stereo.
      Default is `false`.
      """)
    stereo?: boolean | SWMLVar;

    @doc("""
      The format to record in. It can be `wav` or `mp3`.
      Default is `wav`.
      """)
    format?: "wav" | "mp3";

    @doc("""
      Direction of the audio to record: "speak" for what party says, "listen" for what party hears, "both" for what the party hears and says.
      Default is `both`.
      """)
    direction?: "speak" | "listen" | "both";

    @doc("String of digits that will stop the recording when pressed.")
    terminators?: string;

    @doc("""
      Play a beep before recording.
      Default is `false`.
      """)
    beep?: boolean | SWMLVar;

    @doc("""
      Input sensitivity for the recording.
      Default is `44.0`.
      """)
    input_sensitivity?: float | SWMLVar;

    @doc("""
      Time in seconds to wait for the start of speech.
      Default is `0.0` seconds.
      """)
    initial_timeout?: float | SWMLVar;

    @doc("""
      Time in seconds to wait in silence before ending the recording.
      Default is `0.0` seconds.
      """)
    end_silence_timeout?: float | SWMLVar;

    @doc("Maximum length of the recording in seconds.")
    max_length?: float | SWMLVar;

    @doc("http or https URL to deliver record_call status events")
    status_url?: url;
  };
}
