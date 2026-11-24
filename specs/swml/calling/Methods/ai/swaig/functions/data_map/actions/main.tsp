import "./swml.tsp";
import "./change_context.tsp";
import "./change_step.tsp";
import "./context_switch.tsp";
import "./hangup.tsp";
import "./hold.tsp";
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
import "./transfer.tsp";
import "./settings.tsp";
import "./user_event.tsp";
import "./no_barge_next_response.tsp";
import "./semantic_gate_mark.tsp";
import "./back_to_back_functions.tsp";
import "./extensive_data.tsp";
import "./change_voice.tsp";
import "./dynamic_hints.tsp";
import "./speech_timeouts.tsp";
import "./wait_for_user.tsp";

namespace SWML.Calling;

@summary("Action union")
union Action {
  SWMLAction,
  ChangeContextAction,
  ChangeStepAction,
  ContextSwitchAction,
  HangupAction,
  HoldAction,
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
  TransferAction,
  SettingsAction,
  UserEventAction,
  NoBargeNextResponseAction,
  SemanticGateMarkAction,
  BackToBackFunctionsAction,
  ExtensiveDataAction,
  ChangeVoiceAction,
  AddDynamicHintsAction,
  ClearDynamicHintsAction,
  EndOfSpeechTimeoutAction,
  SpeechEventTimeoutAction,
  WaitForUserAction,
}
