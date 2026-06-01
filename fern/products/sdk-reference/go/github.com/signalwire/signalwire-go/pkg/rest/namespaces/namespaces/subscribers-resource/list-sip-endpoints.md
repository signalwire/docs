---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/subscribers-resource/list-sip-endpoints"
title: "ListSIPEndpoints"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "method"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/rest/namespaces.SubscribersResource.ListSIPEndpoints"
  parent: "github.com/signalwire/signalwire-go/pkg/rest/namespaces.SubscribersResource"
  module: "github.com.signalwire.signalwire-go.pkg.rest.namespaces"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/rest/namespaces/fabric.go"
---
# `ListSIPEndpoints`

ListSIPEndpoints lists SIP endpoints for a subscriber.

## Signature

```go
func (*SubscribersResource) ListSIPEndpoints(subscriberID string, params map[string]string) (map[string]any, error)
```

## Parameters

| Name           | Type                | Required | Default | Description |
| -------------- | ------------------- | -------- | ------- | ----------- |
| `subscriberID` | `string`            | yes      | —       | —           |
| `params`       | `map[string]string` | yes      | —       | —           |

## Returns

`(map[string]any, error)`

## Source

[`pkg/rest/namespaces/fabric.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/rest/namespaces/fabric.go)

Line 120.
