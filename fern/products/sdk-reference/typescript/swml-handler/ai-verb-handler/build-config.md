---
slug: "/reference/typescript/swml-handler/ai-verb-handler/build-config"
title: "buildConfig"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "SWMLHandler.AIVerbHandler.buildConfig"
  parent: "SWMLHandler.AIVerbHandler"
  module: "SWMLHandler"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/SWMLHandler.ts"
---
# `buildConfig`

Build a configuration for the AI verb.

Requires exactly one of `promptText` or `promptPom` (mutually exclusive).
Throws an `Error` if both or neither are provided.

Extra keys in `opts` are routed as follows:

- `languages`, `hints`, `pronounce`, `globalData` / `global_data` are placed at the top level of the config.
- All other extra keys are placed into `config.params`.

## Signature

```typescript
buildConfig(opts: AIVerbBuildOptions = {}): Record<string, unknown>
```

## Parameters

| Name   | Type                 | Required | Default | Description                                  |
| ------ | -------------------- | -------- | ------- | -------------------------------------------- |
| `opts` | `AIVerbBuildOptions` | yes      | `{}`    | Build options for the AI verb configuration. |

## Returns

`Record<string, unknown>` — AI verb configuration dictionary.

## Source

[`src/SWMLHandler.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/SWMLHandler.ts)

Line 167.
