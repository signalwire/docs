---
slug: "/reference/typescript/rest/namespaces/compat/compat-accounts/create"
title: "create"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "rest.namespaces.compat.CompatAccounts.create"
  parent: "rest.namespaces.compat.CompatAccounts"
  module: "rest.namespaces.compat"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/compat.ts"
---
# `create`

Create a new sub-account under the authenticated parent account.

## Signature

```typescript
create(body: any): Promise<any>
```

## Parameters

| Name   | Type  | Required | Default | Description                                              |
| ------ | ----- | -------- | ------- | -------------------------------------------------------- |
| `body` | `any` | yes      | —       | Account payload (`FriendlyName`, etc.) — LAML form keys. |

## Returns

`Promise<any>` — The newly-created account record.

## Throws

- On any non-2xx HTTP response.

## Source

[`src/rest/namespaces/compat.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/compat.ts)

Line 38.
