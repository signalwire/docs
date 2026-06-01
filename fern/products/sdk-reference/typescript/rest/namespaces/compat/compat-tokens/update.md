---
slug: "/reference/typescript/rest/namespaces/compat/compat-tokens/update"
title: "update"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "rest.namespaces.compat.CompatTokens.update"
  parent: "rest.namespaces.compat.CompatTokens"
  module: "rest.namespaces.compat"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/compat.ts"
---
# `update`

Update a Compat API token.

## Signature

```typescript
update(tokenId: string, body: any = {}): Promise<any>
```

## Parameters

| Name      | Type     | Required | Default | Description                               |
| --------- | -------- | -------- | ------- | ----------------------------------------- |
| `tokenId` | `string` | yes      | —       | Unique identifier of the token.           |
| `body`    | `any`    | yes      | `{}`    | Partial update payload. Defaults to `{}`. |

## Returns

`Promise<any>` — The updated token record.

## Throws

- On any non-2xx HTTP response.

## Source

[`src/rest/namespaces/compat.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/compat.ts)

Line 737.
