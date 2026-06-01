---
slug: "/reference/typescript/security-utils/is-private-ip"
title: "isPrivateIp"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "function"
  language: "typescript"
  qualified_name: "SecurityUtils.isPrivateIp"
  parent: "SecurityUtils"
  module: "SecurityUtils"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/SecurityUtils.ts"
---
# `isPrivateIp`

Check whether an IP address belongs to a private/reserved range.
Covers RFC1918, loopback, link-local, IPv6 private (fc/fd, ::1, fe80).

## Signature

```typescript
isPrivateIp(ip: string): boolean
```

## Parameters

| Name | Type     | Required | Default | Description                     |
| ---- | -------- | -------- | ------- | ------------------------------- |
| `ip` | `string` | yes      | —       | The IP address string to check. |

## Returns

`boolean` — True if the IP is private/reserved.

## Source

[`src/SecurityUtils.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/SecurityUtils.ts)

Line 84.
