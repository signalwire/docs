---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/compat-faxes"
title: "CompatFaxes"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "class"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/rest/namespaces.CompatFaxes"
  parent: "github.com/signalwire/signalwire-go/pkg/rest/namespaces"
  module: "github.com.signalwire.signalwire-go.pkg.rest.namespaces"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/rest/namespaces/compat.go"
---
# `CompatFaxes`

CompatFaxes provides compat fax management with media sub-resources.

## Signature

```go
type CompatFaxes struct
```

## Properties

| Name           | Type            | Required | Default | Description |
| -------------- | --------------- | -------- | ------- | ----------- |
| `CrudResource` | `*CrudResource` | yes      | —       | —           |

## Methods

- [`DeleteMedia`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/compat-faxes/delete-media) — DeleteMedia deletes a media item from a fax.
- [`GetMedia`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/compat-faxes/get-media) — GetMedia retrieves a specific media item from a fax.
- [`ListMedia`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/compat-faxes/list-media) — ListMedia lists media for a fax.
- [`Update`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/compat-faxes/update) — Update updates a fax (uses POST per Twilio compat).

## Source

[`pkg/rest/namespaces/compat.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/rest/namespaces/compat.go)

Line 101.
