---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/rest/rest/crud-resource/update"
title: "Update"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "method"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/rest.CrudResource.Update"
  parent: "github.com/signalwire/signalwire-go/pkg/rest.CrudResource"
  module: "github.com.signalwire.signalwire-go.pkg.rest"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/rest/client.go"
---
# `Update`

Update modifies an existing resource by ID using the configured update method (PATCH or PUT).

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

[`pkg/rest/client.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/rest/client.go)

Line 253.
