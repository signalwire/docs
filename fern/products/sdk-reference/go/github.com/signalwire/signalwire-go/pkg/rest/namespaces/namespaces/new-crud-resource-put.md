---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/new-crud-resource-put"
title: "NewCrudResourcePUT"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "function"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/rest/namespaces.NewCrudResourcePUT"
  parent: "github.com/signalwire/signalwire-go/pkg/rest/namespaces"
  module: "github.com.signalwire.signalwire-go.pkg.rest.namespaces"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/rest/namespaces/common.go"
---
# `NewCrudResourcePUT`

NewCrudResourcePUT creates a CrudResource that uses PUT for updates.

## Signature

```go
func NewCrudResourcePUT(client HTTPClient, path string) *CrudResource
```

## Parameters

| Name     | Type         | Required | Default | Description |
| -------- | ------------ | -------- | ------- | ----------- |
| `client` | `HTTPClient` | yes      | —       | —           |
| `path`   | `string`     | yes      | —       | —           |

## Returns

`*CrudResource`

## Source

[`pkg/rest/namespaces/common.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/rest/namespaces/common.go)

Line 55.
