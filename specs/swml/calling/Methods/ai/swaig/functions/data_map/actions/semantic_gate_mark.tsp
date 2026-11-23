namespace SWML.Calling;

@summary("semantic_gate_mark Action")
model SemanticGateMarkAction {
  @doc("""
    Sets a named mark that a semantic gate's `since` judges the conversation from: 1 to 64 letters,
    digits, or underscores. The mark is set as of the start of the result's action list, so a `say`
    anywhere in the same list comes after it. Setting a mark again moves it. Marks last for the whole
    call, and a call keeps up to 16 mark names, dropping the oldest past that. An invalid name sets
    nothing.
    """)
  @summary("semantic_gate_mark")
  @pattern("^[A-Za-z0-9_]{1,64}$")
  @example("refund_readback")
  semantic_gate_mark: string;
}
