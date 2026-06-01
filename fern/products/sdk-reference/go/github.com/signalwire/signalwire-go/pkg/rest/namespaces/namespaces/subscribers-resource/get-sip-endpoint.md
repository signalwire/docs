---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/subscribers-resource/get-sip-endpoint"
title: "GetSIPEndpoint"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "method"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/rest/namespaces.SubscribersResource.GetSIPEndpoint"
  parent: "github.com/signalwire/signalwire-go/pkg/rest/namespaces.SubscribersResource"
  module: "github.com.signalwire.signalwire-go.pkg.rest.namespaces"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/rest/namespaces/fabric.go"
---
# `GetSIPEndpoint`

GetSIPEndpoint retrieves a SIP endpoint for a subscriber.

## Signature

```go
func (*SubscribersResource) GetSIPEndpoint(subscriberID string, endpointID string) (map[string]any, error)
```

## Parameters

| Name           | Type     | Required | Default | Description |
| -------------- | -------- | -------- | ------- | ----------- |
| `subscriberID` | `string` | yes      | —       | —           |
| `endpointID`   | `string` | yes      | —       | —           |

## Returns

`(map[string]any, error)`

## Source

[`pkg/rest/namespaces/fabric.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/rest/namespaces/fabric.go)

Line 130.
