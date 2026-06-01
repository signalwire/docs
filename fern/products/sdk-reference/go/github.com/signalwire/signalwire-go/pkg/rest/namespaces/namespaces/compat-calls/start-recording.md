---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/compat-calls/start-recording"
title: "StartRecording"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "method"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/rest/namespaces.CompatCalls.StartRecording"
  parent: "github.com/signalwire/signalwire-go/pkg/rest/namespaces.CompatCalls"
  module: "github.com.signalwire.signalwire-go.pkg.rest.namespaces"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/rest/namespaces/compat.go"
---
# `StartRecording`

StartRecording starts recording on a call.

## Signature

```go
func (*CompatCalls) StartRecording(callSID string, data map[string]any) (map[string]any, error)
```

## Parameters

| Name      | Type             | Required | Default | Description |
| --------- | ---------------- | -------- | ------- | ----------- |
| `callSID` | `string`         | yes      | —       | —           |
| `data`    | `map[string]any` | yes      | —       | —           |

## Returns

`(map[string]any, error)`

## Source

[`pkg/rest/namespaces/compat.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/rest/namespaces/compat.go)

Line 52.
