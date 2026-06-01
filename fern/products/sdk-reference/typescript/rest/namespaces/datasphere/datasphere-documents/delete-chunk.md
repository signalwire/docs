---
slug: "/reference/typescript/rest/namespaces/datasphere/datasphere-documents/delete-chunk"
title: "deleteChunk"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "rest.namespaces.datasphere.DatasphereDocuments.deleteChunk"
  parent: "rest.namespaces.datasphere.DatasphereDocuments"
  module: "rest.namespaces.datasphere"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/datasphere.ts"
---
# `deleteChunk`

Delete a specific chunk from a document.

## Signature

```typescript
deleteChunk(documentId: string, chunkId: string): Promise<any>
```

## Parameters

| Name         | Type     | Required | Default | Description                        |
| ------------ | -------- | -------- | ------- | ---------------------------------- |
| `documentId` | `string` | yes      | —       | Unique identifier of the document. |
| `chunkId`    | `string` | yes      | —       | Unique identifier of the chunk.    |

## Returns

`Promise<any>` — The platform's delete response.

## Throws

- On any non-2xx HTTP response.

## Source

[`src/rest/namespaces/datasphere.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/datasphere.ts)

Line 61.
