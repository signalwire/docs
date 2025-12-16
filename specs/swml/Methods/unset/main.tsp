@summary("Unset object")
model Unset {
  @summary("unset")
  @doc("Un set a variable that as been `set`.")
  unset: {
    @doc("Names of the variables to unset.")
    @example(#["temp_data", "session_id"])
    vars: string | string[];
  };
}
