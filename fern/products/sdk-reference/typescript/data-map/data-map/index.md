---
slug: "/reference/typescript/data-map/data-map"
title: "DataMap"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "class"
  language: "typescript"
  qualified_name: "DataMap.DataMap"
  parent: "DataMap"
  module: "DataMap"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/DataMap.ts"
---
# `DataMap`

Fluent builder for SWAIG data\_map configurations.

Creates server-side tool definitions that execute on SignalWire's infrastructure
**without** requiring a webhook endpoint in your application. Ideal for simple
third-party API integrations (REST calls + pattern-matched response shaping).

## Signature

```typescript
class DataMap
```

## Examples

**Example 1**

```typescript
import { DataMap, FunctionResult } from '@signalwire/sdk';

const weather = new DataMap('get_weather')
  .purpose('Look up the current weather for a city')
  .parameter('city', 'string', 'The city name', true)
  .webhook('GET', 'https://api.example.com/weather?city=${args.city}')
  .output(new FunctionResult('In ${city} it is ${response.temp}°F and ${response.condition}.'));

// Register onto an agent:
agent.registerSwaigFunction(weather.toSwaigFunction());
```

**Example 2**

```typescript
new DataMap('classify_intent')
  .purpose('Route callers to the right department.')
  .parameter('utterance', 'string', 'What the caller said', true)
  .expression('${args.utterance}', /billing|invoice|charge/i, new FunctionResult('billing'))
  .expression('${args.utterance}', /tech|broken|error/i, new FunctionResult('support'));
```

## See Also

- \- \[FunctionResult]\(/reference/typescript/function-result) — response shape used in \`.output()\` / \`.expression()\`
  \- \[createSimpleApiTool]\(/reference/typescript/data-map/create-simple-api-tool) — one-liner helper for REST API tools
  \- \[AgentBase.defineTool]\(/reference/typescript/agent-base/agent-base/define-tool) — alternative for tools that run in your process

## Properties

| Name           | Type     | Required | Default | Description                                           |
| -------------- | -------- | -------- | ------- | ----------------------------------------------------- |
| `functionName` | `string` | yes      | —       | The name of the SWAIG function this data map defines. |

## Methods

- [`body`](/reference/typescript/data-map/data-map/body) — Set the JSON body for the most recently added webhook.
- [`constructor`](/reference/typescript/data-map/data-map/constructor)
- [`description`](/reference/typescript/data-map/data-map/description) — Alias for [purpose](/reference/typescript/data-map/data-map/purpose); sets the LLM-facing tool description.
- [`enableEnvExpansion`](/reference/typescript/data-map/data-map/enable-env-expansion) — Enable `${ENV.*}` variable expansion in URLs, bodies, and outputs.
- [`errorKeys`](/reference/typescript/data-map/data-map/error-keys) — Set error keys on the most recently added webhook, or globally if no webhook exists.
- [`expression`](/reference/typescript/data-map/data-map/expression) — Add a pattern-matching expression that evaluates a test value against a regex.
- [`fallbackOutput`](/reference/typescript/data-map/data-map/fallback-output) — Set a fallback output used when no webhook or expression matches.
- [`foreach`](/reference/typescript/data-map/data-map/foreach) — Configure iteration over an array in the webhook response.
- [`globalErrorKeys`](/reference/typescript/data-map/data-map/global-error-keys) — Set error keys at the top-level data map scope, regardless of webhook context.
- [`output`](/reference/typescript/data-map/data-map/output) — Set the output template for the most recently added webhook.
- [`parameter`](/reference/typescript/data-map/data-map/parameter) — Define a parameter for this data-map tool — `description` is READ BY THE LLM.
- [`params`](/reference/typescript/data-map/data-map/params) — Set query or form parameters for the most recently added webhook.
- [`purpose`](/reference/typescript/data-map/data-map/purpose) — Set the purpose (description) for this data-map tool — READ BY THE LLM.
- [`registerWithAgent`](/reference/typescript/data-map/data-map/register-with-agent) — Register this DataMap tool with an AgentBase instance.
- [`setAllowedEnvPrefixes`](/reference/typescript/data-map/data-map/set-allowed-env-prefixes) — Set the allowed env var prefixes for this DataMap instance.
- [`toSwaigFunction`](/reference/typescript/data-map/data-map/to-swaig-function) — Serialize this data map to a SWAIG function definition object.
- [`webhook`](/reference/typescript/data-map/data-map/webhook) — Add a webhook that is called when this data map tool is invoked.
- [`webhookExpressions`](/reference/typescript/data-map/data-map/webhook-expressions) — Set pattern-matching expressions on the most recently added webhook.

## Source

[`src/DataMap.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/DataMap.ts)

Line 94.
