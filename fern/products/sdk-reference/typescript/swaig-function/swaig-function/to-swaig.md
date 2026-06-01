---
slug: "/reference/typescript/swaig-function/swaig-function/to-swaig"
title: "toSwaig"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "SwaigFunction.SwaigFunction.toSwaig"
  parent: "SwaigFunction.SwaigFunction"
  module: "SwaigFunction"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/SwaigFunction.ts"
---
# `toSwaig`

Serialize this function to the SWAIG wire format for inclusion in SWML.

## Signature

```typescript
toSwaig(
  baseUrl: string,
  token?: string,
  callId?: string
): Record<string, unknown>
```

## Parameters

| Name      | Type     | Required | Default | Description                                  |
| --------- | -------- | -------- | ------- | -------------------------------------------- |
| `baseUrl` | `string` | yes      | —       | The base URL of the agent server.            |
| `token`   | `string` | no       | —       | Optional session token for secure functions. |
| `callId`  | `string` | no       | —       | Optional call ID for secure function URLs.   |

## Returns

`Record<string, unknown>` — A SWAIG function definition object.

## Source

[`src/SwaigFunction.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/SwaigFunction.ts)

Line 257.
