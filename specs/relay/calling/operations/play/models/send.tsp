import "@signalwire/typespec-asyncapi";

import "../../../models/core.tsp";
import "../../../models/media.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

model PlayParams {
  ...CallAddress;

  @doc("Identifier used to control this active play (pause/resume/stop/volume).")
  control_id: string;

  @doc("""
    Playback volume, -40dB to +40dB (`0` = original audio, `-40` = muted;
    amplitude gain factor `10^(value/20)`).
    """)
  @minValue(-40)
  @maxValue(40)
  volume?: float64;

  @doc("""
    Which side of the call hears the media: `listen` (what the called party
    hears), `speak`, or `both`. Default `listen`.
    """)
  direction?: "listen" | "speak" | "both" = "listen";

  @doc("HTTP(s) URL to POST play events to.")
  status_url?: url;

  @doc("Ordered list of media elements to play.")
  play: PlayMedia[];

  @doc("""
    Number of times to play the sequence. `0` loops until the call ends or the
    play is stopped. Default `1`.
    """)
  @minValue(0)
  loop?: int32 = 1;
}

model PlayPauseParams {
  ...CallAddress;

  @doc("The playing `control_id` assigned in `calling.play`.")
  control_id: string;
}

model PlayResumeParams {
  ...CallAddress;

  @doc("The playing `control_id` assigned in `calling.play`.")
  control_id: string;
}

model PlayStopParams {
  ...CallAddress;

  @doc("The `control_id` assigned in `calling.play`.")
  control_id: string;
}

model PlayVolumeParams {
  ...CallAddress;

  @doc("The `control_id` assigned in `calling.play`.")
  control_id: string;

  @doc("""
    Playback volume, -40dB to +40dB (`0` = original audio, `-40` = muted;
    amplitude gain factor `10^(value/20)`).
    """)
  @minValue(-40)
  @maxValue(40)
  volume: float64;
}
