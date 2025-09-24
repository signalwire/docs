import "@typespec/json-schema";

using TypeSpec.JsonSchema;

@summary("Pronounce object")
model Pronounce {
  @doc("The expression to replace.")
  replace: string;

  @doc("The phonetic spelling of the expression.")
  with: string;

  @doc("Whether the pronunciation replacement should ignore case.")
  ignore_case?: boolean | SWMLVar;
}
