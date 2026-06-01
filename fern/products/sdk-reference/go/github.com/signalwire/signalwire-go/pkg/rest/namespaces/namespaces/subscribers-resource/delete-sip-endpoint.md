---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/subscribers-resource/delete-sip-endpoint"
title: "DeleteSIPEndpoint"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "method"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/rest/namespaces.SubscribersResource.DeleteSIPEndpoint"
  parent: "github.com/signalwire/signalwire-go/pkg/rest/namespaces.SubscribersResource"
  module: "github.com.signalwire.signalwire-go.pkg.rest.namespaces"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/rest/namespaces/fabric.go"
---
# `DeleteSIPEndpoint`

DeleteSIPEndpoint deletes a SIP endpoint from a subscriber.

## Signature

```go
func (*SubscribersResource) DeleteSIPEndpoint(subscriberID string, endpointID string) (map[string]any, error)
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

Line 140.
