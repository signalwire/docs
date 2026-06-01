---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/play-action"
title: "PlayAction"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "class"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/relay.PlayAction"
  parent: "github.com/signalwire/signalwire-go/pkg/relay"
  module: "github.com.signalwire.signalwire-go.pkg.relay"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/relay/action.go"
---
# `PlayAction`

PlayAction represents a long-running play operation with media controls.

## Signature

```go
type PlayAction struct
```

## Properties

| Name     | Type      | Required | Default | Description |
| -------- | --------- | -------- | ------- | ----------- |
| `Action` | `*Action` | yes      | —       | —           |

## Methods

- [`Pause`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/play-action/pause) — Pause pauses the currently playing media.
- [`Resume`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/play-action/resume) — Resume resumes paused media playback.
- [`Stop`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/play-action/stop) — Stop sends calling.play.stop to halt the active play operation.
- [`Volume`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/play-action/volume) — Volume adjusts playback volume by the given dB offset.

## Source

[`pkg/relay/action.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/relay/action.go)

Line 129.
