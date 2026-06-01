---
slug: "/reference/typescript/relay/types/dial-options"
title: "DialOptions"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "interface"
  language: "typescript"
  qualified_name: "relay.types.DialOptions"
  parent: "relay.types"
  module: "relay.types"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/relay/types.ts"
---
# `DialOptions`

Options for the dial() method.

## Signature

```typescript
interface DialOptions
```

## Properties

| Name          | Type     | Required | Default | Description                       |
| ------------- | -------- | -------- | ------- | --------------------------------- |
| `from`        | `string` | no       | —       | Caller ID / from number.          |
| `maxDuration` | `number` | no       | —       | Maximum call duration in seconds. |
| `timeout`     | `number` | no       | —       | Timeout in seconds for the dial.  |

## Source

[`src/relay/types.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/relay/types.ts)

Line 97.
