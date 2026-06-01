---
slug: "/reference/typescript/rest/namespaces/datasphere/datasphere-namespace"
title: "DatasphereNamespace"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "class"
  language: "typescript"
  qualified_name: "rest.namespaces.datasphere.DatasphereNamespace"
  parent: "rest.namespaces.datasphere"
  module: "rest.namespaces.datasphere"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/datasphere.ts"
---
# `DatasphereNamespace`

Datasphere API namespace.

Access via `client.datasphere.*`. Datasphere is SignalWire's RAG service —
index documents and run semantic search from within agent tools.

## Signature

```typescript
class DatasphereNamespace
```

## Examples

```typescript
const hits = await client.datasphere.documents.search({
  query: 'refund policy',
  document_id: 'doc_abc',
  limit: 5,
});
```

## Properties

| Name        | Type                  | Required | Default | Description                                              |
| ----------- | --------------------- | -------- | ------- | -------------------------------------------------------- |
| `documents` | `DatasphereDocuments` | yes      | —       | Document CRUD plus semantic search and chunk management. |

## Methods

- [`constructor`](/reference/typescript/rest/namespaces/datasphere/datasphere-namespace/constructor)

## Source

[`src/rest/namespaces/datasphere.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/rest/namespaces/datasphere.ts)

Line 81.
