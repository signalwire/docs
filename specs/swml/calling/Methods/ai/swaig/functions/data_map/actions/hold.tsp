namespace SWML.Calling;
@summary("hold Action")
model HoldAction {
  @doc("""
    Places the caller on hold while playing hold music (configured via params.hold_music).
    During hold, speech detection is paused and the AI agent will not respond to the caller.
    The value specifies the hold timeout in seconds.
    Can be a number or an object with timeout property.
    """)
  @summary("hold")
  @maxValue(900)
  @example(120)
  hold: int32 | SWMLVar | {
    @doc("The duration to hold the caller in seconds. Can be a number or an object with timeout property.")
    @maxValue(900)
    @example(300)
    timeout?: int32 | SWMLVar = 300;

    @doc("""
      The step to move to when the caller is taken off hold. When omitted, the conversation stays on
      the current step. Applies only if the hold starts.
      """)
    @example("resume_order")
    step?: string;

    @doc("""
      The step to move to when the hold times out without the caller being taken off hold. When omitted,
      the conversation stays on the current step. Applies only if the hold starts.
      """)
    @example("callback_offer")
    timeout_step?: string;
  };
}
