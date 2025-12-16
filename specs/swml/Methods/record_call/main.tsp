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
    @example("recording_001")
    control_id?: string;

    @doc("""
      If `true`, record in stereo.
      Default is `false`.
      """)
    @example(true)
    stereo?: boolean | SWMLVar;

    @doc("""
      The format to record in. It can be `wav` or `mp3`.
      Default is `wav`.
      """)
    @example("mp3")
    format?: "wav" | "mp3";

    @doc("""
      Direction of the audio to record: "speak" for what party says, "listen" for what party hears, "both" for what the party hears and says.
      Default is `both`.
      """)
    @example("both")
    direction?: "speak" | "listen" | "both";

    @doc("String of digits that will stop the recording when pressed.")
    @example("#*")
    terminators?: string;

    @doc("""
      Play a beep before recording.
      Default is `false`.
      """)
    @example(true)
    beep?: boolean | SWMLVar;

    @doc("""
      Input sensitivity for the recording.
      Default is `44.0`.
      """)
    @example(44.0)
    input_sensitivity?: float | SWMLVar;

    @doc("""
      Time in seconds to wait for the start of speech.
      Default is `0.0` seconds.
      """)
    @example(0.0)
    initial_timeout?: float | SWMLVar;

    @doc("""
      Time in seconds to wait in silence before ending the recording.
      Default is `0.0` seconds.
      """)
    @example(0.0)
    end_silence_timeout?: float | SWMLVar;

    @doc("Maximum length of the recording in seconds.")
    @example(300)
    max_length?: float | SWMLVar;

    @doc("http or https URL to deliver record_call status events")
    @example("https://example.com/record-call-status")
    status_url?: url;
  };
}
