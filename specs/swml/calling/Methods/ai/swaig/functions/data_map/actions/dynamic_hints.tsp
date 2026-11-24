import "../../../../ai_hints.tsp";

namespace SWML.Calling;

@summary("add_dynamic_hints Action")
model AddDynamicHintsAction {
  @doc("""
    Adds speech recognition hints during the call, in the same forms as the `ai` method's `hints`:
    strings, or objects with `hint`, or `pattern` and `replace`. Where the speech recognizer accepts
    hints during a call, the new list (the agent's hints, then the dynamic ones) is applied between
    turns without restarting recognition. Otherwise recognition restarts with the new list. Not on
    realtime models.
    """)
  @summary("add_dynamic_hints")
  @example(#["Cabby", #{ pattern: "cab bee", replace: "Cabby", ignore_case: true }])
  add_dynamic_hints: (string | Hint)[];
}

@summary("clear_dynamic_hints Action")
model ClearDynamicHintsAction {
  @doc("""
    Removes every hint added with `add_dynamic_hints`. Set it to an empty object. The new list is
    applied the same way as for `add_dynamic_hints`. Not on realtime models.
    """)
  @summary("clear_dynamic_hints")
  @example(#{})
  clear_dynamic_hints: {};
}
