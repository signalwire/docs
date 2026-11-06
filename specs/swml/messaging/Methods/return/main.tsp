namespace SWML.Messaging;
@summary("return Method")
model Return {
  @summary("return")
  @doc("""
    Return from the current section. Inside a section or document called via `execute`,
    control returns to the caller and the value is accessible as `return_value` in the
    caller's context. A document run with `execute` starts at its own `main`, so a
    `return` there also hands its value back to the caller. In the top-level `main`,
    meaning the document handling the inbound message or a document reached through
    `transfer`, there is no caller: `return` stops execution entirely and its value is
    discarded. To return without a value, use `return: null`.
    """)
  @example("success")
  `return`: unknown;
}
