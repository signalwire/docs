---
slug: "/reference/typescript/prefabs/info-gatherer-agent/info-gatherer-agent/add-internal-filler"
title: "addInternalFiller"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "prefabs.InfoGathererAgent.InfoGathererAgent.addInternalFiller"
  parent: "prefabs.InfoGathererAgent.InfoGathererAgent"
  module: "prefabs.InfoGathererAgent"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/AgentBase.ts"
---
# `addInternalFiller`

Add internal filler phrases for a single internal function and language.

See [setInternalFillers](/reference/typescript/prefabs/info-gatherer-agent/info-gatherer-agent/set-internal-fillers) for the complete list of supported
functionName values and an explanation of what fillers do.

## Signature

```typescript
addInternalFiller(
  functionName: string,
  languageCode: string,
  fillers: string[]
): this
```

## Parameters

| Name           | Type       | Required | Default | Description                                                                                                                                                          |
| -------------- | ---------- | -------- | ------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `functionName` | `string`   | yes      | —       | One of the supported internal function names (see SUPPORTED\_INTERNAL\_FILLER\_NAMES). Names outside the supported set log a warning and are ignored by the runtime. |
| `languageCode` | `string`   | yes      | —       | BCP-47 language code for the fillers (e.g. 'en-US').                                                                                                                 |
| `fillers`      | `string[]` | yes      | —       | Array of filler phrases.                                                                                                                                             |

## Returns

`this` — This agent instance for chaining.

## Source

[`src/AgentBase.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/AgentBase.ts)

Line 942.
