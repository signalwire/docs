---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/crud-resource/update"
title: "Update"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "method"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/rest/namespaces.CrudResource.Update"
  parent: "github.com/signalwire/signalwire-go/pkg/rest/namespaces.CrudResource"
  module: "github.com.signalwire.signalwire-go.pkg.rest.namespaces"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/rest/namespaces/common.go"
---
# `Update`

Update modifies an existing resource by ID.

## Signature

```go
func (*CrudResource) Update(id string, data map[string]any) (map[string]any, error)
```

## Parameters

| Name   | Type             | Required | Default | Description |
| ------ | ---------------- | -------- | ------- | ----------- |
| `id`   | `string`         | yes      | —       | —           |
| `data` | `map[string]any` | yes      | —       | —           |

## Returns

`(map[string]any, error)`

## Source

[`pkg/rest/namespaces/common.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/rest/namespaces/common.go)

Line 78.
