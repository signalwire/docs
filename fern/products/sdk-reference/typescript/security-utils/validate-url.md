---
slug: "/reference/typescript/security-utils/validate-url"
title: "validateUrl"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "function"
  language: "typescript"
  qualified_name: "SecurityUtils.validateUrl"
  parent: "SecurityUtils"
  module: "SecurityUtils"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/SecurityUtils.ts"
---
# `validateUrl`

Validate that a URL is safe to fetch (not pointing to private/internal resources).

Matches Python's `validate_url(url, allow_private=False) -> bool` — returns `true`
if the URL is safe, `false` otherwise (never throws).

## Signature

```typescript
validateUrl(url: string, allowPrivate: boolean = false): Promise<boolean>
```

## Parameters

| Name           | Type      | Required | Default | Description                                         |
| -------------- | --------- | -------- | ------- | --------------------------------------------------- |
| `url`          | `string`  | yes      | —       | The URL to validate.                                |
| `allowPrivate` | `boolean` | yes      | `false` | When true, allow private IP ranges (default false). |

## Returns

`Promise<boolean>` — `true` if the URL is safe to fetch, `false` otherwise.

## Source

[`src/SecurityUtils.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/SecurityUtils.ts)

Line 147.
