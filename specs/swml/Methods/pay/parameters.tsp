import "@typespec/json-schema";

using TypeSpec.JsonSchema;

model PayParameters {
  @doc("The identifier for your custom parameter. This will be the key in the parameters object.")
  name: string;

  @doc("The value associated with the parameter. This will be the value in the parameters object.")
  value: string;
}
