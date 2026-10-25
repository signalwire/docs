import "@typespec/json-schema";
import "./expression.tsp";

using TypeSpec.JsonSchema;

namespace SWML.Calling;

// Every member a `data_map` webhook can carry. A usable webhook sets `output`, `expressions`, or
// both; the `ai` list takes `DataMapWebhook`, which encodes that. `amazon_bedrock` derives its own
// webhook from this model.
@summary("Webhook object")
model Webhook {
  @doc("""
    A list of expressions to be evaluated upon matching.
    If the following properties are set (foreach, expressions, output), they will be processed in the following order:
    1. foreach
    2. expressions
    3. output
    """)
  expressions?: DataMapExpression[];

  @doc("A string or array of strings that represent the keys to be used for error handling. This will match the key(s) in the response from the API call.")
  @example("failed")
  error_keys?: string | string[];

  @doc("The endpoint for the external service or API.")
  @example("https://example.com")
  url: string;

  @doc("""
    Iterates over an array of objects and processes a output based on each element in the array. Works similarly to JavaScript's forEach method.
    If the following properties are set (foreach, expressions, output), they will be processed in the following order:
    1. foreach
    2. expressions
    3. output
    """)
  foreach?: {
    @doc("The key to be used to access the current element in the array.")
    @example("success")
    input_key: string;

    @doc("The key that can be referenced in the output of the `foreach` iteration. The values that are stored from `append` will be stored in this key.")
    @example("deliverer")
    output_key: string;

    @doc("The max amount of elements that are iterated over in the array. This will start at the beginning of the array.")
    @example(5)
    max?: integer;

    @doc("""
      The values to append to the output_key.
      Properties from the object can be referenced and added to the output_key by using the following syntax:
      \${this.property_name}.
      The `this` keyword is used to reference the current object in the array.
      """)
    @example("title: \${this.title}, contact: \${this.phone}")
    append: string;
  };

  @doc("Any necessary headers for the API call. Header values are sent exactly as written.")
  @example(#{ `Content-Type`: "application/json", `X-API-Key`: "your-api-key" })
  headers?: {
    ...TypeSpec.Record<string>;
  };

  @doc("""
    The HTTP method for the API call: `GET` or `POST`. The request is sent as a `POST` whenever it has
    a body, that is when `params` is set or `input_args_as_params` is `true`, whatever this is set to.
    **Default:** `GET`.
    """)
  @example("POST")
  method?: "GET" | "POST" = "GET";

  @doc("""
    Sends the request body as a single URL-encoded form field with this name, instead of as JSON.
    The whole JSON body becomes the value of that one field. Only applies when the request has a body.
    """)
  @example("payload")
  form_param?: string;

  @doc("A boolean to determine if the input arguments should be passed as parameters. **Default:** `false`.")
  @example(true)
  input_args_as_params?: boolean = false;

  @doc("An object of any necessary parameters for the API call. The key is the parameter name and the value is the parameter value.")
  @example(#{ account_id: "acc_123", include_details: true })
  params?: {
    ...TypeSpec.Record<unknown>;
  };

  @doc("""
    The names of function arguments that must be present for this webhook to be used. With an array,
    any one of the listed arguments is enough. An argument counts as present when the AI supplied it,
    whatever its value. An empty array means the webhook is never used. When the condition isn't met,
    the next webhook is tried.
    """)
  @example(#["order_id", "customer_email"])
  require_args?: string | string[];

  @doc("""
    An object that contains a response and a list of actions to be performed upon completion of the webhook request.
    If the following properties are set (foreach, expressions, output), they will be processed in the following order:
    1. foreach
    2. expressions
    3. output
    """)
  output?: Output;
}

@summary("Webhook with output")
model WebhookWithOutput {
  ...OmitProperties<Webhook, "output">;

  @doc("""
    An object that contains a response and a list of actions to be performed upon completion of the webhook request.
    If the following properties are set (foreach, expressions, output), they will be processed in the following order:
    1. foreach
    2. expressions
    3. output
    """)
  output: Output;
}

@summary("Webhook with expressions")
model WebhookWithExpressions {
  ...OmitProperties<Webhook, "expressions">;

  @doc("""
    A list of expressions to be evaluated upon matching.
    If the following properties are set (foreach, expressions, output), they will be processed in the following order:
    1. foreach
    2. expressions
    3. output
    """)
  expressions: DataMapExpression[];
}

@doc("A `data_map` webhook. It needs `output`, `expressions`, or both.")
union DataMapWebhook {
  WebhookWithOutput,
  WebhookWithExpressions,
}
