---
slug: "/reference/typescript/security-utils/safe-assign"
title: "safeAssign"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "function"
  language: "typescript"
  qualified_name: "SecurityUtils.safeAssign"
  parent: "SecurityUtils"
  module: "SecurityUtils"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/SecurityUtils.ts"
---
# `safeAssign`

Copy properties from `source` to `target`, filtering out prototype-pollution keys.
Drop-in replacement for `Object.assign(target, source)` where `source` is untrusted.

## Signature

```typescript
safeAssign<T>(target: T, source: Record<string, unknown>): T
```

## Type Parameters

| Name | Type                      | Required | Default | Description |
| ---- | ------------------------- | -------- | ------- | ----------- |
| `T`  | `Record<string, unknown>` | yes      | —       | —           |

## Parameters

| Name     | Type                      | Required | Default | Description                         |
| -------- | ------------------------- | -------- | ------- | ----------------------------------- |
| `target` | `T`                       | yes      | —       | The object to assign into.          |
| `source` | `Record<string, unknown>` | yes      | —       | The object to copy properties from. |

## Returns

`T` — The target object.

## Source

[`src/SecurityUtils.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/SecurityUtils.ts)

Line 24.
