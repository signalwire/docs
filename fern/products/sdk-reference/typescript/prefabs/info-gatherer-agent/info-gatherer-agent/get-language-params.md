---
slug: "/reference/typescript/prefabs/info-gatherer-agent/info-gatherer-agent/get-language-params"
title: "getLanguageParams"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "prefabs.InfoGathererAgent.InfoGathererAgent.getLanguageParams"
  parent: "prefabs.InfoGathererAgent.InfoGathererAgent"
  module: "prefabs.InfoGathererAgent"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/AgentBase.ts"
---
# `getLanguageParams`

Read the per-language `params` dict for a previously-added language.

Python parity: `get_language_params(code)`. Returns `undefined` if the
code is unknown or the language has no params set — no exception path.

## Signature

```typescript
getLanguageParams(code: string): Record<string, unknown> | undefined
```

## Parameters

| Name   | Type     | Required | Default | Description                                                                                                                              |
| ------ | -------- | -------- | ------- | ---------------------------------------------------------------------------------------------------------------------------------------- |
| `code` | `string` | yes      | —       | Language code as previously passed to [addLanguage](/reference/typescript/prefabs/info-gatherer-agent/info-gatherer-agent/add-language). |

## Returns

`Record<string, unknown> | undefined` — The params dict if set, `undefined` otherwise (including when the code is unknown).

## Source

[`src/AgentBase.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/AgentBase.ts)

Line 759.
