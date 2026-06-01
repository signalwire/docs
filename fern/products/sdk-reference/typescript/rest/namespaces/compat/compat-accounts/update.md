---
slug: "/reference/typescript/rest/namespaces/compat/compat-accounts/update"
title: "update"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "rest.namespaces.compat.CompatAccounts.update"
  parent: "rest.namespaces.compat.CompatAccounts"
  module: "rest.namespaces.compat"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/compat.ts"
---
# `update`

Update an account's attributes. LAML uses `POST` (not PATCH/PUT).

## Signature

```typescript
update(sid: string, body: any = {}): Promise<any>
```

## Parameters

| Name   | Type     | Required | Default | Description                               |
| ------ | -------- | -------- | ------- | ----------------------------------------- |
| `sid`  | `string` | yes      | —       | Account SID.                              |
| `body` | `any`    | yes      | `{}`    | Partial update payload. Defaults to `{}`. |

## Returns

`Promise<any>` — The updated account record.

## Throws

- On any non-2xx HTTP response.

## Source

[`src/rest/namespaces/compat.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/compat.ts)

Line 61.
