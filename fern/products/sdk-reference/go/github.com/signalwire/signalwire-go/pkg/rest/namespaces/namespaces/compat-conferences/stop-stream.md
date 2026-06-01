---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/compat-conferences/stop-stream"
title: "StopStream"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "method"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/rest/namespaces.CompatConferences.StopStream"
  parent: "github.com/signalwire/signalwire-go/pkg/rest/namespaces.CompatConferences"
  module: "github.com.signalwire.signalwire-go.pkg.rest.namespaces"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/rest/namespaces/compat.go"
---
# `StopStream`

StopStream stops a stream on a conference.

## Signature

```go
func (*CompatConferences) StopStream(conferenceSID string, streamSID string, data map[string]any) (map[string]any, error)
```

## Parameters

| Name            | Type             | Required | Default | Description |
| --------------- | ---------------- | -------- | ------- | ----------- |
| `conferenceSID` | `string`         | yes      | —       | —           |
| `streamSID`     | `string`         | yes      | —       | —           |
| `data`          | `map[string]any` | yes      | —       | —           |

## Returns

`(map[string]any, error)`

## Source

[`pkg/rest/namespaces/compat.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/rest/namespaces/compat.go)

Line 200.
