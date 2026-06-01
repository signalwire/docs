---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/swml/swml/service/say"
title: "Say"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "method"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/swml.Service.Say"
  parent: "github.com/signalwire/signalwire-go/pkg/swml.Service"
  module: "github.com.signalwire.signalwire-go.pkg.swml"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/swml/service.go"
---
# `Say`

Say adds a play verb with a "say:" prefix for text-to-speech. voice, language, and gender configure the TTS voice (optional). volume sets the playback volume (-40 to 40, optional). Mirrors Python SWMLBuilder.say(text, voice, language, gender, volume).

## Signature

```go
func (*Service) Say(
	text string,
	voice *string,
	language *string,
	gender *string,
	volume *float64
) error
```

## Parameters

| Name       | Type       | Required | Default | Description |
| ---------- | ---------- | -------- | ------- | ----------- |
| `text`     | `string`   | yes      | —       | —           |
| `voice`    | `*string`  | yes      | —       | —           |
| `language` | `*string`  | yes      | —       | —           |
| `gender`   | `*string`  | yes      | —       | —           |
| `volume`   | `*float64` | yes      | —       | —           |

## Returns

`error`

## Source

[`pkg/swml/service.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/swml/service.go)

Line 700.
