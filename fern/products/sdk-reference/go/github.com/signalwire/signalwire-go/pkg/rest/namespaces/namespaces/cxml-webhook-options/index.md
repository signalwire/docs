---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/cxml-webhook-options"
title: "CxmlWebhookOptions"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "class"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/rest/namespaces.CxmlWebhookOptions"
  parent: "github.com/signalwire/signalwire-go/pkg/rest/namespaces"
  module: "github.com.signalwire.signalwire-go.pkg.rest.namespaces"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/rest/namespaces/phone_numbers.go"
---
# `CxmlWebhookOptions`

CxmlWebhookOptions holds optional fields for SetCxmlWebhook.

## Signature

```go
type CxmlWebhookOptions struct
```

## Properties

| Name                | Type                       | Required | Default | Description                                        |
| ------------------- | -------------------------- | -------- | ------- | -------------------------------------------------- |
| `Extra`             | `Extra map[string]any`     | yes      | —       | Extra passes through additional wire-level fields. |
| `FallbackURL`       | `FallbackURL string`       | yes      | —       | FallbackURL is used when the primary URL fails.    |
| `StatusCallbackURL` | `StatusCallbackURL string` | yes      | —       | StatusCallbackURL receives call status updates.    |

## Source

[`pkg/rest/namespaces/phone_numbers.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/rest/namespaces/phone_numbers.go)

Line 71.
