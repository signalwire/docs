---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/with-record-terminators"
title: "WithRecordTerminators"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "function"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/relay.WithRecordTerminators"
  parent: "github.com/signalwire/signalwire-go/pkg/relay"
  module: "github.com.signalwire.signalwire-go.pkg.relay"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/relay/options.go"
---
# `WithRecordTerminators`

WithRecordTerminators sets DTMF terminators to stop recording.

## Signature

```go
func WithRecordTerminators(terminators string) RecordOption
```

## Parameters

| Name          | Type     | Required | Default | Description |
| ------------- | -------- | -------- | ------- | ----------- |
| `terminators` | `string` | yes      | —       | —           |

## Returns

`RecordOption`

## Source

[`pkg/relay/options.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/relay/options.go)

Line 85.
