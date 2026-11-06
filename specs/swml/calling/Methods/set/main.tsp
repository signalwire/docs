import "@typespec/json-schema";

using TypeSpec.JsonSchema;

namespace SWML.Calling;

@doc("""
  A variable name that `set` can assign and `unset` can remove: an ASCII letter or underscore followed by up to 255 ASCII letters,
  digits, or underscores, optionally prefixed with `vars.`. `foo` and `vars.foo` name the same variable.
  """)
@pattern("^(?:vars\\.)?[_a-zA-Z][_a-zA-Z0-9]{0,255}$")
@summary("SWML variable name")
scalar SetVariableName extends string;

@summary("set Method")
model Set {
  @summary("set")
  @doc("""
    Set script variables to the specified values.
    Accepts an object mapping variable names to values. Each name must be an ASCII letter or underscore followed by up to 255 ASCII letters,
    digits, or underscores, optionally prefixed with `vars.`; `vars.foo` sets the same variable as `foo`.
    These naming rules apply only to the variable names, not to keys inside an assigned object.
    Values can be any JSON value. After variable expansion, each value can nest objects and arrays at most 62 levels deep; a deeper value is not stored.
    Variables set using set can be removed using unset.
    """)
  @example(#{ my_var: "hello", counter: 1, is_valid: true })
  // JSON Schema `propertyNames` has no dedicated TypeSpec decorator; @extension emits the standard keyword.
  @extension("propertyNames", SetVariableName)
  set: {
    ...TypeSpec.Record<unknown>;
  };
}
