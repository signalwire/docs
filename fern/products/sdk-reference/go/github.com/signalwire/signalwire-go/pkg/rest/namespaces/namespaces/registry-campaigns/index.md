---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/registry-campaigns"
title: "RegistryCampaigns"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "class"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/rest/namespaces.RegistryCampaigns"
  parent: "github.com/signalwire/signalwire-go/pkg/rest/namespaces"
  module: "github.com.signalwire.signalwire-go.pkg.rest.namespaces"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/rest/namespaces/registry.go"
---
# `RegistryCampaigns`

RegistryCampaigns provides 10DLC campaign management.

## Signature

```go
type RegistryCampaigns struct
```

## Properties

| Name       | Type       | Required | Default | Description |
| ---------- | ---------- | -------- | ------- | ----------- |
| `Resource` | `Resource` | yes      | —       | —           |

## Methods

- [`CreateOrder`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/registry-campaigns/create-order) — CreateOrder creates a number assignment order for a campaign.
- [`Get`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/registry-campaigns/get) — Get retrieves a campaign by ID.
- [`ListNumbers`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/registry-campaigns/list-numbers) — ListNumbers lists numbers assigned to a campaign.
- [`ListOrders`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/registry-campaigns/list-orders) — ListOrders lists orders for a campaign.
- [`Update`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/registry-campaigns/update) — Update modifies a campaign by ID.

## Source

[`pkg/rest/namespaces/registry.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/rest/namespaces/registry.go)

Line 45.
