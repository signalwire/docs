---
slug: "/reference/typescript/security-utils/filter-sensitive-headers"
title: "filterSensitiveHeaders"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "function"
  language: "typescript"
  qualified_name: "SecurityUtils.filterSensitiveHeaders"
  parent: "SecurityUtils"
  module: "SecurityUtils"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/SecurityUtils.ts"
---
# `filterSensitiveHeaders`

Return a copy of `headers` with sensitive entries (authorization, cookie, etc.) removed.

## Signature

```typescript
filterSensitiveHeaders(headers: Record<string, string>): Record<string, string>
```

## Parameters

| Name      | Type                     | Required | Default | Description             |
| --------- | ------------------------ | -------- | ------- | ----------------------- |
| `headers` | `Record<string, string>` | yes      | —       | Original header record. |

## Returns

`Record<string, string>` — A new record with sensitive headers removed.

## Source

[`src/SecurityUtils.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/SecurityUtils.ts)

Line 47.
