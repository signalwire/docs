---
slug: "/reference/typescript/prefabs/receptionist-agent/receptionist-agent/set-language-params"
title: "setLanguageParams"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "prefabs.ReceptionistAgent.ReceptionistAgent.setLanguageParams"
  parent: "prefabs.ReceptionistAgent.ReceptionistAgent"
  module: "prefabs.ReceptionistAgent"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/AgentBase.ts"
---
# `setLanguageParams`

Set (or replace) the per-language `params` dict on an already-added
language. Useful when language entries are built up via [addLanguage](/reference/typescript/prefabs/receptionist-agent/receptionist-agent/add-language)
first and engine-specific tuning is added later (e.g., from a config
loader).

Python parity: `set_language_params(code, params)`. Passing an empty
object removes the `params` key entirely. Unknown codes are a no-op.

## Signature

```typescript
setLanguageParams(code: string, params: Record<string, unknown>): this
```

## Parameters

| Name     | Type                      | Required | Default | Description                                                                                                                                             |
| -------- | ------------------------- | -------- | ------- | ------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `code`   | `string`                  | yes      | —       | Language code as previously passed to [addLanguage](/reference/typescript/prefabs/receptionist-agent/receptionist-agent/add-language) (e.g. `"en-US"`). |
| `params` | `Record<string, unknown>` | yes      | —       | Engine-specific params dict to attach. Empty object removes the key.                                                                                    |

## Returns

`this` — This agent instance for chaining.

## Source

[`src/AgentBase.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/AgentBase.ts)

Line 736.
