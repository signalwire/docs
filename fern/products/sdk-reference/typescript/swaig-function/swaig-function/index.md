---
slug: "/reference/typescript/swaig-function/swaig-function"
title: "SwaigFunction"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "class"
  language: "typescript"
  qualified_name: "SwaigFunction.SwaigFunction"
  parent: "SwaigFunction"
  module: "SwaigFunction"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/SwaigFunction.ts"
---
# `SwaigFunction`

A SWAIG function — exactly the same concept as a "tool" in native
OpenAI / Anthropic tool calling.

Each SwaigFunction is rendered, on every LLM turn, into the OpenAI
tool schema:

```json
{
"type": "function",
"function": {
"name":        "<this.name>",
"description": "<this.description>",
"parameters":  { "type": "object", "properties": { ... } }
}
}
```

The `name`, `description`, and every per-parameter `description` inside
`parameters` are **read by the model** and directly determine whether
the model picks this tool when a matching user request comes in.
They are prompt engineering, not developer comments.

## Signature

```typescript
class SwaigFunction
```

## Properties

| Name             | Type                       | Required | Default | Description                                                                                                                                                                                  |
| ---------------- | -------------------------- | -------- | ------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `description`    | `string`                   | yes      | —       | LLM-facing description. Tells the model WHEN to call this tool. A vague description is the #1 cause of "model has the tool but doesn't call it" failures.                                    |
| `extraFields`    | `Record<string, unknown>`  | yes      | —       | Additional fields included in the SWAIG definition output.                                                                                                                                   |
| `fillers`        | `Record<string, string[]>` | no       | —       | Language-keyed filler phrases spoken while the tool executes.                                                                                                                                |
| `handler`        | `SwaigHandler`             | yes      | —       | The handler function called when the tool is invoked.                                                                                                                                        |
| `isExternal`     | `boolean`                  | yes      | —       | Whether this tool is externally hosted (has a webhookUrl).                                                                                                                                   |
| `isTypedHandler` | `boolean`                  | yes      | —       | Whether this tool uses a typed handler with named parameters.                                                                                                                                |
| `name`           | `string`                   | yes      | —       | Unique name — read by the LLM; use snake\_case verbs.                                                                                                                                        |
| `parameters`     | `Record<string, unknown>`  | yes      | —       | JSON Schema properties describing the tool's parameters. Each property's `description` field is ALSO LLM-facing — it tells the model HOW to extract that argument from the user's utterance. |
| `required`       | `string[]`                 | yes      | —       | List of required parameter names.                                                                                                                                                            |
| `secure`         | `boolean`                  | yes      | —       | Whether this tool requires session token authentication.                                                                                                                                     |
| `waitFile`       | `string`                   | no       | —       | Audio file URL to play while waiting for the tool to complete.                                                                                                                               |
| `waitFileLoops`  | `number`                   | no       | —       | Number of times to loop the wait file.                                                                                                                                                       |
| `webhookUrl`     | `string`                   | no       | —       | External webhook URL; set when the tool is externally hosted.                                                                                                                                |

## Methods

- [`constructor`](/reference/typescript/swaig-function/swaig-function/constructor) — Create a new SwaigFunction.
- [`execute`](/reference/typescript/swaig-function/swaig-function/execute) — Invoke the handler with the given arguments and return a serialized result.
- [`toSwaig`](/reference/typescript/swaig-function/swaig-function/to-swaig) — Serialize this function to the SWAIG wire format for inclusion in SWML.
- [`validateArgs`](/reference/typescript/swaig-function/swaig-function/validate-args) — Validate arguments against the parameter JSON schema using full JSON Schema Draft-7 validation (via ajv).

## Source

[`src/SwaigFunction.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/SwaigFunction.ts)

Line 92.
