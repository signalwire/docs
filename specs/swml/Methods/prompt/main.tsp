import "../../Methods";

@summary("Prompt object")
model Prompt {
  @summary("prompt")
  @doc("""
    Play a prompt and wait for digit or speech input.
    Speech detection is not enabled unless at least one speech parameter is set.
    If only speech parameters are set (and no digit parameters), digit detection is not enabled.
    To enable both digit and speech detection, set at least one parameter for each.
    """)
  prompt: {
    @doc("""
      URL or array of URLs to play.
      Allowed URLs are:
          http:// or https:// - audio file to GET
          ring:[duration:]<country code> - ring tone to play. For example: ring:us to play single ring or ring:20.0:us to play ring for 20 seconds.
          say:<text to speak> - Sentence to say
          silence: <duration> - seconds of silence to play
      """)
    play: play_url | play_url[] | SWMLVar | SWMLVar[];

    @doc("""
      Volume level for the audio file.
      Default is 0.
      Valid range is -40 to 40.
      """)
    @minValue(-40.0)
    @maxValue(40.0)
    volume?: float;

    @doc("""
      The voice to use for the text to speech.
      Default is `Polly.Salli`.
      """)
    say_voice?: string;

    @doc("""
      The language to use for the text to speech.
      Default is `en-US`.
      """)
    say_language?: string;

    @doc("""
      The gender to use for the text to speech.
      Default is `female`.
      """)
    say_gender?: string;

    @doc("""
      Number of digits to collect.
      Default is `1`.
      """)
    max_digits?: integer | SWMLVar;

    @doc("""
      Digits that terminate digit collection.
      Default is not set.
      """)
    terminators?: string;

    @doc("""
      Time in seconds to wait for next digit.
      Default is `5.0` seconds.
      """)
    digit_timeout?: float | SWMLVar;

    @doc("""
      Time in seconds to wait for start of input.
      Default is `5.0` seconds.
      """)
    initial_timeout?: float | SWMLVar;

    @doc("Max time in seconds to wait for speech result.")
    speech_timeout?: float | SWMLVar;

    @doc("Time in seconds to wait for end of speech utterance.")
    speech_end_timeout?: float | SWMLVar;

    @doc("Language to detect speech in.")
    speech_language?: string;

    @doc("Words or phrases to help the speech recognition.")
    speech_hints?: string[] | SWMLVar[];

    @doc("""
      The engine that is selected for speech recognition. The engine must support the specified language.
      [Deepgram|Google| etc...] Default is not set (SignalWire picks the engine).
      """)
    speech_engine?: string[];

    @doc("http or https URL to deliver prompt status events")
    status_url?: url;
  };
}
