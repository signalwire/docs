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
    @example("say:Please press 1 for sales or 2 for support")
    play: play_url | play_url[] | SWMLVar | SWMLVar[];

    @doc("""
      Volume level for the audio file.
      Default is 0.
      Valid range is -40 to 40.
      """)
    @minValue(-40.0)
    @maxValue(40.0)
    @example(0)
    volume?: float;

    @doc("""
      The voice to use for the text to speech.
      Default is `Polly.Salli`.
      """)
    @example("Polly.Joanna")
    say_voice?: string;

    @doc("""
      The language to use for the text to speech.
      Default is `en-US`.
      """)
    @example("en-US")
    say_language?: string;

    @doc("""
      The gender to use for the text to speech.
      Default is `female`.
      """)
    @example("female")
    say_gender?: string;

    @doc("""
      Number of digits to collect.
      Default is `1`.
      """)
    @example(4)
    max_digits?: integer | SWMLVar;

    @doc("""
      Digits that terminate digit collection.
      Default is not set.
      """)
    @example("#")
    terminators?: string;

    @doc("""
      Time in seconds to wait for next digit.
      Default is `5.0` seconds.
      """)
    @example(5.0)
    digit_timeout?: float | SWMLVar;

    @doc("""
      Time in seconds to wait for start of input.
      Default is `5.0` seconds.
      """)
    @example(10.0)
    initial_timeout?: float | SWMLVar;

    @doc("Max time in seconds to wait for speech result.")
    @example(15.0)
    speech_timeout?: float | SWMLVar;

    @doc("Time in seconds to wait for end of speech utterance.")
    @example(2.0)
    speech_end_timeout?: float | SWMLVar;

    @doc("Language to detect speech in.")
    @example("en-US")
    speech_language?: string;

    @doc("Words or phrases to help the speech recognition.")
    @example(#["sales", "support", "billing"])
    speech_hints?: string[] | SWMLVar[];

    @doc("""
      The engine that is selected for speech recognition. The engine must support the specified language.
      [Deepgram|Google| etc...] Default is not set (SignalWire picks the engine).
      """)
    @example(#["Deepgram"])
    speech_engine?: string[];

    @doc("http or https URL to deliver prompt status events")
    @example("https://example.com/prompt-status")
    status_url?: url;
  };
}
