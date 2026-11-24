
namespace SWML.Calling;
@summary("change_step Action")
model ChangeStepAction {
  @doc("""
    The name of the step to switch to. The step must be defined in the current context's steps
    array; it doesn't need to be in the current step's `valid_steps`. Naming the step the agent is
    already in starts that step over: its text is rebuilt from the current variables (so a
    `set_global_data` in the same result is reflected, whatever the order of the actions), its
    `history` mode applies again, and its functions are set again.
    """)
  @summary("change_step")
  @example("confirm_order")
  change_step: string;
}
