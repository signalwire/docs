---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/with-record-audio"
title: "WithRecordAudio"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "function"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/relay.WithRecordAudio"
  parent: "github.com/signalwire/signalwire-go/pkg/relay"
  module: "github.com.signalwire.signalwire-go.pkg.relay"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/relay/options.go"
---
# `WithRecordAudio`

WithRecordAudio sets the audio config map for the record action's "record": {"audio": ...} payload. Mirrors Python's record(audio=...).

## Signature

```go
func WithRecordAudio(audio map[string]any) RecordOption
```

## Parameters

| Name    | Type             | Required | Default | Description |
| ------- | ---------------- | -------- | ------- | ----------- |
| `audio` | `map[string]any` | yes      | —       | —           |

## Returns

`RecordOption`

## Source

[`pkg/relay/options.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/relay/options.go)

Line 115.
