import "@signalwire/typespec-asyncapi";

import "../../models/core.tsp";
import "../../models/media.tsp";
import "../../collect/models/requests.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

// ═════════════════════════════════════════════════════════════════════════════
// Play media union (calling.play_and_collect `play[]`)
//
// Discriminated on `type`. Mirrors the Ringback shape but the `tts` variant
// additionally accepts a `voice` field.
// ═════════════════════════════════════════════════════════════════════════════

// The `PlayMedia` union (audio|tts|silence|ringtone) is defined in models/media.tsp —
// shared with `calling.play`.

/** The `collect` settings for a `calling.play_and_collect`, describing what to listen for while the media plays. Provide `digits`, `speech`, or both. */
model PlayAndCollectCollect {
  /** How long to wait, in seconds, for the caller to start giving input. Defaults to `4.0`. */
  @minValueExclusive(0)
  initial_timeout?: float64 = 4.0;

  /** How to collect DTMF key presses. Provide this, `speech`, or both; at least one is required. */
  digits?: CollectDigits;

  /** How to collect spoken input. Provide this, `digits`, or both; at least one is required. */
  speech?: CollectSpeech;
}

model PlayAndCollectParams {
  ...CallAddress;

  /** Your own identifier for this play-and-collect. It is attached to every event it produces so you can match events back to this request. */
  control_id: string;

  /**
   * Playback volume in dB, from `-40` (muted) to `+40`, where `0` keeps the
   * original audio level. The value is applied as the standard amplitude gain
   * factor `10 ^ (value / 20)`.
   */
  @minValue(-40)
  @maxValue(40)
  volume?: float64;

  /** The media to play, in order — audio files, text-to-speech, silence, or ringtone. */
  play: PlayMedia[];

  /** What to listen for from the caller while the media plays. */
  collect: PlayAndCollectCollect;

  /** HTTP or HTTPS URL that play-and-collect events are also POSTed to as they occur. */
  status_url?: url;
}

model PlayAndCollectStopParams {
  ...CallAddress;

  /** The `control_id` you gave to the `calling.play_and_collect` you want to stop. */
  control_id: string;
}

model PlayAndCollectVolumeParams {
  ...CallAddress;

  /** The `control_id` of the active `calling.play_and_collect` whose volume you want to change. */
  control_id: string;

  /**
   * New playback volume in dB, from `-40` (muted) to `+40`, where `0` keeps the
   * original audio level. The value is applied as the standard amplitude gain
   * factor `10 ^ (value / 20)`.
   */
  @minValue(-40)
  @maxValue(40)
  volume: float64;
}
