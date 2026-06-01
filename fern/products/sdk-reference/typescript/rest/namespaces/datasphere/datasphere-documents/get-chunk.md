---
slug: "/reference/typescript/rest/namespaces/datasphere/datasphere-documents/get-chunk"
title: "getChunk"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "rest.namespaces.datasphere.DatasphereDocuments.getChunk"
  parent: "rest.namespaces.datasphere.DatasphereDocuments"
  module: "rest.namespaces.datasphere"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/datasphere.ts"
---
# `getChunk`

Fetch a specific chunk of a document by ID.

## Signature

```typescript
getChunk(documentId: string, chunkId: string): Promise<any>
```

## Parameters

| Name         | Type     | Required | Default | Description                        |
| ------------ | -------- | -------- | ------- | ---------------------------------- |
| `documentId` | `string` | yes      | —       | Unique identifier of the document. |
| `chunkId`    | `string` | yes      | —       | Unique identifier of the chunk.    |

## Returns

`Promise<any>` — The chunk record with its content.

## Throws

- On any non-2xx HTTP response (including `404`).

## Source

[`src/rest/namespaces/datasphere.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/datasphere.ts)

Line 49.
