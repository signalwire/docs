---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/generic-resources"
title: "GenericResources"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "class"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/rest/namespaces.GenericResources"
  parent: "github.com/signalwire/signalwire-go/pkg/rest/namespaces"
  module: "github.com.signalwire.signalwire-go.pkg.rest.namespaces"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/rest/namespaces/fabric.go"
---
# `GenericResources`

GenericResources provides operations across all fabric resource types.

## Signature

```go
type GenericResources struct
```

## Properties

| Name       | Type       | Required | Default | Description |
| ---------- | ---------- | -------- | ------- | ----------- |
| `Resource` | `Resource` | yes      | —       | —           |

## Methods

- [`AssignDomainApplication`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/generic-resources/assign-domain-application) — AssignDomainApplication assigns a domain application to a resource.
- [`AssignPhoneRoute`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/generic-resources/assign-phone-route) — AssignPhoneRoute assigns a phone route to a resource.
- [`Delete`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/generic-resources/delete) — Delete removes a generic resource by ID.
- [`Get`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/generic-resources/get) — Get retrieves a generic resource by ID.
- [`List`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/generic-resources/list) — List lists all generic resources.
- [`ListAddresses`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/generic-resources/list-addresses) — ListAddresses lists addresses for a generic resource.

## Source

[`pkg/rest/namespaces/fabric.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/rest/namespaces/fabric.go)

Line 213.
