@summary("Set object")
model Set {
  @summary("set")
  @doc("""
    Set script variables to the specified values.
    No specific parameters.
    Accepts an object mapping variable names to values.
    """)
  @example(#{ my_var: "hello", counter: 1, is_valid: true })
  set: {
    ...TypeSpec.Record<unknown>;
  };
}
