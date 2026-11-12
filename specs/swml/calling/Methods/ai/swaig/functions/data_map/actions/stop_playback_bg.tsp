namespace SWML.Calling;
@summary("stop_playback_bg Action")
model StopPlaybackBGAction {
  @summary("stop_playback_bg")
  @doc("Stops the background audio file. The action runs whenever the key is present, whatever its value, so `false` also stops playback; leave the key out to keep playing.")
  @example(true)
  stop_playback_bg: boolean | SWMLVar;
}
