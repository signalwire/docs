---
slug: "/reference/typescript/rest/namespaces/datasphere/datasphere-documents/search"
title: "search"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "rest.namespaces.datasphere.DatasphereDocuments.search"
  parent: "rest.namespaces.datasphere.DatasphereDocuments"
  module: "rest.namespaces.datasphere"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/datasphere.ts"
---
# `search`

Run a semantic search across indexed documents.

## Signature

```typescript
search(body: any): Promise<any>
```

## Parameters

| Name   | Type  | Required | Default | Description                                                                                  |
| ------ | ----- | -------- | ------- | -------------------------------------------------------------------------------------------- |
| `body` | `any` | yes      | —       | Search payload (typically `{ query: "...", document_id?: "...",
limit?: 5, tags?: [...] }`). |

## Returns

`Promise<any>` — The ranked search hits.

## Throws

- On any non-2xx HTTP response.

## Source

[`src/rest/namespaces/datasphere.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/datasphere.ts)

Line 25.
