---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/crud-with-addresses"
title: "CrudWithAddresses"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "class"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/rest/namespaces.CrudWithAddresses"
  parent: "github.com/signalwire/signalwire-go/pkg/rest/namespaces"
  module: "github.com.signalwire.signalwire-go.pkg.rest.namespaces"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/rest/namespaces/common.go"
---
# `CrudWithAddresses`

CrudWithAddresses extends CrudResource with the nested addresses endpoint. Matches Python's CrudWithAddresses at \_base.py:109-113. Only resources that explicitly support the addresses sub-resource should embed this type; plain CrudResource does not expose ListAddresses.

## Signature

```go
type CrudWithAddresses struct
```

## Properties

| Name           | Type            | Required | Default | Description |
| -------------- | --------------- | -------- | ------- | ----------- |
| `CrudResource` | `*CrudResource` | yes      | —       | —           |

## Methods

- [`ListAddresses`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/crud-with-addresses/list-addresses) — ListAddresses lists addresses associated with the resource identified by id.

## Source

[`pkg/rest/namespaces/common.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/rest/namespaces/common.go)

Line 96.
