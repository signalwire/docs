import "@typespec/json-schema";
import "../../../Shared/Types/main.tsp";

using TypeSpec.JsonSchema;

namespace SWML.Calling;

@summary("Recognition hint")
@doc("A word or phrase passed to speech recognition as a hint.")
model HintWord {
  @doc("A word or phrase passed to speech recognition as a hint, the same as a string entry in `hints`.")
  @example("customer service")
  hint: string;
}

// `pattern` and `replace` only work as a pair: the rewrite runs when both are set.
// `hint` is optional on this form and is passed to speech recognition on its own.
@summary("Heard-text replacement")
@doc("A rule that rewrites matching text in what the agent hears before the AI reads it.")
model HintReplacement {
  @doc("A word or phrase passed to speech recognition as a hint, the same as a string entry in `hints`.")
  @example("customer service")
  hint?: string;

  @doc("A regular expression matched against the text the agent hears. Must be set together with `replace`.")
  @example("customer\\s+service")
  pattern: string;

  @doc("The text that replaces each match of `pattern`. Must be set together with `pattern`.")
  @example("support team")
  replace: string;

  @doc("If `true`, `pattern` is matched case-insensitively. **Default:** `false`.")
  @example(true)
  ignore_case?: boolean = false;
}

union Hint {
  HintWord,
  HintReplacement,
}
