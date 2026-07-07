import "@signalwire/typespec-asyncapi";

import "../../../models/core.tsp";
import "../../../models/media.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

model PlayParams {
  ...CallAddress;

  @doc("Identifier used to control this active play (pause/resume/stop/volume).")
  @example("d4b2e1a0-7c9f-4a3b-8e2d-1f0a9b8c7d6e")
  control_id: string;

  @doc("""
    Playback volume, -40dB to +40dB (`0` = original audio, `-40` = muted).
    """)
  @minValue(-40)
  @maxValue(40)
  @example(5)
  volume?: float64;

  @doc("""
    Which side of the call hears the media: `listen` (audio the called party
    hears), `speak` (audio the called party sends), or `both`. Default `listen`.
    """)
  @example("listen")
  direction?: "listen" | "speak" | "both" = "listen";

  @doc("HTTP(s) URL to POST play events to.")
  @example("https://example.com/webhooks/relay")
  status_url?: url;

  @doc("Default text-to-speech language for TTS items in `play` that do not set their own. Falls back to the platform default if unset.")
  @example("en-US")
  language?: string;

  @doc("Default text-to-speech voice for TTS items in `play` that do not set their own. Falls back to the platform default if unset.")
  @example("en-US-Standard-C")
  voice?: string;

  @doc("Default text-to-speech voice gender for TTS items in `play` that do not set their own.")
  @example("female")
  gender?: TtsGender;

  @doc("Ordered list of media elements to play.")
  play: PlayMedia[];

  @doc("""
    Number of times to play the sequence. `0` loops until the call ends or the
    play is stopped. Default `1`.
    """)
  @minValue(0)
  @example(1)
  loop?: int32 = 1;
}

model PlayPauseParams {
  ...CallAddress;

  @doc("The playing `control_id` assigned in `calling.play`.")
  @example("d4b2e1a0-7c9f-4a3b-8e2d-1f0a9b8c7d6e")
  control_id: string;
}

model PlayResumeParams {
  ...CallAddress;

  @doc("The playing `control_id` assigned in `calling.play`.")
  @example("d4b2e1a0-7c9f-4a3b-8e2d-1f0a9b8c7d6e")
  control_id: string;
}

model PlayStopParams {
  ...CallAddress;

  @doc("The `control_id` assigned in `calling.play`.")
  @example("d4b2e1a0-7c9f-4a3b-8e2d-1f0a9b8c7d6e")
  control_id: string;
}

model PlayVolumeParams {
  ...CallAddress;

  @doc("The `control_id` assigned in `calling.play`.")
  @example("d4b2e1a0-7c9f-4a3b-8e2d-1f0a9b8c7d6e")
  control_id: string;

  @doc("""
    Playback volume, -40dB to +40dB (`0` = original audio, `-40` = muted).
    """)
  @minValue(-40)
  @maxValue(40)
  @example(5)
  volume: float64;
}
