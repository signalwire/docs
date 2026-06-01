---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/compat-messages"
title: "CompatMessages"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "class"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/rest/namespaces.CompatMessages"
  parent: "github.com/signalwire/signalwire-go/pkg/rest/namespaces"
  module: "github.com.signalwire.signalwire-go.pkg.rest.namespaces"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/rest/namespaces/compat.go"
---
# `CompatMessages`

CompatMessages provides compat message management with media sub-resources.

## Signature

```go
type CompatMessages struct
```

## Properties

| Name           | Type            | Required | Default | Description |
| -------------- | --------------- | -------- | ------- | ----------- |
| `CrudResource` | `*CrudResource` | yes      | —       | —           |

## Methods

- [`DeleteMedia`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/compat-messages/delete-media) — DeleteMedia deletes a media item from a message.
- [`GetMedia`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/compat-messages/get-media) — GetMedia retrieves a specific media item from a message.
- [`ListMedia`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/compat-messages/list-media) — ListMedia lists media for a message.
- [`Update`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/compat-messages/update) — Update updates a message (uses POST per Twilio compat).

## Source

[`pkg/rest/namespaces/compat.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/rest/namespaces/compat.go)

Line 74.
