import "../set";

namespace SWML.Calling;
@summary("unset Method")
model Unset {
  @summary("unset")
  @doc("""
    Unset specified variables. The variables may have been set using the set method
    or as a byproduct of other statements or methods.
    Accepts a single variable name as a string or an array of variable names.
    Each name is a literal variable name, not a variable reference: an ASCII letter or underscore followed by up to 255 ASCII letters,
    digits, or underscores, optionally prefixed with `vars.`.
    `unset` removes top-level variables of the current call; `foo` and `vars.foo` remove the same variable, and the whole value is removed.
    Dotted child paths and other namespaces such as `call` or `params` cannot be unset.
    """)
  @example("temp_data")
  unset: SetVariableName | SetVariableName[];
}
