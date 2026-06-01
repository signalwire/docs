---
slug: "/reference/typescript/rest/namespaces/compat/compat-phone-numbers/update"
title: "update"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "rest.namespaces.compat.CompatPhoneNumbers.update"
  parent: "rest.namespaces.compat.CompatPhoneNumbers"
  module: "rest.namespaces.compat"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/compat.ts"
---
# `update`

Update an owned phone number (webhook URLs, friendly name, etc.).
LAML uses `POST`.

## Signature

```typescript
update(sid: string, body: any = {}): Promise<any>
```

## Parameters

| Name   | Type     | Required | Default | Description                                 |
| ------ | -------- | -------- | ------- | ------------------------------------------- |
| `sid`  | `string` | yes      | —       | Phone number SID.                           |
| `body` | `any`    | yes      | `{}`    | LAML-form update payload. Defaults to `{}`. |

## Returns

`Promise<any>` — The updated phone-number record.

## Throws

- On any non-2xx HTTP response.

## Source

[`src/rest/namespaces/compat.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/compat.ts)

Line 470.
