---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/call/live-translate"
title: "LiveTranslate"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "method"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/relay.Call.LiveTranslate"
  parent: "github.com/signalwire/signalwire-go/pkg/relay.Call"
  module: "github.com.signalwire.signalwire-go.pkg.relay"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/relay/call.go"
---
# `LiveTranslate`

LiveTranslate starts or stops live translation on the call. The action map describes the translation operation. statusURL is optional (empty string omits it), matching Python's live\_translate(action, \*, status\_url).

## Signature

```go
func (*Call) LiveTranslate(action map[string]any, statusURL string) error
```

## Parameters

| Name        | Type             | Required | Default | Description |
| ----------- | ---------------- | -------- | ------- | ----------- |
| `action`    | `map[string]any` | yes      | —       | —           |
| `statusURL` | `string`         | yes      | —       | —           |

## Returns

`error`

## Source

[`pkg/relay/call.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/relay/call.go)

Line 331.
