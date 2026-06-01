---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/short-codes-namespace/update"
title: "Update"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "method"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/rest/namespaces.ShortCodesNamespace.Update"
  parent: "github.com/signalwire/signalwire-go/pkg/rest/namespaces.ShortCodesNamespace"
  module: "github.com.signalwire.signalwire-go.pkg.rest.namespaces"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/rest/namespaces/short_codes.go"
---
# `Update`

Update modifies a short code by ID.

## Signature

```go
func (*ShortCodesNamespace) Update(id string, data map[string]any) (map[string]any, error)
```

## Parameters

| Name   | Type             | Required | Default | Description |
| ------ | ---------------- | -------- | ------- | ----------- |
| `id`   | `string`         | yes      | —       | —           |
| `data` | `map[string]any` | yes      | —       | —           |

## Returns

`(map[string]any, error)`

## Source

[`pkg/rest/namespaces/short_codes.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/rest/namespaces/short_codes.go)

Line 39.
