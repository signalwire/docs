import "@signalwire/typespec-asyncapi";

import "../../../models/core.tsp";
import "../../../models/media.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

model PlayParams {
  ...CallAddress;

  @doc("Your own identifier for this play. Use it to pause, resume, stop, or change the volume, and it is echoed on the `calling.call.play` events so you can correlate them.")
  @example("d4b2e1a0-7c9f-4a3b-8e2d-1f0a9b8c7d6e")
  control_id: string;

  @doc("""
    Playback volume in dB, from `-40` (muted) to `+40`; `0` keeps the original audio level.
    """)
  @minValue(-40)
  @maxValue(40)
  @example(5)
  volume?: float64;

  @doc("Ordered list of media elements to play.")
  play: PlayMedia[];
}

model PlayPauseParams {
  ...CallAddress;

  @doc("The `control_id` you set when you started the play with `calling.play`.")
  @example("d4b2e1a0-7c9f-4a3b-8e2d-1f0a9b8c7d6e")
  control_id: string;
}

model PlayResumeParams {
  ...CallAddress;

  @doc("The `control_id` you set when you started the play with `calling.play`.")
  @example("d4b2e1a0-7c9f-4a3b-8e2d-1f0a9b8c7d6e")
  control_id: string;
}

model PlayStopParams {
  ...CallAddress;

  @doc("The `control_id` you set when you started the play with `calling.play`.")
  @example("d4b2e1a0-7c9f-4a3b-8e2d-1f0a9b8c7d6e")
  control_id: string;
}

model PlayVolumeParams {
  ...CallAddress;

  @doc("The `control_id` you set when you started the play with `calling.play`.")
  @example("d4b2e1a0-7c9f-4a3b-8e2d-1f0a9b8c7d6e")
  control_id: string;

  @doc("""
    Playback volume in dB, from `-40` (muted) to `+40`; `0` keeps the original audio level.
    """)
  @minValue(-40)
  @maxValue(40)
  @example(5)
  volume: float64;
}
