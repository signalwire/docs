@summary("Unset object")
model Unset {
  @summary("unset")
  @doc("""
    Unset specified variables. The variables may have been set using the set method
    or as a byproduct of other statements or methods.
    """)
  unset: {
    @doc("Names of the variables to unset.")
    @example(#["temp_data", "session_id"])
    vars: string | string[];
  };
}
