import "../..";

namespace SWML.Messaging;

@summary("SwitchTransform enum")
@doc("Transform applied to the variable value before matching.")
enum SwitchTransform {
  @doc("Convert to lowercase.")
  lowercase,

  @doc("Convert to uppercase.")
  uppercase,

  @doc("Strip leading and trailing whitespace.")
  trim,

  @doc("Convert to lowercase, then strip whitespace.")
  lowercase_trim,

  @doc("Convert to uppercase, then strip whitespace.")
  uppercase_trim,
}

@summary("switch Method")
model Switch {
  @summary("switch")
  @doc("Branch based on a variable value with optional text transforms.")
  switch: {
    @doc("Variable path to match. Specified without `%{}` wrapper (e.g. `message.body`).")
    @example("message.body")
    variable: string;

    @doc("Transform to apply to the value before matching.")
    @example(SwitchTransform.lowercase_trim)
    transform?: SwitchTransform;

    @doc("Map of values to arrays of SWML methods to execute.")
    case: {
      ...TypeSpec.Record<SWMLMethod[]>;
    };

    @doc("Array of SWML methods to execute if no cases match.")
    default?: SWMLMethod[];
  };
}
