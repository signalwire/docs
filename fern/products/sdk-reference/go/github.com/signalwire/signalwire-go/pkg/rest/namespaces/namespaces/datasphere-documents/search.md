---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/datasphere-documents/search"
title: "Search"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "method"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/rest/namespaces.DatasphereDocuments.Search"
  parent: "github.com/signalwire/signalwire-go/pkg/rest/namespaces.DatasphereDocuments"
  module: "github.com.signalwire.signalwire-go.pkg.rest.namespaces"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/rest/namespaces/datasphere.go"
---
# `Search`

Search performs a semantic search across documents.

## Signature

```go
func (*DatasphereDocuments) Search(data map[string]any) (map[string]any, error)
```

## Parameters

| Name   | Type             | Required | Default | Description |
| ------ | ---------------- | -------- | ------- | ----------- |
| `data` | `map[string]any` | yes      | —       | —           |

## Returns

`(map[string]any, error)`

## Source

[`pkg/rest/namespaces/datasphere.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/rest/namespaces/datasphere.go)

Line 17.
