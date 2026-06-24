import "@signalwire/typespec-asyncapi";

import "../../models/core.tsp";
import "../../models/media.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

// ═════════════════════════════════════════════════════════════════════════════
// calling.play — media elements
//
// `play[]` is a discriminated union on `type`: audio | tts | silence | ringtone.
// Distinct from common.tsp's `Ringback` (connect ringback) — kept separate so
// the emitter emits exactly these four play variants for the play method.
// ═════════════════════════════════════════════════════════════════════════════

// The `PlayMedia` union (audio|tts|silence|ringtone) is defined in common.tsp —
// shared with `calling.play_and_collect`.

model PlayParams {
  ...CallAddress;

  /** Identifier used to control this active play (pause/resume/stop/volume). */
  control_id: string;

  /**
   * Playback volume, -40dB to +40dB (`0` = original audio, `-40` = muted;
   * amplitude gain factor `10^(value/20)`).
   */
  @minValue(-40)
  @maxValue(40)
  volume?: float64;

  /**
   * Which side of the call hears the media: `listen` (what the called party
   * hears), `speak`, or `both`. Default `listen`.
   */
  direction?: "listen" | "speak" | "both" = "listen";

  /** HTTP(s) URL to POST play events to. */
  status_url?: url;

  /** Ordered list of media elements to play. */
  play: PlayMedia[];

  /**
   * Number of times to play the sequence. `0` loops until the call ends or the
   * play is stopped. Default `1`.
   */
  @minValue(0)
  loop?: int32 = 1;
}

model PlayPauseParams {
  ...CallAddress;

  /** The playing `control_id` assigned in `calling.play`. */
  control_id: string;
}

model PlayResumeParams {
  ...CallAddress;

  /** The playing `control_id` assigned in `calling.play`. */
  control_id: string;
}

model PlayStopParams {
  ...CallAddress;

  /** The `control_id` assigned in `calling.play`. */
  control_id: string;
}

model PlayVolumeParams {
  ...CallAddress;

  /** The `control_id` assigned in `calling.play`. */
  control_id: string;

  /**
   * Playback volume, -40dB to +40dB (`0` = original audio, `-40` = muted;
   * amplitude gain factor `10^(value/20)`).
   */
  @minValue(-40)
  @maxValue(40)
  volume: float64;
}
