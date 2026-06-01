---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/datasphere-documents/delete-chunk"
title: "DeleteChunk"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "method"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/rest/namespaces.DatasphereDocuments.DeleteChunk"
  parent: "github.com/signalwire/signalwire-go/pkg/rest/namespaces.DatasphereDocuments"
  module: "github.com.signalwire.signalwire-go.pkg.rest.namespaces"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/rest/namespaces/datasphere.go"
---
# `DeleteChunk`

DeleteChunk deletes a specific chunk from a document.

## Signature

```go
func (*DatasphereDocuments) DeleteChunk(documentID string, chunkID string) (map[string]any, error)
```

## Parameters

| Name         | Type     | Required | Default | Description |
| ------------ | -------- | -------- | ------- | ----------- |
| `documentID` | `string` | yes      | —       | —           |
| `chunkID`    | `string` | yes      | —       | —           |

## Returns

`(map[string]any, error)`

## Source

[`pkg/rest/namespaces/datasphere.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/rest/namespaces/datasphere.go)

Line 32.
