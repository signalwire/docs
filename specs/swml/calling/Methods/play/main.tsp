import "@typespec/json-schema";
import "../../../Shared/Types/main.tsp";

using TypeSpec.JsonSchema;

namespace SWML.Calling;

@pattern("^(http://.*|https://.*|ring: ?[0-9.]*: ?([a-zA-Z]{2}|bong)|say: ?.*|silence: ?[0-9.]*|ring: ?([a-zA-Z]{2}|bong))$")
scalar play_url extends string;

@summary("PlayBase object")
model PlayBase {
  @doc("""
    If `true`, the call is answered before the audio plays. Default `true`.
    The property is accepted, but setting it to `false` does not currently prevent the call from being answered.
    """)
  @example(true)
  auto_answer?: boolean | SWMLVar = true;

  @doc("""
    Volume level for the audio file.
    Default is `0`.
    Valid range is -40 to 40.
    """)
  @minValue(-40)
  @maxValue(40)
  @example(10)
  volume?: float | SWMLVar = 0;

  @doc("""
    Number of times to play the full list of sounds.
    Default is `1`.
    Set to `0` to repeat the list continuously. The list only repeats while at least one of its sounds can be played.
    """)
  @minValue(0)
  @example(2)
  loop?: integer | SWMLVar = 1;

  @doc("""
    The voice to use for `say:` text to speech.
    When not set, the `say_voice` SWML variable is used if it is set.
    Otherwise, a voice is selected based on the text-to-speech language and gender.
    """)
  @example("Polly.Joanna")
  say_voice?: string;

  @doc("""
    The language to use for `say:` text to speech.
    When not set, the `say_language` SWML variable is used if it is set, otherwise `en-US`.
    """)
  @example("en-US")
  say_language?: string = "en-US";

  @doc("""
    The gender to use for `say:` text to speech.
    When not set, the `say_gender` SWML variable is used if it is set, otherwise `female`.
    """)
  @example("female")
  say_gender?: string = "female";

  @doc("""
    HTTP or HTTPS URL to deliver play status events.
    A SWML variable must resolve to an HTTP or HTTPS URL.
    """)
  @example("https://example.com/play-status")
  status_url?: url | SWMLVar;
}

@summary("Single URL")
@doc("Play with a single URL")
model PlayWithURL is PlayBase {
  @doc("""
    URL to play.
    Required if `urls` is not present.
    Allowed URLs are:
        - http:// or https:// - audio file to GET
        - ring:[duration:]<ringtone> - ring tone to play, named by country code or `bong`. For example: ring:us to play single ring or ring:20.0:us to play ring for 20 seconds.
        - say:<text to speak> - Sentence to say
        - silence: <duration> - seconds of silence to play
    """)
  @example("https://example.com/welcome.mp3")
  url: play_url | SWMLVar;
}

@summary("Multiple URLs")
model PlayWithURLS is PlayBase {
  @doc("""
    Array of URLs to play, in order.
    Required if `url` is not present.
    Each entry can be a playable URL or a SWML variable that resolves to one.
    Allowed URLs are:
        - http:// or https:// - audio file to GET
        - ring:[duration:]<ringtone> - ring tone to play, named by country code or `bong`. For example: ring:us to play single ring or ring:20.0:us to play ring for 20 seconds.
        - say:<text to speak> - Sentence to say
        - silence: <duration> - seconds of silence to play
    """)
  @example(#[
    "https://example.com/intro.mp3",
    "say:Welcome to our service",
    "silence:2"
  ])
  urls: (play_url | SWMLVar)[];
}

alias PlayUnion = PlayWithURL | PlayWithURLS;

@summary("play Method")
model Play {
  @oneOf
  @summary("play")
  @doc("Play file(s), ringtones, speech or silence.")
  play: PlayUnion;
}
