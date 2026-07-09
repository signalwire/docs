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

  @doc("""
    Which side of the call's audio the media is injected into: `listen` (played to the
    remote party, so they hear it), `speak` (mixed into the remote party's own audio
    channel), or `both`. Default `listen`.
    """)
  @example("listen")
  direction?: "listen" | "speak" | "both" = "listen";

  @doc("HTTPS URL that status events are POSTed to.")
  @example("https://example.com/webhooks/relay")
  status_url?: url;

  @doc("Default text-to-speech language for TTS items in `play` that do not set their own. Falls back to the platform default if unset.")
  @example("en-US")
  language?: string;

  @doc("Default text-to-speech voice for TTS items in `play` that do not set their own. Falls back to the platform default if unset.")
  @example("en-US-Standard-C")
  voice?: string;

  @doc("Default text-to-speech voice gender for TTS items in `play` that do not set their own. Falls back to the platform default if unset.")
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
