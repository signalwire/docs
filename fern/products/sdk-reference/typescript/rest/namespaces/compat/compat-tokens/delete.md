---
slug: "/reference/typescript/rest/namespaces/compat/compat-tokens/delete"
title: "delete"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "rest.namespaces.compat.CompatTokens.delete"
  parent: "rest.namespaces.compat.CompatTokens"
  module: "rest.namespaces.compat"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/compat.ts"
---
# `delete`

Revoke and delete a Compat API token.

## Signature

```typescript
delete(tokenId: string): Promise<any>
```

## Parameters

| Name      | Type     | Required | Default | Description                     |
| --------- | -------- | -------- | ------- | ------------------------------- |
| `tokenId` | `string` | yes      | —       | Unique identifier of the token. |

## Returns

`Promise<any>` — The platform's delete response.

## Throws

- On any non-2xx HTTP response.

## Source

[`src/rest/namespaces/compat.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/compat.ts)

Line 748.
