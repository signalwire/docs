---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/transcribe-event"
title: "TranscribeEvent"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "class"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/relay.TranscribeEvent"
  parent: "github.com/signalwire/signalwire-go/pkg/relay"
  module: "github.com.signalwire.signalwire-go.pkg.relay"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/relay/event.go"
---
# `TranscribeEvent`

TranscribeEvent represents a calling.call.transcribe event.

## Signature

```go
type TranscribeEvent struct
```

## Properties

| Name          | Type                 | Required | Default | Description                                                                           |
| ------------- | -------------------- | -------- | ------- | ------------------------------------------------------------------------------------- |
| `ControlID`   | `ControlID string`   | yes      | —       | —                                                                                     |
| `Duration`    | `Duration float64`   | yes      | —       | Duration is float64 for subsecond precision, matching Python's duration: float field. |
| `RecordingID` | `RecordingID string` | yes      | —       | RecordingID is the recording identifier, matching Python's recording\_id field.       |
| `RelayEvent`  | `*RelayEvent`        | yes      | —       | —                                                                                     |
| `Size`        | `Size int`           | yes      | —       | Size is the recording size in bytes, matching Python's size field.                    |
| `State`       | `State string`       | yes      | —       | —                                                                                     |
| `Text`        | `Text string`        | yes      | —       | —                                                                                     |
| `URL`         | `URL string`         | yes      | —       | URL is the transcription recording URL, matching Python's url field.                  |

## Source

[`pkg/relay/event.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/relay/event.go)

Line 603.
