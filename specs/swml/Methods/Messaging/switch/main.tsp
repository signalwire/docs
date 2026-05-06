import "../..";

@summary("MessagingSwitchTransform enum")
@doc("Transform applied to the variable value before matching.")
enum MessagingSwitchTransform {
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
model MessagingSwitch {
  @summary("switch")
  @doc("Branch based on a variable value with optional text transforms.")
  switch: {
    @doc("Variable path to match. Specified without `%{}` wrapper (e.g. `message.body`).")
    @example("message.body")
    variable: string;

    @doc("Transform to apply to the value before matching.")
    @example(MessagingSwitchTransform.lowercase_trim)
    transform?: MessagingSwitchTransform;

    @doc("Map of values to arrays of SWML methods to execute.")
    case: {
      ...TypeSpec.Record<MessagingMethods[]>;
    };

    @doc("Array of SWML methods to execute if no cases match.")
    default?: MessagingMethods[];
  };
}
