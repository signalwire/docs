---
slug: "/reference/typescript/rest/namespaces/compat/compat-phone-numbers/get"
title: "get"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "rest.namespaces.compat.CompatPhoneNumbers.get"
  parent: "rest.namespaces.compat.CompatPhoneNumbers"
  module: "rest.namespaces.compat"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/compat.ts"
---
# `get`

Fetch an owned phone number by SID.

## Signature

```typescript
get(sid: string): Promise<any>
```

## Parameters

| Name  | Type     | Required | Default | Description                        |
| ----- | -------- | -------- | ------- | ---------------------------------- |
| `sid` | `string` | yes      | —       | Phone number SID (e.g. `"PN..."`). |

## Returns

`Promise<any>` — The phone-number record.

## Throws

- On any non-2xx HTTP response (including `404`).

## Source

[`src/rest/namespaces/compat.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/compat.ts)

Line 457.
