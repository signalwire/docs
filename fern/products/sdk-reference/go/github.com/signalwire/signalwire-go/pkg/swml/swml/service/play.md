---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/swml/swml/service/play"
title: "Play"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "method"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/swml.Service.Play"
  parent: "github.com/signalwire/signalwire-go/pkg/swml.Service"
  module: "github.com.signalwire.signalwire-go.pkg.swml"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/swml/service.go"
---
# `Play`

Play adds the play verb. Exactly one of url or urls must be provided; providing both is an error. volume sets the playback volume (-40 to 40, optional). sayVoice, sayLanguage, sayGender configure text-to-speech (optional). autoAnswer controls whether to auto-answer the call (optional). Mirrors Python SWMLBuilder.play(url, urls, volume, say\_voice, say\_language, say\_gender, auto\_answer).

## Signature

```go
func (*Service) Play(
	url *string,
	urls []string,
	volume *float64,
	sayVoice *string,
	sayLanguage *string,
	sayGender *string,
	autoAnswer *bool
) error
```

## Parameters

| Name          | Type       | Required | Default | Description |
| ------------- | ---------- | -------- | ------- | ----------- |
| `url`         | `*string`  | yes      | —       | —           |
| `urls`        | `[]string` | yes      | —       | —           |
| `volume`      | `*float64` | yes      | —       | —           |
| `sayVoice`    | `*string`  | yes      | —       | —           |
| `sayLanguage` | `*string`  | yes      | —       | —           |
| `sayGender`   | `*string`  | yes      | —       | —           |
| `autoAnswer`  | `*bool`    | yes      | —       | —           |

## Returns

`error`

## Source

[`pkg/swml/service.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/swml/service.go)

Line 665.
