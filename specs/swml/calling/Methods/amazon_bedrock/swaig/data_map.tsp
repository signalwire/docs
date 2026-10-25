import "@typespec/json-schema";
import "../../ai/swaig/functions/data_map";

using TypeSpec.JsonSchema;

namespace SWML.Calling;

// Bedrock runs its own data_map evaluator and its own action handler, which read less than the
// `ai` ones. Each divergence is declared here and the rest is taken from the shared models:
// - results are `BedrockOutput`: `response` is a plain string, actions always wait until the
//   agent has spoken (no `post_process`), and only six action keys are handled (`BedrockAction`).
// - an expression's `expr` is another name for the text to test, not an evaluated expression,
//   and `pattern` is optional (an expression without one always matches).
// - a webhook honours `error_keys` only as an array, ignores `require_args`, and iterates up to
//   10 `foreach` elements by default.
//
// The Pick lists below are this surface's to maintain: when a shared model gains a property,
// Bedrock keeps its current shape until someone confirms Bedrock reads the new field and adds it
// here. That is the safe direction — an allowlist cannot silently claim support that does not
// exist.

@summary("Bedrock action object")
@doc("""
  An action for an [`amazon_bedrock`](/docs/swml/reference/calling/amazon-bedrock) agent to run once it
  has spoken its reply. One object can set several of these keys, and each key that is set is applied.
  Other keys are ignored.
  """)
model BedrockAction {
  @doc("""
    A SWML document to run, as an object or as a JSON string. By default it runs inline and the agent resumes
    the conversation afterward. With a sibling `transfer` set to `true`, the call is handed to it and the agent ends.
    """)
  SWML?: SWMLObject | string;

  @doc("""
    Use alongside `SWML` in the same action object. When `true`, ends the agent and transfers the call to that SWML.
    When omitted or `false`, the SWML runs inline and the agent continues afterward. **Default:** `false`.
    """)
  @example(true)
  transfer?: boolean | SWMLVar = false;

  ...OptionalProperties<PickProperties<SetGlobalDataAction, "set_global_data">>;
  ...OptionalProperties<PickProperties<
    UnsetGlobalDataAction,
    "unset_global_data"
  >>;
  ...OptionalProperties<PickProperties<SetMetaDataAction, "set_meta_data">>;
  ...OptionalProperties<PickProperties<UnsetMetaDataAction, "unset_meta_data">>;
}

@summary("Bedrock output object")
@doc("""
  The result of a SWAIG function run by an
  [`amazon_bedrock`](/docs/swml/reference/calling/amazon-bedrock) agent.
  
  Narrower than the canonical [`Output`](/docs/swml/reference/calling/ai/swaig/functions/data-map):
  Bedrock reads `response` as a plain string, accepts only the actions in `BedrockAction`, and runs
  them after the agent speaks regardless of `post_process`, so neither the split-response object nor
  `post_process` applies here.
  """)
model BedrockOutput {
  @doc("""
    The result the agent reads next. When absent or not a string, the agent reads `Function completed.`
    and carries on.
    """)
  @example("Order placed")
  response?: string;

  @doc("An action for the agent to run after it has spoken its reply, or a list of them.")
  action?: BedrockAction | BedrockAction[];
}

// Shared by both expression forms: everything except the text being tested.
model BedrockExpressionMatch {
  @doc("""
    A regular expression to match against the tested text. It matches case-insensitively unless written in
    `/pattern/flags` form. When omitted, the expression always matches.
    """)
  @example("refund|return|money back")
  pattern?: string;

  @doc("The result to return when the expression matches.")
  output: BedrockOutput;

  @doc("""
    The result to return when `pattern` does not match. Returning it ends the search, as a match does.
    When omitted, the next expression is tried.
    """)
  `nomatch-output`?: BedrockOutput;
}

@summary("Bedrock expression with string")
model BedrockStringExpression {
  @doc("The text to test, after variable expansion. Takes precedence over `expr`.")
  @example("%{args.reason}")
  string: string;

  ...BedrockExpressionMatch;
}

@summary("Bedrock expression with expr")
model BedrockExprExpression {
  @doc("""
    Another name for `string`, used when `string` is not set: the text to test, after variable expansion.
    Bedrock agents test it as text; it is not evaluated as an arithmetic or logical expression.
    """)
  @example("%{args.reason}")
  expr: string;

  ...BedrockExpressionMatch;
}

@doc("""
  An [expression](/docs/swml/reference/calling/ai/swaig/functions/data-map) evaluated by an
  [`amazon_bedrock`](/docs/swml/reference/calling/amazon-bedrock) agent. It sets the text to test as
  `string` or `expr`. The first expression that returns a result ends the search.
  """)
union BedrockExpression {
  BedrockStringExpression,
  BedrockExprExpression,
}

@summary("Bedrock data_map webhook object")
@doc("""
  An external API call made by an [`amazon_bedrock`](/docs/swml/reference/calling/amazon-bedrock)
  agent's `data_map`. It needs `output`, `expressions`, or both; a webhook with neither is skipped.
  """)
model BedrockWebhook {
  @doc("""
    An array of expressions evaluated against the API response. They are tried before `output`, which is used
    only when no expression returns a result.
    """)
  expressions?: BedrockExpression[];

  @doc("""
    Keys that mark the API response as failed. When any of them is present at the top level of the response,
    whatever its value, the response is not used and the next webhook is tried.
    """)
  @example(#["error", "failed"])
  error_keys?: string[];

  ...OmitProperties<
    Webhook,
    "expressions" | "output" | "error_keys" | "foreach" | "require_args"
  >;

  @doc("""
    Iterates over an array in the API response and builds a string from each element. Processed before
    `expressions` and `output`.
    """)
  foreach?: {
    @doc("The key in the API response that holds the array to iterate over.")
    @example("results")
    input_key: string;

    @doc("The key that receives the built string. Reference it in `expressions` or `output`.")
    @example("deliverer")
    output_key: string;

    @doc("""
      The maximum number of array elements to iterate over, starting at the beginning of the array.
      **Default:** `10`.
      """)
    @example(5)
    max?: integer = 10;

    @doc("""
      The text to append to `output_key` for each element.
      Properties of the current element can be referenced with the following syntax:
      \${this.property_name}.
      """)
    @example("title: \${this.title}, contact: \${this.phone}")
    append: string;
  };

  @doc("The result to return when the API call succeeds and no expression returns a result.")
  output?: BedrockOutput;
}

@summary("Bedrock DataMap object")
@doc("""
  The [`data_map`](/docs/swml/reference/calling/ai/swaig/functions/data-map) of an
  [`amazon_bedrock`](/docs/swml/reference/calling/amazon-bedrock) agent's SWAIG function.
  
  Structurally the same as the `ai` version — expressions, then webhooks, then output, evaluated in
  that order — but every result is a `BedrockOutput`.
  """)
model BedrockDataMap {
  @doc("A result to return when neither `expressions` nor `webhooks` returns one.")
  output?: BedrockOutput;

  @doc("An array of objects that have pattern matching logic to process the user's input data.")
  expressions?: BedrockExpression[];

  @doc("""
    An array of objects that define external API calls. Webhooks are tried in order, and the first one whose
    response is used ends the search.
    """)
  webhooks?: BedrockWebhook[];
}
