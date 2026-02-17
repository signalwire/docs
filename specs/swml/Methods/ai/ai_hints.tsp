import "@typespec/json-schema";
import "../../Shared/Types/main.tsp";

using TypeSpec.JsonSchema;

model HintObject {
  @doc("The hint to match. This will match the string exactly as provided")
  @example("customer service")
  hint: string;

  @doc("A regular expression to match the hint against. This will ensure that the hint has a valid matching pattern before being replaced.")
  @example("customer\\s+service")
  pattern: string;

  @doc("The text to replace the hint with. This will replace the portion of the hint that matches the pattern.")
  @example("support team")
  replace: string;

  @doc("If true, the hint will be matched in a case-insensitive manner. **Default:** `false`.")
  @example(true)
  ignore_case?: boolean | SWMLVar = false;
}

@doc("A hint can be a simple string to help the AI understand specific words, or an object with pattern matching and replacement rules.")
union Hint {
  @doc("A simple string hint to help the AI understand a specific word or phrase.")
  string: string,

  @doc("An object hint with pattern matching and replacement rules.")
  object: HintObject,
}
