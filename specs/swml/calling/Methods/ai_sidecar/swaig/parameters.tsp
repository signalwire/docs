import "@typespec/json-schema";

using TypeSpec.JsonSchema;

namespace SWML.Calling;

@summary("AISidecarParamBase object")
model AISidecarParamBase {
  @doc("A human-readable description of the property, sent to the model so it knows what to pass.")
  @example("The competitor's company name.")
  description?: string;
}

@summary("AISidecarStringParam object")
model AISidecarStringParam is AISidecarParamBase {
  @doc("The property type.")
  type: "string";

  @doc("The allowed values for the property.")
  @example(#["timeline", "budget", "authority", "urgency"])
  `enum`?: string[];

  @doc("The default value used when the model omits the property.")
  @example("timeline")
  default?: string;
}

@summary("AISidecarIntegerParam object")
model AISidecarIntegerParam is AISidecarParamBase {
  @doc("The property type.")
  type: "integer";

  @doc("The allowed values for the property.")
  @example(#[1, 2, 3])
  `enum`?: integer[];

  @doc("The default value used when the model omits the property.")
  @example(1)
  default?: integer;
}

@summary("AISidecarNumberParam object")
model AISidecarNumberParam is AISidecarParamBase {
  @doc("The property type.")
  type: "number";

  @doc("The allowed values for the property.")
  @example(#[0.5, 1])
  `enum`?: float[];

  @doc("The default value used when the model omits the property.")
  @example(1.0)
  default?: float;
}

@summary("AISidecarBooleanParam object")
model AISidecarBooleanParam is AISidecarParamBase {
  @doc("The property type.")
  type: "boolean";

  @doc("The default value used when the model omits the property.")
  @example(false)
  default?: boolean;
}

@summary("AISidecarArrayParam object")
model AISidecarArrayParam is AISidecarParamBase {
  @doc("The property type.")
  type: "array";

  @doc("The schema for each item in the array.")
  items: AISidecarParamProperty;
}

@summary("AISidecarObjectParam object")
model AISidecarObjectParam is AISidecarParamBase {
  @doc("The property type.")
  type: "object";

  @doc("The nested properties of the object, keyed by property name.")
  properties?: {
    ...TypeSpec.Record<AISidecarParamProperty>;
  };

  @doc("The names of the required nested properties.")
  @example(#["id"])
  required?: string[];
}

@oneOf
@summary("AISidecarParamProperty")
union AISidecarParamProperty {
  AISidecarStringParam,
  AISidecarIntegerParam,
  AISidecarNumberParam,
  AISidecarBooleanParam,
  AISidecarArrayParam,
  AISidecarObjectParam,
}

@summary("AISidecarFunctionParameters object")
model AISidecarFunctionParameters {
  @doc("The container type for the function's arguments. Always `object`.")
  @example("object")
  type: "object";

  @doc("""
    The properties the function accepts, keyed by property name. Each property allows only `type`, `description`,
    `enum`, and `default` — additional validation keywords such as `pattern`, `format`, `minimum`, and `maximum`
    are not accepted; express those constraints in the property `description` and validate them server-side.
    """)
  properties: {
    ...TypeSpec.Record<AISidecarParamProperty>;
  };

  @doc("The names of the required properties.")
  @example(#["competitor"])
  required?: string[];
}
