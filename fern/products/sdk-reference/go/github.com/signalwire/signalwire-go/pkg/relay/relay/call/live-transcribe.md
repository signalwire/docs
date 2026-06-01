---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/call/live-transcribe"
title: "LiveTranscribe"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "method"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/relay.Call.LiveTranscribe"
  parent: "github.com/signalwire/signalwire-go/pkg/relay.Call"
  module: "github.com.signalwire.signalwire-go.pkg.relay"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/relay/call.go"
---
# `LiveTranscribe`

LiveTranscribe starts or stops live transcription on the call. The action map describes the transcription operation (e.g. {"type": "start"}). Matches Python's live\_transcribe(action, \*\*kwargs).

## Signature

```go
func (*Call) LiveTranscribe(action map[string]any) error
```

## Parameters

| Name     | Type             | Required | Default | Description |
| -------- | ---------------- | -------- | ------- | ----------- |
| `action` | `map[string]any` | yes      | —       | —           |

## Returns

`error`

## Source

[`pkg/relay/call.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/relay/call.go)

Line 319.
