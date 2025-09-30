import "../_shared/fillers.tsp";

model SWAIGInternalFiller {
  @doc("""
    This function is used to hangup the call.
    Fillers will be played when the `hangup` function is called.
    """)
  hangup?: FunctionFillers;

  @doc("""
    This function is used to check the current time.
    Fillers will be played when the `check_time` function is called.
    """)
  check_time?: FunctionFillers;

  @doc("""
    This function is used to wait for user input.
    Fillers will be played when the `wait_for_user` function is called.
    """)
  wait_for_user?: FunctionFillers;

  @doc("""
    This function is used to wait for a specified number of seconds.
    Fillers will be played when the `wait_seconds` function is called.
    """)
  wait_seconds?: FunctionFillers;

  @doc("""
    This function is used to adjust the response latency of the AI Agent.
    Fillers will be played when the `adjust_response_latency` function is called.
    """)
  adjust_response_latency?: FunctionFillers;

  @doc("""
    This function is used to proceed to the next step in the conversation flow.
    Fillers will be played when the `next_step` function is called.
    """)
  next_step?: FunctionFillers;

  @doc("""
    This function is used to change the context of the conversation.
    Fillers will be played when the `change_context` function is called.
    """)
  change_context?: FunctionFillers;

  @doc("""
    This function is used to visually process input that the AI Agent has captured.
    Fillers will be played when the `get_visual_input` function is called.
    """)
  get_visual_input?: FunctionFillers;

  @doc("""
    This function is used to get the ideal strategy for the current conversation state.
    Fillers will be played when the ai utilizes the `thinking` capability and uses the `get_ideal_strategy` function.
    """)
  get_ideal_strategy?: FunctionFillers;
}
