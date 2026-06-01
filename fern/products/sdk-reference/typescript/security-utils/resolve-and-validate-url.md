---
slug: "/reference/typescript/security-utils/resolve-and-validate-url"
title: "resolveAndValidateUrl"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "function"
  language: "typescript"
  qualified_name: "SecurityUtils.resolveAndValidateUrl"
  parent: "SecurityUtils"
  module: "SecurityUtils"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/SecurityUtils.ts"
---
# `resolveAndValidateUrl`

DNS-resolve a URL's hostname and reject it if it points to a private IP.

## Signature

```typescript
resolveAndValidateUrl(url: string, allowPrivate: boolean = false): Promise<void>
```

## Parameters

| Name           | Type      | Required | Default | Description                                           |
| -------------- | --------- | -------- | ------- | ----------------------------------------------------- |
| `url`          | `string`  | yes      | —       | The full URL to validate.                             |
| `allowPrivate` | `boolean` | yes      | `false` | When true, skip the private-IP check (default false). |

## Returns

`Promise<void>`

## Throws

- If the resolved IP is private and `allowPrivate` is false.

## Source

[`src/SecurityUtils.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/SecurityUtils.ts)

Line 107.
