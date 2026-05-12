import "@typespec/json-schema";

using TypeSpec.JsonSchema;

namespace SWML.Calling;

model PayParameters {
  @doc("The identifier for your custom parameter. This will be the key in the parameters object.")
  @example("merchant_id")
  name: string;

  @doc("The value associated with the parameter. This will be the value in the parameters object.")
  @example("12345")
  value: string;
}
