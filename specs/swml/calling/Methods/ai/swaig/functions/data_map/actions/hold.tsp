namespace SWML.Calling;
@summary("hold Action")
model HoldAction {
  @doc("""
    Places the caller on hold while playing hold music (configured via params.hold_music).
    During hold, speech detection is paused and the AI agent will not respond to the caller.
    The value is the hold timeout: a number of seconds, or a
    [duration](/docs/swml/reference/calling/ai/params#duration-values) string such as `"5m"`.
    It can also be an object with `timeout`, and optionally `step` and `timeout_step`.
    A timeout outside `0` to `900` seconds (15 minutes) falls back to `300` seconds.
    """)
  @summary("hold")
  @maxValue(900)
  @example("5m")
  hold: int32 | string | {
    @doc("""
      How long to hold the caller: a number of seconds, or a
      [duration](/docs/swml/reference/calling/ai/params#duration-values) string such as `"5m"`.
      A value outside `0` to `900` seconds falls back to `300`.
      """)
    @maxValue(900)
    @example("5m")
    timeout?: int32 | string = 300;

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
