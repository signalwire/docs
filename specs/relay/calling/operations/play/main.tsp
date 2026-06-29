import "@signalwire/typespec-asyncapi";

import "./models/requests.tsp";
import "./models/responses.tsp";
import "../../events/play.tsp";

using SignalWire.AsyncAPI;

namespace Relay.Calling;

model PlayRequest is JsonRpcRequest<"calling.play", PlayParams>;
@reply model PlayReply is JsonRpcResponse<PlayResult>;

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
op play(...PlayRequest): PlayReply | CallPlayEvent;

model PlayPauseRequest is JsonRpcRequest<"calling.play.pause", PlayPauseParams>;
@reply model PlayPauseReply is JsonRpcResponse<PlayPauseResult>;

@doc("Pause an active play.")
@channel("calling.play.pause")
@summary("Pause an active play")
op playPause(...PlayPauseRequest): PlayPauseReply;

model PlayResumeRequest is JsonRpcRequest<"calling.play.resume", PlayResumeParams>;
@reply model PlayResumeReply is JsonRpcResponse<PlayResumeResult>;

@doc("Resume an active paused play.")
@channel("calling.play.resume")
@summary("Resume a paused play")
op playResume(...PlayResumeRequest): PlayResumeReply;

model PlayStopRequest is JsonRpcRequest<"calling.play.stop", PlayStopParams>;
@reply model PlayStopReply is JsonRpcResponse<PlayStopResult>;

@doc("Stop an active play.")
@channel("calling.play.stop")
@summary("Stop an active play")
op playStop(...PlayStopRequest): PlayStopReply;

model PlayVolumeRequest is JsonRpcRequest<"calling.play.volume", PlayVolumeParams>;
@reply model PlayVolumeReply is JsonRpcResponse<PlayVolumeResult>;

@doc("Adjust the volume of an active play.")
@channel("calling.play.volume")
@summary("Adjust the volume of an active play")
op playVolume(...PlayVolumeRequest): PlayVolumeReply;
