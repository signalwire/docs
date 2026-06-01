---
slug: "/reference/typescript/swml-builder/swml-builder/enter-queue"
title: "enter_queue"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "SwmlBuilder.SwmlBuilder.enter_queue"
  parent: "SwmlBuilder.SwmlBuilder"
  module: "SwmlBuilder"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/SwmlVerbMethods.generated.ts"
---
# `enter_queue`

Place the current call in a named queue where it will wait to be connected to an available agent or resource. While waiting, callers will hear music or custom audio. When an agent connects to the queue (using the connect method), the caller and agent are bridged together. After the bridge completes, execution continues with the SWML script specified in transfer\_after\_bridge.

## Signature

```typescript
enter_queue(config?: unknown): this
```

## Parameters

| Name     | Type      | Required | Default | Description |
| -------- | --------- | -------- | ------- | ----------- |
| `config` | `unknown` | no       | —       | —           |

## Returns

`this`

## Source

[`src/SwmlVerbMethods.generated.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/SwmlVerbMethods.generated.ts)

Line 60.
