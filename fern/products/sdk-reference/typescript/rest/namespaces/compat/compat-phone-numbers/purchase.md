---
slug: "/reference/typescript/rest/namespaces/compat/compat-phone-numbers/purchase"
title: "purchase"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "rest.namespaces.compat.CompatPhoneNumbers.purchase"
  parent: "rest.namespaces.compat.CompatPhoneNumbers"
  module: "rest.namespaces.compat"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/compat.ts"
---
# `purchase`

Purchase a phone number (LAML `POST /IncomingPhoneNumbers`).

## Signature

```typescript
purchase(body: any): Promise<any>
```

## Parameters

| Name   | Type  | Required | Default | Description                                                                          |
| ------ | ----- | -------- | ------- | ------------------------------------------------------------------------------------ |
| `body` | `any` | yes      | —       | Purchase payload, typically including `PhoneNumber` or `AreaCode` plus webhook URLs. |

## Returns

`Promise<any>` — The newly-purchased phone-number record.

## Throws

- On any non-2xx HTTP response.

## Source

[`src/rest/namespaces/compat.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/compat.ts)

Line 446.
