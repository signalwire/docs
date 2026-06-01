---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/new-crud-with-addresses"
title: "NewCrudWithAddresses"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "function"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/rest/namespaces.NewCrudWithAddresses"
  parent: "github.com/signalwire/signalwire-go/pkg/rest/namespaces"
  module: "github.com.signalwire.signalwire-go.pkg.rest.namespaces"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/rest/namespaces/common.go"
---
# `NewCrudWithAddresses`

NewCrudWithAddresses constructs a CrudWithAddresses backed by a PATCH-default CrudResource. Use NewCrudWithAddressesPUT for resources that update via PUT.

## Signature

```go
func NewCrudWithAddresses(client HTTPClient, path string) *CrudWithAddresses
```

## Parameters

| Name     | Type         | Required | Default | Description |
| -------- | ------------ | -------- | ------- | ----------- |
| `client` | `HTTPClient` | yes      | —       | —           |
| `path`   | `string`     | yes      | —       | —           |

## Returns

`*CrudWithAddresses`

## Source

[`pkg/rest/namespaces/common.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/rest/namespaces/common.go)

Line 102.
