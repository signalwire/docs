import "./swml.tsp";
import "./context_switch.tsp";
import "./playback_bg.tsp";
import "./say.tsp";
import "./set_global_data.tsp";
import "./set_meta_data.tsp";
import "./stop.tsp";
import "./stop_playback_bg.tsp";
import "./toggle_functions.tsp";
import "./unset_global_data.tsp";
import "./unset_meta_data.tsp";
import "./user_input.tsp";

@summary("Action union")
union Action {
  SWMLAction,
  ContextSwitchAction,
  PlaybackBGAction,
  SayAction,
  SetGlobalDataAction,
  SetMetaDataAction,
  StopAction,
  StopPlaybackBGAction,
  ToggleFunctionsAction,
  UnsetGlobalDataAction,
  UnsetMetaDataAction,
  UserInputAction,
}
