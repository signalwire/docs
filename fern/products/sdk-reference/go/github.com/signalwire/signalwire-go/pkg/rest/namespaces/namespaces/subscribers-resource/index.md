---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/subscribers-resource"
title: "SubscribersResource"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "class"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/rest/namespaces.SubscribersResource"
  parent: "github.com/signalwire/signalwire-go/pkg/rest/namespaces"
  module: "github.com.signalwire.signalwire-go.pkg.rest.namespaces"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/rest/namespaces/fabric.go"
---
# `SubscribersResource`

SubscribersResource extends CrudResource with SIP endpoint management.

## Signature

```go
type SubscribersResource struct
```

## Properties

| Name           | Type            | Required | Default | Description |
| -------------- | --------------- | -------- | ------- | ----------- |
| `CrudResource` | `*CrudResource` | yes      | —       | —           |

## Methods

- [`CreateSIPEndpoint`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/subscribers-resource/create-sip-endpoint) — CreateSIPEndpoint creates a SIP endpoint for a subscriber.
- [`DeleteSIPEndpoint`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/subscribers-resource/delete-sip-endpoint) — DeleteSIPEndpoint deletes a SIP endpoint from a subscriber.
- [`GetSIPEndpoint`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/subscribers-resource/get-sip-endpoint) — GetSIPEndpoint retrieves a SIP endpoint for a subscriber.
- [`ListSIPEndpoints`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/subscribers-resource/list-sip-endpoints) — ListSIPEndpoints lists SIP endpoints for a subscriber.
- [`UpdateSIPEndpoint`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/subscribers-resource/update-sip-endpoint) — UpdateSIPEndpoint updates a SIP endpoint for a subscriber.

## Source

[`pkg/rest/namespaces/fabric.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/rest/namespaces/fabric.go)

Line 115.
