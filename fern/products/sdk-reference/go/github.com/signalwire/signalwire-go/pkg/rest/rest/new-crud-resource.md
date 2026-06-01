---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/rest/rest/new-crud-resource"
title: "NewCrudResource"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "function"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/rest.NewCrudResource"
  parent: "github.com/signalwire/signalwire-go/pkg/rest"
  module: "github.com.signalwire.signalwire-go.pkg.rest"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/rest/client.go"
---
# `NewCrudResource`

NewCrudResource creates a CrudResource for the given path. The default update method is PATCH.

## Signature

```go
func NewCrudResource(client *HttpClient, path string) *CrudResource
```

## Parameters

| Name     | Type          | Required | Default | Description |
| -------- | ------------- | -------- | ------- | ----------- |
| `client` | `*HttpClient` | yes      | —       | —           |
| `path`   | `string`      | yes      | —       | —           |

## Returns

`*CrudResource`

## Source

[`pkg/rest/client.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/rest/client.go)

Line 213.
