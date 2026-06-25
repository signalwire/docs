import "@signalwire/typespec-asyncapi";

import "./models/requests.tsp";
import "./models/responses.tsp";
import "../../events/play.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

// NOTE: no @opExample here — `play: PlayMedia[]` is a @discriminator union, and TypeSpec
// value-checking does not narrow a discriminated base to its variant, so an inline frame
// example can't carry real `params`. The PlayMedia variant models in common.tsp carry
// schema-level @example values instead.
@doc("""
  Plays a sequence of media to a call. Each element is one of audio (a file at
  a URL), TTS (spoken text), silence, or ringtone, and they play in the order
  given. Use it to play prompts, hold music, announcements, or generated speech.

  The immediate result confirms the play started; playback state changes
  (`playing`, `paused`, `finished`, `error`) arrive asynchronously via
  `calling.call.play` events keyed
  on your `control_id`. Pause, resume, change the volume, or stop it mid-play
  with the matching `calling.play.*` methods using the same `control_id`.
  """)
@channel("calling.play")
@summary("Play media to a call")
op play(...PlayParams): PlayResult | CallPlayEvent;

@doc("Pause an active play.")
@channel("calling.play.pause")
@summary("Pause an active play")
@opExample(#{
  parameters: #{
    node_id: "a3b3e8e0-1234-4a4b-8c8d-000000000001",
    call_id: "b4c4f9f1-2345-4b5c-9d9e-000000000002",
    control_id: "play-1",
  },
  returnType: #{ code: "200", message: "Paused play" },
})
op playPause(...PlayPauseParams): PlayPauseResult;

@doc("Resume an active paused play.")
@channel("calling.play.resume")
@summary("Resume a paused play")
@opExample(#{
  parameters: #{
    node_id: "a3b3e8e0-1234-4a4b-8c8d-000000000001",
    call_id: "b4c4f9f1-2345-4b5c-9d9e-000000000002",
    control_id: "play-1",
  },
  returnType: #{ code: "200", message: "Resumed play" },
})
op playResume(...PlayResumeParams): PlayResumeResult;

@doc("Stop an active play.")
@channel("calling.play.stop")
@summary("Stop an active play")
@opExample(#{
  parameters: #{
    node_id: "a3b3e8e0-1234-4a4b-8c8d-000000000001",
    call_id: "b4c4f9f1-2345-4b5c-9d9e-000000000002",
    control_id: "play-1",
  },
  returnType: #{ code: "200", message: "Stopping play" },
})
op playStop(...PlayStopParams): PlayStopResult;

@doc("Adjust the volume of an active play.")
@channel("calling.play.volume")
@summary("Adjust the volume of an active play")
@opExample(#{
  parameters: #{
    node_id: "a3b3e8e0-1234-4a4b-8c8d-000000000001",
    call_id: "b4c4f9f1-2345-4b5c-9d9e-000000000002",
    control_id: "play-1",
    volume: 3.0,
  },
  returnType: #{ code: "200", message: "Changed play volume" },
})
op playVolume(...PlayVolumeParams): PlayVolumeResult;
