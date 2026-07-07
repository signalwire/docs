import "@signalwire/typespec-asyncapi";

import "../../../models/core.tsp";
import "../../../models/media.tsp";
import "../../collect/models/send.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

@doc("""
  Settings that control how the caller's DTMF (touch-tone) key presses are collected for a
  `calling.play_and_collect`. Unlike the standalone `calling.collect`, this also
  accepts a `min` digit count.
  """)
model PlayAndCollectDigits {
  @doc("Minimum number of digits to collect before collection can finish. Must be a positive integer.")
  @minValue(1)
  @example(1)
  min?: int32;

  @doc("Maximum number of digits to collect before collection finishes. Must be a positive integer.")
  @minValue(1)
  @example(4)
  max: int32;

  @doc("Keys that end collection early when pressed, such as `\"#*\"`. Not set by default.")
  @example("#")
  terminators?: string;

  @doc("""
    How long to wait, in seconds, for the next key press after one is received
    before giving up. Defaults to `5.0`.
    """)
  @minValueExclusive(0)
  @example(5.0)
  digit_timeout?: float64 = 5.0;
}

@doc("The `collect` settings for a `calling.play_and_collect`, describing what to listen for while the media plays. Provide `digits`, `speech`, or both.")
model PlayAndCollectCollect {
  @doc("How long to wait, in seconds, for the caller to start giving input. Defaults to `4.0`.")
  @minValueExclusive(0)
  @example(4.0)
  initial_timeout?: float64 = 4.0;

  @doc("How to collect DTMF key presses. Provide this, `speech`, or both; at least one is required.")
  digits?: PlayAndCollectDigits;

  @doc("How to collect spoken input. Provide this, `digits`, or both; at least one is required.")
  speech?: CollectSpeech;
}

model PlayAndCollectParams {
  ...CallAddress;

  @doc("Your own identifier for this play-and-collect. It is attached to every event it produces so you can match events back to this request.")
  @example("d4b2e1a0-7c9f-4a3b-8e2d-1f0a9b8c7d6e")
  control_id: string;

  @doc("""
    Playback volume in dB, from `-40` (muted) to `+40`, where `0` keeps the
    original audio level.
    """)
  @minValue(-40)
  @maxValue(40)
  @example(5)
  volume?: float64;

  @doc("The media to play, in order — audio files, text-to-speech, silence, or ringtone.")
  play: PlayMedia[];

  @doc("What to listen for from the caller while the media plays.")
  collect: PlayAndCollectCollect;

  @doc("HTTP or HTTPS URL that play-and-collect events are also POSTed to as they occur.")
  @example("https://example.com/webhooks/relay")
  status_url?: url;
}

model PlayAndCollectStopParams {
  ...CallAddress;

  @doc("The `control_id` you gave to the `calling.play_and_collect` you want to stop.")
  @example("d4b2e1a0-7c9f-4a3b-8e2d-1f0a9b8c7d6e")
  control_id: string;
}

model PlayAndCollectVolumeParams {
  ...CallAddress;

  @doc("The `control_id` of the active `calling.play_and_collect` whose volume you want to change.")
  @example("d4b2e1a0-7c9f-4a3b-8e2d-1f0a9b8c7d6e")
  control_id: string;

  @doc("""
    New playback volume in dB, from `-40` (muted) to `+40`, where `0` keeps the
    original audio level.
    """)
  @minValue(-40)
  @maxValue(40)
  @example(5)
  volume: float64;
}
