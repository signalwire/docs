---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/compat-calls/update-recording"
title: "UpdateRecording"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "method"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/rest/namespaces.CompatCalls.UpdateRecording"
  parent: "github.com/signalwire/signalwire-go/pkg/rest/namespaces.CompatCalls"
  module: "github.com.signalwire.signalwire-go.pkg.rest.namespaces"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/rest/namespaces/compat.go"
---
# `UpdateRecording`

UpdateRecording updates a recording on a call.

## Signature

```go
func (*CompatCalls) UpdateRecording(callSID string, recordingSID string, data map[string]any) (map[string]any, error)
```

## Parameters

| Name           | Type             | Required | Default | Description |
| -------------- | ---------------- | -------- | ------- | ----------- |
| `callSID`      | `string`         | yes      | —       | —           |
| `recordingSID` | `string`         | yes      | —       | —           |
| `data`         | `map[string]any` | yes      | —       | —           |

## Returns

`(map[string]any, error)`

## Source

[`pkg/rest/namespaces/compat.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/rest/namespaces/compat.go)

Line 57.
