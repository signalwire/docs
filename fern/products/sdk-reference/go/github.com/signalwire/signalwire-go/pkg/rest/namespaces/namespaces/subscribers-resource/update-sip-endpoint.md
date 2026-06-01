---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/subscribers-resource/update-sip-endpoint"
title: "UpdateSIPEndpoint"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "method"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/rest/namespaces.SubscribersResource.UpdateSIPEndpoint"
  parent: "github.com/signalwire/signalwire-go/pkg/rest/namespaces.SubscribersResource"
  module: "github.com.signalwire.signalwire-go.pkg.rest.namespaces"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/rest/namespaces/fabric.go"
---
# `UpdateSIPEndpoint`

UpdateSIPEndpoint updates a SIP endpoint for a subscriber.

## Signature

```go
func (*SubscribersResource) UpdateSIPEndpoint(subscriberID string, endpointID string, data map[string]any) (map[string]any, error)
```

## Parameters

| Name           | Type             | Required | Default | Description |
| -------------- | ---------------- | -------- | ------- | ----------- |
| `subscriberID` | `string`         | yes      | —       | —           |
| `endpointID`   | `string`         | yes      | —       | —           |
| `data`         | `map[string]any` | yes      | —       | —           |

## Returns

`(map[string]any, error)`

## Source

[`pkg/rest/namespaces/fabric.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/rest/namespaces/fabric.go)

Line 135.
