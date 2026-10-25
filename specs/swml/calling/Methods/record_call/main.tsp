import "../../../Shared/Types/main.tsp";

namespace SWML.Calling;

// Literal recording control ID: no `{`, `}`, comma, semicolon, apostrophe, backslash,
// or control characters U+0001-U+001F and U+007F. Empty means auto-generated.
@pattern("^[^{},;'\\\\\\u0001-\\u001f\\u007f]*$")
scalar RecordCallControlId extends string;

@summary("record_call Method")
model RecordCall {
  @summary("record_call")
  @doc("""
    Record call in the background.
    Unlike the record method, the record_call method will start the recording and continue executing
    the SWML script while allowing the recording to happen in the background.
    To stop call recordings started with record_call, use the stop_record_call method.
    """)
  record_call: {
    @doc("""
      Identifier for this recording, to use with `stop_record_call`.
      When not set or empty, an identifier is generated and saved to the `record_control_id` variable.
      The identifier, after variable expansion, must not contain `{`, `}`, commas, semicolons, apostrophes, backslashes, or ASCII control characters; otherwise the recording fails to start.
      """)
    @example("recording_001")
    control_id?: RecordCallControlId | SWMLVar;

    @doc("""
      If `true`, record in stereo.
      Default is `false`.
      """)
    @example(true)
    stereo?: boolean | SWMLVar = false;

    @doc("""
      The format to record in. It can be `wav`, `mp3`, or `mp4`.
      Default is `"wav"`.
      """)
    @example("mp3")
    format?: "wav" | "mp3" | "mp4" | SWMLVar = "wav";

    @doc("""
      Direction of the audio to record: "speak" for what party says, "listen" for what party hears, "both" for what the party hears and says.
      Default is `"both"`.
      """)
    @example("both")
    direction?: "speak" | "listen" | "both" | SWMLVar = "both";

    @doc("String of digits that will stop the recording when pressed. Default is `\"\"` (empty).")
    @example("#*")
    terminators?: string = "";

    @doc("""
      Play a beep when recording starts. Recording starts at the same time as the beep, so the beep can be included in the recording.
      Default is `false`.
      """)
    @example(true)
    beep?: boolean | SWMLVar = false;

    @doc("""
      How sensitive the recording voice activity detector is to background noise.
      Only used when `initial_timeout` or `end_silence_timeout` is greater than `0`; with both at their default of `0`, the recording is continuous and this setting is ignored.
      A larger value is more sensitive. Allowed values from 0.0 to 100.0.
      Default is `44.0`.
      """)
    @minValue(0)
    @maxValue(100)
    @example(44.0)
    input_sensitivity?: float | SWMLVar = 44.0;

    @doc("""
      Time in seconds to wait for the start of speech.
      Default is `0.0` seconds.
      """)
    @example(0.0)
    initial_timeout?: float | SWMLVar = 0.0;

    @doc("""
      Time in seconds to wait in silence before ending the recording.
      Default is `0.0` seconds.
      """)
    @example(0.0)
    end_silence_timeout?: float | SWMLVar = 0.0;

    @doc("""
      Maximum length of the recording in seconds.
      Default is `0`, which sets no maximum length. The recording can still end for other reasons, such as a terminator digit or `stop_record_call`.
      """)
    @example(300)
    max_length?: float | SWMLVar = 0;

    @doc("http or https URL to deliver record_call status events")
    @example("https://example.com/record-call-status")
    status_url?: url;
  };
}
