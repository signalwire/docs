namespace SWML.Calling;

@summary("back_to_back_functions Action")
model BackToBackFunctionsAction {
  @doc("""
    Whether the model may call another function right after a function result, without answering
    the caller in words first. The setting lasts for the rest of the call.

    - `"forever"` (the default): the model may chain function calls freely.
    - `false`: the model must answer in words after a function result.
    - `true`: while chaining is off, allows one more chained call. It doesn't change `"forever"`.

    Any other value is ignored. The post-prompt and a `summarize_conversation` summary always run
    with `"forever"`. Not on realtime models.
    """)
  @summary("back_to_back_functions")
  @example(false)
  back_to_back_functions: boolean | "forever";
}
