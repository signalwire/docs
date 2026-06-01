---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/calling-namespace/play-pause"
title: "PlayPause"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "method"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/rest/namespaces.CallingNamespace.PlayPause"
  parent: "github.com/signalwire/signalwire-go/pkg/rest/namespaces.CallingNamespace"
  module: "github.com.signalwire.signalwire-go.pkg.rest.namespaces"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/rest/namespaces/calling.go"
---
# `PlayPause`

PlayPause pauses playback.

## Signature

```go
func (*CallingNamespace) PlayPause(callID string, params map[string]any) (map[string]any, error)
```

## Parameters

| Name     | Type             | Required | Default | Description |
| -------- | ---------------- | -------- | ------- | ----------- |
| `callID` | `string`         | yes      | —       | —           |
| `params` | `map[string]any` | yes      | —       | —           |

## Returns

`(map[string]any, error)`

## Source

[`pkg/rest/namespaces/calling.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/rest/namespaces/calling.go)

Line 70.
