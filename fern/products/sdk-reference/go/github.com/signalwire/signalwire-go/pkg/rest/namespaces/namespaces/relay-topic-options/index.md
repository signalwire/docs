---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/relay-topic-options"
title: "RelayTopicOptions"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "class"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/rest/namespaces.RelayTopicOptions"
  parent: "github.com/signalwire/signalwire-go/pkg/rest/namespaces"
  module: "github.com.signalwire.signalwire-go.pkg.rest.namespaces"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/rest/namespaces/phone_numbers.go"
---
# `RelayTopicOptions`

RelayTopicOptions holds optional fields for SetRelayTopic.

## Signature

```go
type RelayTopicOptions struct
```

## Properties

| Name                | Type                       | Required | Default | Description                                        |
| ------------------- | -------------------------- | -------- | ------- | -------------------------------------------------- |
| `Extra`             | `Extra map[string]any`     | yes      | —       | Extra passes through additional wire-level fields. |
| `StatusCallbackURL` | `StatusCallbackURL string` | yes      | —       | StatusCallbackURL receives topic status updates.   |

## Source

[`pkg/rest/namespaces/phone_numbers.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/rest/namespaces/phone_numbers.go)

Line 162.
