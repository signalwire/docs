import "@signalwire/typespec-asyncapi";
import "../../../common/frames.tsp";
import "@typespec/openapi";

import "./models/send.tsp";
import "./models/reply.tsp";
import "./models/events.tsp";

using SignalWire.AsyncAPI;
using TypeSpec.OpenAPI;

namespace Relay.Calling;

const callingPlay = "calling.play";
const callingPlayResponse = "${callingPlay} response";

model PlayRequest is JsonRpcRequest<typeof callingPlay, PlayParams>;

@extension("x-fern-display-name", callingPlayResponse)
@reply model PlayReply is JsonRpcResponse<PlayResult>;

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
@channel(callingPlay)
@summary("Play media to a call")
@extension("x-fern-display-name", callingPlay)
op play(...PlayRequest): PlayReply | CallPlayEvent;

const callingPlayPause = "calling.play.pause";
const callingPlayPauseResponse = "${callingPlayPause} response";

model PlayPauseRequest is JsonRpcRequest<typeof callingPlayPause, PlayPauseParams>;

@extension("x-fern-display-name", callingPlayPauseResponse)
@reply model PlayPauseReply is JsonRpcResponse<PlayPauseResult>;

@doc("Pauses a play you started with `calling.play`, identified by its `control_id`. Resume it later with `calling.play.resume`.")
@channel(callingPlayPause)
@summary("Pause an active play")
@extension("x-fern-display-name", callingPlayPause)
op playPause(...PlayPauseRequest): PlayPauseReply;

const callingPlayResume = "calling.play.resume";
const callingPlayResumeResponse = "${callingPlayResume} response";

model PlayResumeRequest is JsonRpcRequest<typeof callingPlayResume, PlayResumeParams>;

@extension("x-fern-display-name", callingPlayResumeResponse)
@reply model PlayResumeReply is JsonRpcResponse<PlayResumeResult>;

@doc("Resumes a play you paused with `calling.play.pause`, identified by its `control_id`.")
@channel(callingPlayResume)
@summary("Resume a paused play")
@extension("x-fern-display-name", callingPlayResume)
op playResume(...PlayResumeRequest): PlayResumeReply;

const callingPlayStop = "calling.play.stop";
const callingPlayStopResponse = "${callingPlayStop} response";

model PlayStopRequest is JsonRpcRequest<typeof callingPlayStop, PlayStopParams>;

@extension("x-fern-display-name", callingPlayStopResponse)
@reply model PlayStopReply is JsonRpcResponse<PlayStopResult>;

@doc("Stops a play you started with `calling.play`, identified by its `control_id`.")
@channel(callingPlayStop)
@summary("Stop an active play")
@extension("x-fern-display-name", callingPlayStop)
op playStop(...PlayStopRequest): PlayStopReply;

const callingPlayVolume = "calling.play.volume";
const callingPlayVolumeResponse = "${callingPlayVolume} response";

model PlayVolumeRequest is JsonRpcRequest<typeof callingPlayVolume, PlayVolumeParams>;

@extension("x-fern-display-name", callingPlayVolumeResponse)
@reply model PlayVolumeReply is JsonRpcResponse<PlayVolumeResult>;

@doc("Adjusts the volume of a play you started with `calling.play`, identified by its `control_id`.")
@channel(callingPlayVolume)
@summary("Adjust the volume of an active play")
@extension("x-fern-display-name", callingPlayVolume)
op playVolume(...PlayVolumeRequest): PlayVolumeReply;
