---
slug: "/reference/typescript/rest/namespaces/datasphere/datasphere-documents/list-chunks"
title: "listChunks"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "rest.namespaces.datasphere.DatasphereDocuments.listChunks"
  parent: "rest.namespaces.datasphere.DatasphereDocuments"
  module: "rest.namespaces.datasphere"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/datasphere.ts"
---
# `listChunks`

List content chunks for a document.

## Signature

```typescript
listChunks(documentId: string, params?: QueryParams): Promise<any>
```

## Parameters

| Name         | Type          | Required | Default | Description                                    |
| ------------ | ------------- | -------- | ------- | ---------------------------------------------- |
| `documentId` | `string`      | yes      | —       | Unique identifier of the document.             |
| `params`     | `QueryParams` | no       | —       | Optional filter / pagination query parameters. |

## Returns

`Promise<any>` — A paginated list of chunks.

## Throws

- On any non-2xx HTTP response.

## Source

[`src/rest/namespaces/datasphere.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/datasphere.ts)

Line 37.
