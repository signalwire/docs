import "@typespec/json-schema";
import "../../Shared/Types/main.tsp";

using TypeSpec.JsonSchema;

model Hint {
  @doc("The hint to match. This will match the string exactly as provided")
  hint: string;

  @doc("A regular expression to match the hint against. This will ensure that the hint has a valid matching pattern before being replaced.")
  pattern: string;

  @doc("The text to replace the hint with. This will replace the portion of the hint that matches the pattern.")
  replace: string;

  @doc("If true, the hint will be matched in a case-insensitive manner. Defaults to false.")
  ignore_case?: boolean | SWMLVar;
}
