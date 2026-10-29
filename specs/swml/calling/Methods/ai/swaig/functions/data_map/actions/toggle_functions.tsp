namespace SWML.Calling;
@summary("toggle_functions Action")
model ToggleFunctionsAction {
  @summary("toggle_functions")
  @doc("""
    Turns SWAIG functions on or off. A function can only toggle functions that have the same
    `meta_data_token` as itself.
    """)
  toggle_functions: {
    @doc("Whether to activate or deactivate the function. **Default:** `true`.")
    @example(true)
    active?: boolean | SWMLVar = true;

    @doc("The name of the function to toggle.")
    @minLength(1)
    @example("Discount")
    function: string;
  }[];
}
