---
slug: "/reference/dotnet/signal-wire.data-map/data-map"
title: "DataMap"
sdk_label: ".NET SDK"
icon: "dotnet"
lustri:
  auto_generated: true
  kind: "class"
  language: "dotnet"
  qualified_name: "SignalWire.DataMap.DataMap"
  parent: "SignalWire.DataMap"
  module: "SignalWire.DataMap"
  visibility: "public"
---
# `DataMap`

Builds a SWAIG data-map function definition with parameters, expressions, webhooks,
and output configuration. All builder methods return <code>this</code> for fluent chaining.

## Signature

```dotnet
public class DataMap
```

## Methods

- [`Body(Dictionary<string, object>)`](/reference/dotnet/signal-wire.data-map/data-map/body-dictionary-string-object)
- [`CreateExpressionTool(string, string, List<Dictionary<string, object>>, List<Dictionary<string, object>>)`](/reference/dotnet/signal-wire.data-map/data-map/create-expression-tool-string-string-list-dictionary-string-object-list-dictionary-string-object)
- [`CreateSimpleApiTool(string, string, List<Dictionary<string, object>>, string, string, object, Dictionary<string, string>?)`](/reference/dotnet/signal-wire.data-map/data-map/create-simple-api-tool-string-string-list-dictionary-string-object-string-string-object-dictionary-string-string)
- [`DataMap(string)`](/reference/dotnet/signal-wire.data-map/data-map/data-map-string)
- [`Description(string)`](/reference/dotnet/signal-wire.data-map/data-map/description-string) — Alias for <xref href="SignalWire.DataMap.DataMap.Purpose(System.String)" data-throw-if-not-resolved="false"></xref>. Sets the LLM-facing tool description. This string is read by the model to decide WHEN to call this tool. See <xref href="SignalWire.DataMap.DataMap.Purpose(System.String)" data-throw-if-not-resolved="false"></xref> for bad-vs-good examples.
- [`ErrorKeys(List<string>)`](/reference/dotnet/signal-wire.data-map/data-map/error-keys-list-string)
- [`Expression(string, string, object, object?)`](/reference/dotnet/signal-wire.data-map/data-map/expression-string-string-object-object)
- [`FallbackOutput(object)`](/reference/dotnet/signal-wire.data-map/data-map/fallback-output-object)
- [`ForEach(Dictionary<string, object>)`](/reference/dotnet/signal-wire.data-map/data-map/for-each-dictionary-string-object)
- [`GlobalErrorKeys(List<string>)`](/reference/dotnet/signal-wire.data-map/data-map/global-error-keys-list-string)
- [`Output(object)`](/reference/dotnet/signal-wire.data-map/data-map/output-object)
- [`Parameter(string, string, string, bool, List<string>?)`](/reference/dotnet/signal-wire.data-map/data-map/parameter-string-string-string-bool-list-string) — Add a parameter to this data-map tool — the <code class="paramref">description</code> is LLM-FACING. <p>Each parameter description is rendered into the OpenAI tool schema under <code>parameters.properties.\<name>.description</code> and sent to the model. The model uses it to decide HOW to fill in the argument from user speech. It is prompt engineering, not developer FYI.</p> <p><b>Bad vs good:</b></p> <pre><code class="lang-csharp">BAD : .Parameter("city", "string", "the city") GOOD: .Parameter("city", "string", "The name of the city to get weather for, e.g. " + "'San Francisco'. Ask the user if they did not " + "provide one. Include the state or country if the " + "city name is ambiguous.")</code></pre>
- [`Params(Dictionary<string, object>)`](/reference/dotnet/signal-wire.data-map/data-map/params-dictionary-string-object)
- [`Purpose(string)`](/reference/dotnet/signal-wire.data-map/data-map/purpose-string) — Set the LLM-facing tool description (the "purpose"). PROMPT ENGINEERING, not developer documentation. <p>The description string is rendered into the OpenAI tool schema <code>description</code> field on every LLM turn. The model reads it to decide WHEN to call this tool. A vague <xref href="SignalWire.DataMap.DataMap.Purpose(System.String)" data-throw-if-not-resolved="false"></xref> is the #1 cause of "the model has the right tool but doesn't call it" failures with data-map tools.</p> <p><b>Bad vs good:</b></p> <pre><code class="lang-csharp">BAD : .Purpose("weather api") GOOD: .Purpose("Get the current weather conditions and " + "forecast for a specific city. Use this " + "whenever the user asks about weather, " + "temperature, rain, or similar conditions in a " + "named location.")</code></pre>
- [`ToSwaigFunction()`](/reference/dotnet/signal-wire.data-map/data-map/to-swaig-function)
- [`Webhook(string, string, Dictionary<string, string>?, string, bool, List<string>?)`](/reference/dotnet/signal-wire.data-map/data-map/webhook-string-string-dictionary-string-string-string-bool-list-string)
- [`WebhookExpressions(List<Dictionary<string, object>>)`](/reference/dotnet/signal-wire.data-map/data-map/webhook-expressions-list-dictionary-string-object)
