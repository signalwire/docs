import "@typespec/json-schema";
import "./output.tsp";

using TypeSpec.JsonSchema;

namespace SWML.Calling;

// Every member a `data_map` expression can carry. Each usable expression sets either `string`
// (tested with `pattern`) or `expr`; the `ai` lists below take `DataMapExpression`, which
// encodes that. `amazon_bedrock` derives its own expression from this model.
@summary("Expression object")
model Expression {
  @doc("""
    The value to test, after variable expansion. Matched against `pattern`.
    Set either `string` or `expr`.
    """)
  @example("%{args.reason}")
  string?: string;

  @doc("""
    An expression evaluated after variable expansion, used instead of `string`. The expression matches
    when it evaluates to a nonzero value. When it doesn't match and `pattern` is set, `pattern` is tried
    against the same text.
    """)
  @example("%{args.quantity}")
  expr?: string;

  @doc("""
    A regular expression to match against `string`. It matches case-insensitively unless written in
    `/pattern/flags` form. Required with `string`.
    """)
  @example("refund|return|money back")
  pattern?: string;

  @doc("An object that contains a response and a list of actions to be performed upon a expression match.")
  output: Output;

  @doc("The result to return when the expression doesn't match. When omitted, the next expression is tried.")
  `nomatch-output`?: Output;
}

@summary("Expression with string")
model StringExpression {
  ...OmitProperties<Expression, "string" | "expr" | "pattern">;

  @doc("The value to test, after variable expansion. Matched against `pattern`.")
  @example("%{args.reason}")
  string: string;

  @doc("A regular expression to match against `string`. It matches case-insensitively unless written in `/pattern/flags` form.")
  @example("refund|return|money back")
  pattern: string;
}

@summary("Expression with expr")
model ExprExpression {
  ...OmitProperties<Expression, "string" | "expr" | "pattern">;

  @doc("""
    An expression evaluated after variable expansion. The expression matches when it evaluates to a
    nonzero value. When it doesn't match and `pattern` is set, `pattern` is tried against the same text.
    """)
  @example("%{args.quantity}")
  expr: string;

  @doc("""
    Optional. A regular expression tried against the expanded `expr` text when `expr` doesn't match. It
    matches case-insensitively unless written in `/pattern/flags` form.
    """)
  @example("^yes$")
  pattern?: string;
}

union DataMapExpression {
  StringExpression,
  ExprExpression,
}
