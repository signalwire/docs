---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/datasphere-documents"
title: "DatasphereDocuments"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "class"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/rest/namespaces.DatasphereDocuments"
  parent: "github.com/signalwire/signalwire-go/pkg/rest/namespaces"
  module: "github.com.signalwire.signalwire-go.pkg.rest.namespaces"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/rest/namespaces/datasphere.go"
---
# `DatasphereDocuments`

DatasphereDocuments provides document management with search and chunk operations for the Datasphere API.

## Signature

```go
type DatasphereDocuments struct
```

## Properties

| Name           | Type            | Required | Default | Description |
| -------------- | --------------- | -------- | ------- | ----------- |
| `CrudResource` | `*CrudResource` | yes      | —       | —           |

## Methods

- [`DeleteChunk`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/datasphere-documents/delete-chunk) — DeleteChunk deletes a specific chunk from a document.
- [`GetChunk`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/datasphere-documents/get-chunk) — GetChunk retrieves a specific chunk from a document.
- [`ListChunks`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/datasphere-documents/list-chunks) — ListChunks lists chunks for a specific document.
- [`Search`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/datasphere-documents/search) — Search performs a semantic search across documents.

## Source

[`pkg/rest/namespaces/datasphere.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/rest/namespaces/datasphere.go)

Line 12.
