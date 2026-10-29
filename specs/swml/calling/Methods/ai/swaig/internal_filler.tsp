import "../_shared/fillers.tsp";

namespace SWML.Calling;

model SWAIGInternalFiller {
  @doc("Filler phrases played when the AI Agent is checking the time. Used only when `check_time` is listed in [`SWAIG.native_functions`](/docs/swml/reference/calling/ai/swaig#swaignative_functions).")
  check_time?: FunctionFillers;

  @doc("Filler phrases played when the AI Agent is waiting for user input. Used only when `wait_for_user` is listed in [`SWAIG.native_functions`](/docs/swml/reference/calling/ai/swaig#swaignative_functions).")
  wait_for_user?: FunctionFillers;

  @doc("Filler phrases played during deliberate pauses or wait periods. Used only when `wait_seconds` is listed in [`SWAIG.native_functions`](/docs/swml/reference/calling/ai/swaig#swaignative_functions).")
  wait_seconds?: FunctionFillers;

  @doc("Filler phrases played when the AI Agent is adjusting response timing. Used only when `adjust_response_latency` is listed in [`SWAIG.native_functions`](/docs/swml/reference/calling/ai/swaig#swaignative_functions).")
  adjust_response_latency?: FunctionFillers;

  @doc("Filler phrases played when transitioning between conversation steps when utilizing `prompt.contexts`.")
  next_step?: FunctionFillers;

  @doc("Filler phrases played when switching between conversation contexts when utilizing `prompt.contexts`.")
  change_context?: FunctionFillers;

  @doc("""
    Filler phrases played when the AI Agent is processing visual input. This function is enabled
    when `enable_vision` is set to `true` in `ai.params`.
    Leaving this out does not silence the agent: a built-in English set is used under `en-US`
    instead, so set this key to change the wording or to cover another language.
    """)
  get_visual_input?: FunctionFillers;

  @doc("""
    Filler phrases played when the AI Agent is thinking or considering options. This is utilized
    when `enable_thinking` is set to `true` in `ai.params`.
    Leaving this out does not silence the agent: a built-in English set is used under `en-US`
    instead, so set this key to change the wording or to cover another language.
    """)
  get_ideal_strategy?: FunctionFillers;

  @doc("""
    Filler phrases played when the AI Agent pauses the conversation at the caller's request. This
    function is enabled when `enable_pause` is set to `true` in `ai.params`, which `start_paused`
    also turns on. Setting `speak_when_spoken_to` turns `enable_pause` back off, which leaves this
    key with nothing to play.
    """)
  pause_conversation?: FunctionFillers;
}
