---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/calling-namespace"
title: "CallingNamespace"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "class"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/rest/namespaces.CallingNamespace"
  parent: "github.com/signalwire/signalwire-go/pkg/rest/namespaces"
  module: "github.com.signalwire.signalwire-go.pkg.rest.namespaces"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/rest/namespaces/calling.go"
---
# `CallingNamespace`

CallingNamespace provides REST-based call control. All commands are dispatched as POST /api/calling/calls with a "command" field.

## Signature

```go
type CallingNamespace struct
```

## Properties

| Name       | Type       | Required | Default | Description |
| ---------- | ---------- | -------- | ------- | ----------- |
| `Resource` | `Resource` | yes      | —       | —           |

## Methods

- [`AIHold`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/calling-namespace/ai-hold) — AIHold puts the AI on hold.
- [`AIMessage`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/calling-namespace/ai-message) — AIMessage sends a message to the AI agent on a call.
- [`AIStop`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/calling-namespace/ai-stop) — AIStop stops the AI session.
- [`AIUnhold`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/calling-namespace/ai-unhold) — AIUnhold takes the AI off hold.
- [`Collect`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/calling-namespace/collect) — Collect starts input collection on a call.
- [`CollectStartInputTimers`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/calling-namespace/collect-start-input-timers) — CollectStartInputTimers starts input timers for collection.
- [`CollectStop`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/calling-namespace/collect-stop) — CollectStop stops input collection.
- [`Denoise`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/calling-namespace/denoise) — Denoise enables denoising on a call.
- [`DenoiseStop`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/calling-namespace/denoise-stop) — DenoiseStop disables denoising.
- [`Detect`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/calling-namespace/detect) — Detect starts detection (e.g., answering machine) on a call.
- [`DetectStop`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/calling-namespace/detect-stop) — DetectStop stops detection.
- [`Dial`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/calling-namespace/dial) — Dial initiates a new call.
- [`Disconnect`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/calling-namespace/disconnect) — Disconnect disconnects a call.
- [`End`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/calling-namespace/end) — End terminates a call.
- [`LiveTranscribe`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/calling-namespace/live-transcribe) — LiveTranscribe starts live transcription.
- [`LiveTranslate`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/calling-namespace/live-translate) — LiveTranslate starts live translation.
- [`Play`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/calling-namespace/play) — Play starts playback on a call.
- [`PlayPause`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/calling-namespace/play-pause) — PlayPause pauses playback.
- [`PlayResume`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/calling-namespace/play-resume) — PlayResume resumes playback.
- [`PlayStop`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/calling-namespace/play-stop) — PlayStop stops playback.
- [`PlayVolume`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/calling-namespace/play-volume) — PlayVolume adjusts playback volume.
- [`ReceiveFaxStop`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/calling-namespace/receive-fax-stop) — ReceiveFaxStop stops receiving a fax.
- [`Record`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/calling-namespace/record) — Record starts recording on a call.
- [`RecordPause`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/calling-namespace/record-pause) — RecordPause pauses recording.
- [`RecordResume`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/calling-namespace/record-resume) — RecordResume resumes recording.
- [`RecordStop`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/calling-namespace/record-stop) — RecordStop stops recording.
- [`Refer`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/calling-namespace/refer) — Refer sends a SIP REFER on a call.
- [`SendFaxStop`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/calling-namespace/send-fax-stop) — SendFaxStop stops sending a fax.
- [`Stream`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/calling-namespace/stream) — Stream starts streaming on a call.
- [`StreamStop`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/calling-namespace/stream-stop) — StreamStop stops streaming.
- [`Tap`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/calling-namespace/tap) — Tap starts tapping a call.
- [`TapStop`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/calling-namespace/tap-stop) — TapStop stops tapping.
- [`Transcribe`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/calling-namespace/transcribe) — Transcribe starts transcription on a call.
- [`TranscribeStop`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/calling-namespace/transcribe-stop) — TranscribeStop stops transcription.
- [`Transfer`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/calling-namespace/transfer) — Transfer transfers a call.
- [`Update`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/calling-namespace/update) — Update updates call parameters.
- [`UserEvent`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/calling-namespace/user-event) — UserEvent sends a custom user event on a call.

## Source

[`pkg/rest/namespaces/calling.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/rest/namespaces/calling.go)

Line 12.
