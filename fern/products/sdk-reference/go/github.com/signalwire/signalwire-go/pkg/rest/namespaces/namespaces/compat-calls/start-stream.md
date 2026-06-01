---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/compat-calls/start-stream"
title: "StartStream"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "method"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/rest/namespaces.CompatCalls.StartStream"
  parent: "github.com/signalwire/signalwire-go/pkg/rest/namespaces.CompatCalls"
  module: "github.com.signalwire.signalwire-go.pkg.rest.namespaces"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/rest/namespaces/compat.go"
---
# `StartStream`

StartStream starts a stream on a call.

## Signature

```go
func (*CompatCalls) StartStream(callSID string, data map[string]any) (map[string]any, error)
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

Line 62.
