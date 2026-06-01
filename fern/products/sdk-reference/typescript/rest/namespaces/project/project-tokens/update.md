---
slug: "/reference/typescript/rest/namespaces/project/project-tokens/update"
title: "update"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "rest.namespaces.project.ProjectTokens.update"
  parent: "rest.namespaces.project.ProjectTokens"
  module: "rest.namespaces.project"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/project.ts"
---
# `update`

Update a project API token's attributes (e.g. friendly name).

## Signature

```typescript
update(tokenId: string, body: any): Promise<any>
```

## Parameters

| Name      | Type     | Required | Default | Description                     |
| --------- | -------- | -------- | ------- | ------------------------------- |
| `tokenId` | `string` | yes      | —       | Unique identifier of the token. |
| `body`    | `any`    | yes      | —       | Partial update payload.         |

## Returns

`Promise<any>` — The updated token record.

## Throws

- On any non-2xx HTTP response.

## Source

[`src/rest/namespaces/project.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/project.ts)

Line 36.
