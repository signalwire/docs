---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/with-fax-header-info"
title: "WithFaxHeaderInfo"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "function"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/relay.WithFaxHeaderInfo"
  parent: "github.com/signalwire/signalwire-go/pkg/relay"
  module: "github.com.signalwire.signalwire-go.pkg.relay"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/relay/options.go"
---
# `WithFaxHeaderInfo`

WithFaxHeaderInfo sets the fax header info string (matches Python's header\_info param).

## Signature

```go
func WithFaxHeaderInfo(headerInfo string) FaxOption
```

## Parameters

| Name         | Type     | Required | Default | Description |
| ------------ | -------- | -------- | ------- | ----------- |
| `headerInfo` | `string` | yes      | —       | —           |

## Returns

`FaxOption`

## Source

[`pkg/relay/options.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/relay/options.go)

Line 191.
