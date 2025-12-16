import "../../Shared/Types/main.tsp";

@summary("Record object")
model Record {
  @summary("record")
  @doc("Record the call audio in the foreground. Use this, for example, to record voicemails.")
  record: {
    @doc("""
      If true, record in stereo.
      Default is false.
      """)
    @example(true)
    stereo?: boolean | SWMLVar;

    @doc("""
      The format to record in. Can be `wav` or `mp3`.
      Default is "wav".
      """)
    @example("mp3")
    format?: "wav" | "mp3";

    @doc("""
      Direction of the audio to record: "speak" for what party says, "listen" for what party hears.
      Default is `speak`.
      """)
    @example("speak")
    direction?: "speak" | "listen";

    @doc("String of digits that will stop the recording when pressed.")
    @example("#")
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
      Default is `4.0` seconds.
      """)
    @example(4.0)
    initial_timeout?: float | SWMLVar;

    @doc("""
      Time in seconds to wait in silence before ending the recording.
      Default is `5.0` seconds.
      """)
    @example(5.0)
    end_silence_timeout?: float | SWMLVar;

    @doc("Maximum length of the recording in seconds.")
    @example(60)
    max_length?: float | SWMLVar;

    @doc("URL to send recording status events to.")
    @example("https://example.com/recording-status")
    status_url?: string;
  };
}
