import "../../Shared/Types/main.tsp";

@summary("DetectMachine Object")
model DetectMachine {
  @doc("""
    A detection method that is a combination of AMD (Answer Machine Detection) and Fax detection.
    Detect if the user on the other end of the call is a machine (fax, voicemail, etc.) or a `human`.
    The detection result(s) will be sent to the declared `status_url` as a POST request.
    """)
  detect_machine: {
    @doc("If `true`, stops detection on beep / end of voicemail greeting. Default `false`.")
    detect_message_end?: boolean | SWMLVar;

    @doc("Comma-separated string: detectors to enable. Default: `amd,fax`.")
    detectors?: string;

    @doc("How long to wait for voice to finish. Default 1.0.")
    @minValue(0.0)
    end_silence_timeout?: float | SWMLVar;

    @doc("How long to wait for initial voice before giving up. Default 4.5.")
    @minValue(0.0)
    initial_timeout?: float | SWMLVar;

    @doc("How long to wait for voice to finish before firing READY event. Default is `end_silence_timeout`.")
    @minValue(0.0)
    machine_ready_timeout?: float | SWMLVar;

    @doc("How much voice in ms to decide MACHINE. Default 1.25.")
    @minValue(0.0)
    machine_voice_threshold?: float | SWMLVar;

    @doc("How many words to count to decide MACHINE. Default 6.")
    @minValue(0)
    machine_words_threshold?: integer | SWMLVar;

    @doc("The http(s) URL to deliver detector events to.")
    status_url?: string;

    @doc("The max time to run detector. Default 30.0 seconds.")
    @minValue(0.0)
    timeout?: float | SWMLVar;

    @doc("The tone to detect, will only receive remote side tone. Default `CED`.")
    tone?: "CED" | "CNG";

    @doc("If `false`, the detector will run asynchronously and `status_url` must be set. Default `true`.")
    wait?: boolean | SWMLVar;
  };
}
