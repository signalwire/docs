---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/fabric-tokens"
title: "FabricTokens"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "class"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/rest/namespaces.FabricTokens"
  parent: "github.com/signalwire/signalwire-go/pkg/rest/namespaces"
  module: "github.com.signalwire.signalwire-go.pkg.rest.namespaces"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/rest/namespaces/fabric.go"
---
# `FabricTokens`

FabricTokens provides subscriber, guest, invite, and embed token creation.

## Signature

```go
type FabricTokens struct
```

## Properties

| Name       | Type       | Required | Default | Description |
| ---------- | ---------- | -------- | ------- | ----------- |
| `Resource` | `Resource` | yes      | —       | —           |

## Methods

- [`CreateEmbedToken`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/fabric-tokens/create-embed-token) — CreateEmbedToken creates an embed token.
- [`CreateGuestToken`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/fabric-tokens/create-guest-token) — CreateGuestToken creates a guest token.
- [`CreateInviteToken`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/fabric-tokens/create-invite-token) — CreateInviteToken creates an invite token.
- [`CreateSubscriberToken`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/fabric-tokens/create-subscriber-token) — CreateSubscriberToken creates a subscriber token.
- [`RefreshSubscriberToken`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/fabric-tokens/refresh-subscriber-token) — RefreshSubscriberToken refreshes a subscriber token.

## Source

[`pkg/rest/namespaces/fabric.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/rest/namespaces/fabric.go)

Line 282.
