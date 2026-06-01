---
slug: "/reference/typescript/swml-builder/swml-builder/join-room"
title: "join_room"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "SwmlBuilder.SwmlBuilder.join_room"
  parent: "SwmlBuilder.SwmlBuilder"
  module: "SwmlBuilder"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/SwmlVerbMethods.generated.ts"
---
# `join_room`

Join a RELAY room. If the room doesn't exist, it creates a new room.

## Signature

```typescript
join_room(config: { ...1 fields }): this
```

## Parameters

| Name          | Type               | Required | Default | Description |
| ------------- | ------------------ | -------- | ------- | ----------- |
| `config`      | `{ name: string }` | yes      | —       | —           |
| `config.name` | `string`           | yes      | —       | —           |

## Returns

`this`

## Source

[`src/SwmlVerbMethods.generated.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/SwmlVerbMethods.generated.ts)

Line 85.
