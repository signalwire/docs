@summary("return Method")
model Return {
  @summary("return")
  @doc("""
    Return from the current section. Inside a subroutine called via `execute`, control
    returns to the caller and the value is accessible as `return_value` in the caller's
    context. In `main`, stops execution entirely (return value is discarded).
    """)
  @example("success")
  `return`: string | null;
}
