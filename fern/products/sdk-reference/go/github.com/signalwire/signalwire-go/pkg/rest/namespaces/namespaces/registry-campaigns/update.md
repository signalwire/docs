---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/registry-campaigns/update"
title: "Update"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "method"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/rest/namespaces.RegistryCampaigns.Update"
  parent: "github.com/signalwire/signalwire-go/pkg/rest/namespaces.RegistryCampaigns"
  module: "github.com.signalwire.signalwire-go.pkg.rest.namespaces"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/rest/namespaces/registry.go"
---
# `Update`

Update modifies a campaign by ID.

## Signature

```go
func (*RegistryCampaigns) Update(campaignID string, data map[string]any) (map[string]any, error)
```

## Parameters

| Name         | Type             | Required | Default | Description |
| ------------ | ---------------- | -------- | ------- | ----------- |
| `campaignID` | `string`         | yes      | —       | —           |
| `data`       | `map[string]any` | yes      | —       | —           |

## Returns

`(map[string]any, error)`

## Source

[`pkg/rest/namespaces/registry.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/rest/namespaces/registry.go)

Line 55.
