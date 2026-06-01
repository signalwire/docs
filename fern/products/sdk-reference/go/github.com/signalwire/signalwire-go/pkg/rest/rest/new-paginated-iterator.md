---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/rest/rest/new-paginated-iterator"
title: "NewPaginatedIterator"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "function"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/rest.NewPaginatedIterator"
  parent: "github.com/signalwire/signalwire-go/pkg/rest"
  module: "github.com.signalwire.signalwire-go.pkg.rest"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/rest/client.go"
---
# `NewPaginatedIterator`

NewPaginatedIterator creates a new iterator for the given endpoint. dataKey is the JSON key that holds the array of items (typically "data").

## Signature

```go
func NewPaginatedIterator(
	client *HttpClient,
	path string,
	params map[string]string,
	dataKey string
) *PaginatedIterator
```

## Parameters

| Name      | Type                | Required | Default | Description |
| --------- | ------------------- | -------- | ------- | ----------- |
| `client`  | `*HttpClient`       | yes      | —       | —           |
| `path`    | `string`            | yes      | —       | —           |
| `params`  | `map[string]string` | yes      | —       | —           |
| `dataKey` | `string`            | yes      | —       | —           |

## Returns

`*PaginatedIterator`

## Source

[`pkg/rest/client.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/rest/client.go)

Line 282.
