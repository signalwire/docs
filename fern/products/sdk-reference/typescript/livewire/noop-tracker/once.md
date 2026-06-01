---
slug: "/reference/typescript/livewire/noop-tracker/once"
title: "once"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "livewire.NoopTracker.once"
  parent: "livewire.NoopTracker"
  module: "livewire"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/livewire/index.ts"
---
# `once`

Log the given message the first time this key is seen.

## Signature

```typescript
once(key: string, message: string): void
```

## Parameters

| Name      | Type     | Required | Default | Description                                               |
| --------- | -------- | -------- | ------- | --------------------------------------------------------- |
| `key`     | `string` | yes      | —       | Dedup key. Subsequent calls with the same key are silent. |
| `message` | `string` | yes      | —       | Message to write to stderr on first occurrence.           |

## Returns

`void`

## Source

[`src/livewire/index.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/livewire/index.ts)

Line 81.
