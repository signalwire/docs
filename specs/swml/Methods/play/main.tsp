import "@typespec/json-schema";
import "../../Shared/Types/main.tsp";

using TypeSpec.JsonSchema;

@pattern("^(http://.*|https://.*|ring: ?[0-9.]*: ?[a-zA-Z]{2}|say: ?.*|silence: ?[0-9.]*|ring: ?[a-zA-Z]{2})$")
scalar play_url extends string;

@summary("PlayBase object")
model PlayBase {
  @doc("If `true`, the call will automatically answer as the sound is playing. If `false`, you will start playing the audio during early media")
  @example(true)
  auto_answer?: boolean | SWMLVar;

  @doc("""
    Volume level for the audio file.
    Default is `0`.
    Valid range is -40 to 40
    """)
  @minValue(-40)
  @maxValue(40)
  @example(10)
  volume?: float | SWMLVar;

  @doc("""
    The voice to use for the text to speech.
    Default is `Polly.Salli`
    """)
  @example("Polly.Joanna")
  say_voice?: string;

  @doc("""
    The language to use for the text to speech.
    Default is `en-US`
    """)
  @example("en-US")
  say_language?: string;

  @doc("""
    Gender to use for the text to speech.
    Default is `female`.
    """)
  @example("female")
  say_gender?: string;

  @doc("http or https URL to deliver play status events")
  @example("https://example.com/play-status")
  status_url?: url;
}

@summary("PlayWithURL object")
@doc("Play with a single URL")
model PlayWithURL is PlayBase {
  @doc("""
    URL to play.
    Required if `urls` is not present.
    Allowed URLs are:
        - http:// or https:// - audio file to GET
        - ring:[duration:]<country code> - ring tone to play. For example: ring:us to play single ring or ring:20.0:us to play ring for 20 seconds.
        - say:<text to speak> - Sentence to say
        - silence: <duration> - seconds of silence to play
    """)
  @example("https://example.com/welcome.mp3")
  url: play_url | SWMLVar;
}

@summary("PlayWithURLS object")
model PlayWithURLS is PlayBase {
  @doc("""
    Array of URLs to play.
    Required if `url` is not present.
    Allowed URLs are:
        - http:// or https:// - audio file to GET
        - ring:[duration:]<country code> - ring tone to play. For example: ring:us to play single ring or ring:20.0:us to play ring for 20 seconds.
        - say:<text to speak> - Sentence to say
        - silence: <duration> - seconds of silence to play
    """)
  @example(#["https://example.com/intro.mp3", "say:Welcome to our service", "silence:2"])
  urls: play_url[] | SWMLVar[];
}

alias PlayUnion = PlayWithURL | PlayWithURLS;

@summary("Play object")
model Play {
  @oneOf
  @summary("play")
  @doc("Play file(s), ringtones, speech or silence.")
  play: PlayUnion;
}
