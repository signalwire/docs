import "@typespec/json-schema";
import "../../ai/swaig/functions/data_map";

using TypeSpec.JsonSchema;

namespace SWML.Calling;

// Bedrock runs its own data_map evaluator (`bedrock_process_data_map`), which
// reads the result with a string-only accessor and always defers actions rather
// than honouring `post_process`. So its outputs are `BedrockOutput`, not the
// canonical `Output`.
//
// The Pick list below is this surface's to maintain: when `Output` gains a
// property, Bedrock keeps its current shape until someone confirms Bedrock reads
// the new field and adds it here. That is the safe direction — an allowlist
// cannot silently claim support that does not exist.
//
// The DataMap models re-point only the properties that carry an output and
// inherit the rest, so structural changes on the `ai` side still arrive free.

@summary("Bedrock output object")
@doc("""
  The result of a SWAIG function run by an
  [`amazon_bedrock`](/docs/swml/reference/calling/amazon-bedrock) agent.
  
  Narrower than the canonical [`Output`](/docs/swml/reference/calling/ai/swaig/functions/data-map):
  Bedrock reads `response` as a plain string, and defers actions until after the agent speaks
  regardless of `post_process`, so neither the split-response object nor `post_process` applies here.
  """)
model BedrockOutput {
  @doc("""
    The result the agent reads next. When absent, the agent reads a default result and carries on.
    """)
  @example("Order placed")
  response?: string;

  ...PickProperties<Output, "action">;
}

@summary("Bedrock expression object")
@doc("""
  An [expression](/docs/swml/reference/calling/ai/swaig/functions/data-map) evaluated by an
  [`amazon_bedrock`](/docs/swml/reference/calling/amazon-bedrock) agent.
  """)
model BedrockExpression {
  @doc("An object that contains a response and a list of actions to be performed upon a expression match.")
  output: BedrockOutput;

  ...OmitProperties<Expression, "output">;
}

@summary("Bedrock data_map webhook object")
@doc("""
  An external API call made by an [`amazon_bedrock`](/docs/swml/reference/calling/amazon-bedrock)
  agent's `data_map`.
  """)
model BedrockWebhook {
  @doc("An array of objects that have pattern matching logic to process the API response.")
  expressions?: BedrockExpression[];

  @doc("An object that contains a response and a list of actions to be performed on a successful call.")
  output?: BedrockOutput;

  ...OmitProperties<Webhook, "expressions" | "output">;
}

@summary("Bedrock DataMap object")
@doc("""
  The [`data_map`](/docs/swml/reference/calling/ai/swaig/functions/data-map) of an
  [`amazon_bedrock`](/docs/swml/reference/calling/amazon-bedrock) agent's SWAIG function.
  
  Structurally the same as the `ai` version — expressions, then webhooks, then output, evaluated in
  that order — but every result is a `BedrockOutput`: Bedrock reads `response` as a plain string
  only, and always defers actions rather than taking `post_process`.
  """)
model BedrockDataMap {
  @doc("An object that contains a response and a list of actions to be performed upon a SWAIG function call.")
  output?: BedrockOutput;

  @doc("An array of objects that have pattern matching logic to process the user's input data.")
  expressions?: BedrockExpression[];

  @doc("An array of objects that define external API calls.")
  webhooks?: BedrockWebhook[];
}
