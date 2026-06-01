---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/cxml-applications-resource"
title: "CxmlApplicationsResource"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "class"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/rest/namespaces.CxmlApplicationsResource"
  parent: "github.com/signalwire/signalwire-go/pkg/rest/namespaces"
  module: "github.com.signalwire.signalwire-go.pkg.rest.namespaces"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/rest/namespaces/fabric.go"
---
# `CxmlApplicationsResource`

CxmlApplicationsResource exposes the fabric cXML applications sub-resource. Create is explicitly disallowed — cXML applications cannot be created via this API. This mirrors Python's CxmlApplicationsResource.create raising NotImplementedError (fabric.py:90).

## Signature

```go
type CxmlApplicationsResource struct
```

## Properties

| Name           | Type            | Required | Default | Description |
| -------------- | --------------- | -------- | ------- | ----------- |
| `CrudResource` | `*CrudResource` | yes      | —       | —           |

## Methods

- [`Create`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/cxml-applications-resource/create) — Create always returns an error — cXML applications cannot be created via this API. The params argument is accepted for API parity with other CRUD resources but is reported in the error so the caller can see what payload was rejected. To create a new cXML application use a different API surface or the SignalWire dashboard.
- [`ListAddresses`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/cxml-applications-resource/list-addresses) — ListAddresses lists addresses for a cXML application.

## Source

[`pkg/rest/namespaces/fabric.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/rest/namespaces/fabric.go)

Line 150.
