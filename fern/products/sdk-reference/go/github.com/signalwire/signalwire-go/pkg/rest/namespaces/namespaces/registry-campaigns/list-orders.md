---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/registry-campaigns/list-orders"
title: "ListOrders"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "method"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/rest/namespaces.RegistryCampaigns.ListOrders"
  parent: "github.com/signalwire/signalwire-go/pkg/rest/namespaces.RegistryCampaigns"
  module: "github.com.signalwire.signalwire-go.pkg.rest.namespaces"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/rest/namespaces/registry.go"
---
# `ListOrders`

ListOrders lists orders for a campaign.

## Signature

```go
func (*RegistryCampaigns) ListOrders(campaignID string, params map[string]string) (map[string]any, error)
```

## Parameters

| Name         | Type                | Required | Default | Description |
| ------------ | ------------------- | -------- | ------- | ----------- |
| `campaignID` | `string`            | yes      | —       | —           |
| `params`     | `map[string]string` | yes      | —       | —           |

## Returns

`(map[string]any, error)`

## Source

[`pkg/rest/namespaces/registry.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/rest/namespaces/registry.go)

Line 65.
