---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/registry-brands"
title: "RegistryBrands"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "class"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/rest/namespaces.RegistryBrands"
  parent: "github.com/signalwire/signalwire-go/pkg/rest/namespaces"
  module: "github.com.signalwire.signalwire-go.pkg.rest.namespaces"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/rest/namespaces/registry.go"
---
# `RegistryBrands`

RegistryBrands provides 10DLC brand management.

## Signature

```go
type RegistryBrands struct
```

## Properties

| Name       | Type       | Required | Default | Description |
| ---------- | ---------- | -------- | ------- | ----------- |
| `Resource` | `Resource` | yes      | —       | —           |

## Methods

- [`Create`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/registry-brands/create) — Create creates a new brand.
- [`CreateCampaign`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/registry-brands/create-campaign) — CreateCampaign creates a campaign under a brand.
- [`Get`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/registry-brands/get) — Get retrieves a brand by ID.
- [`List`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/registry-brands/list) — List lists all brands.
- [`ListCampaigns`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/registry-brands/list-campaigns) — ListCampaigns lists campaigns for a brand.

## Source

[`pkg/rest/namespaces/registry.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/rest/namespaces/registry.go)

Line 13.
