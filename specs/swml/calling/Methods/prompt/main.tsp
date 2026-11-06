import "../..";

namespace SWML.Calling;

// The say_* constraints below apply to `prompt` only; `play` keeps plain types for the same fields for now.
// `play.status_url` also still uses a plain url type rather than an HTTP(S)-only one like `PromptStatusUrl`.

// Literal text-to-speech voice name: no whitespace, double quotes, or the characters ,{}()[]<>=/;!@#$%^&*+|~?`
@pattern("^[^,\\s\"{}()=<>\\[\\]/;!@#$%^&*+|~`?]+$")
scalar PromptSayVoice extends string;

// Literal text-to-speech language tag, such as `en-US`.
@pattern("^[a-zA-Z]{2,10}(-[a-zA-Z0-9]{2,10}){0,5}$")
scalar PromptSayLanguage extends string;

// Literal speech recognition language tag, such as `en-US`. Extension and private-use subtags are not accepted.
@pattern("^(?:[a-zA-Z]{2,3}(?:-[a-zA-Z]{3})?)(?:-[a-zA-Z]{4})?(?:-(?:[a-zA-Z]{2}|[0-9]{3}))?(?:-(?:[a-zA-Z0-9]{5,8}|(?:[0-9][a-zA-Z0-9]{3})))?$")
scalar PromptSpeechLanguage extends string;

// Speech recognition hint: an empty string fails the request.
@minLength(1)
scalar PromptSpeechHint extends string;

// Literal status callback URL: the scheme must be http or https.
@pattern("^[hH][tT][tT][pP][sS]?://")
scalar PromptStatusUrl extends url;

@summary("prompt Method")
model Prompt {
  @summary("prompt")
  @doc("""
    Play a prompt and wait for input. The input can be received either as digits from the keypad,
    or from speech, or both depending on what parameters are set.
    By default, only digit input is enabled.
    To enable speech input, set at least one of `speech_timeout`, `speech_end_timeout`, `speech_language`, or `speech_hints`.
    Setting `speech_engine` alone does not enable speech input.
    To enable both digit and speech input, also set at least one of `max_digits`, `terminators`, or `digit_timeout`.
    `initial_timeout` controls how long to wait for input and does not select an input mode.
    """)
  prompt: {
    @doc("""
      URL or array of URLs to play.
      Each entry can be a playable URL or a SWML variable that resolves to one.
      Allowed URLs are:
          http:// or https:// - audio file to GET
          ring:[duration:]<ringtone> - ring tone to play, named by country code or `bong`. For example: ring:us to play single ring or ring:20.0:us to play ring for 20 seconds. A duration, when given, must be at least 1 second.
          say:<text to speak> - Sentence to say
          silence: <duration> - seconds of silence to play, at least 1
      """)
    @example("say:Please press 1 for sales or 2 for support")
    play: play_url | SWMLVar | (play_url | SWMLVar)[];

    @doc("""
      Volume level for the audio file.
      Default is `0`.
      Valid range is -40 to 40.
      """)
    @minValue(-40.0)
    @maxValue(40.0)
    @example(0)
    volume?: float | SWMLVar = 0;

    @doc("""
      The voice to use for `say:` text to speech.
      When not set, the `say_voice` SWML variable is used if it is set.
      Otherwise, a voice is selected based on the text-to-speech language and gender.
      A voice name must not contain whitespace, double quotes, or any of the characters `,{}()[]<>=/;!@#$%^&*+|~?` or a backtick.
      """)
    @example("Polly.Joanna")
    say_voice?: PromptSayVoice | SWMLVar;

    @doc("""
      The language to use for `say:` text to speech, as a language tag such as `en-US`.
      When not set, the `say_language` SWML variable is used if it is set, otherwise `en-US`.
      """)
    @example("en-US")
    say_language?: PromptSayLanguage | SWMLVar = PromptSayLanguage("en-US");

    @doc("""
      The gender to use for `say:` text to speech: `male` or `female`.
      When not set, the `say_gender` SWML variable is used if it is set, otherwise `female`.
      """)
    @example("female")
    say_gender?: "male" | "female" | SWMLVar = "female";

    @doc("""
      Number of digits to collect. Must be at least `1`. Values above `100` are capped at `100`.
      Default is `1`.
      """)
    @minValue(1)
    @example(4)
    max_digits?: integer | SWMLVar = 1;

    @doc("""
      Digits that terminate digit collection.
      Default is not set.
      """)
    @example("#")
    terminators?: string;

    @doc("""
      Time in seconds to wait for next digit. Must be at least `1`.
      Default is `5.0` seconds.
      """)
    @minValue(1)
    @example(5.0)
    digit_timeout?: float | SWMLVar = 5.0;

    @doc("""
      Time in seconds to wait for start of input. Must be at least `1`.
      Default is `5.0` seconds.
      """)
    @minValue(1)
    @example(10.0)
    initial_timeout?: float | SWMLVar = 5.0;

    @doc("Max time in seconds to wait for speech result. Must be at least `1`.")
    @minValue(1)
    @example(15.0)
    speech_timeout?: float | SWMLVar;

    @doc("Time in seconds to wait for end of speech utterance. Must be at least `1`.")
    @minValue(1)
    @example(2.0)
    speech_end_timeout?: float | SWMLVar;

    @doc("""
      Language to detect speech in, as a language tag such as `en-US`.
      Extension and private-use subtags are not accepted.
      """)
    @example("en-US")
    speech_language?: PromptSpeechLanguage | SWMLVar;

    @doc("""
      Expected words or phrases to help the speech recognition.
      Each hint must be a non-empty string and is sent as written: SWML variables in hints are not expanded.
      Hints longer than 100 bytes or containing `=` are ignored.
      Hints after the first 5000, or after 100,000 bytes in total, are dropped.
      """)
    @example(#["sales", "support", "billing"])
    speech_hints?: PromptSpeechHint[];

    @doc("""
      The engine that is selected for speech recognition. The engine must support the specified language.
      Default is not set (SignalWire picks the engine).
      """)
    @example("Deepgram")
    speech_engine?: "Google" | "Google.V2" | "Deepgram" | SWMLVar;

    @doc("""
      HTTP or HTTPS URL to deliver prompt status events, or a SWML variable that resolves to one.
      """)
    @example("https://example.com/prompt-status")
    status_url?: PromptStatusUrl | SWMLVar;
  };
}
