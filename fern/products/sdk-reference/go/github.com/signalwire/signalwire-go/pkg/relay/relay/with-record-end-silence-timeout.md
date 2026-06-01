---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/with-record-end-silence-timeout"
title: "WithRecordEndSilenceTimeout"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "function"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/relay.WithRecordEndSilenceTimeout"
  parent: "github.com/signalwire/signalwire-go/pkg/relay"
  module: "github.com.signalwire.signalwire-go.pkg.relay"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/relay/options.go"
---
# `WithRecordEndSilenceTimeout`

WithRecordEndSilenceTimeout sets the end-of-speech silence timeout in seconds.

## Signature

```go
func WithRecordEndSilenceTimeout(t float64) RecordOption
```

## Parameters

| Name | Type      | Required | Default | Description |
| ---- | --------- | -------- | ------- | ----------- |
| `t`  | `float64` | yes      | —       | —           |

## Returns

`RecordOption`

## Source

[`pkg/relay/options.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/relay/options.go)

Line 99.
