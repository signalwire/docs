---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/video-streams/update"
title: "Update"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "method"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/rest/namespaces.VideoStreams.Update"
  parent: "github.com/signalwire/signalwire-go/pkg/rest/namespaces.VideoStreams"
  module: "github.com.signalwire.signalwire-go.pkg.rest.namespaces"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/rest/namespaces/video.go"
---
# `Update`

Update modifies a video stream.

## Signature

```go
func (*VideoStreams) Update(streamID string, data map[string]any) (map[string]any, error)
```

## Parameters

| Name       | Type             | Required | Default | Description |
| ---------- | ---------------- | -------- | ------- | ----------- |
| `streamID` | `string`         | yes      | —       | —           |
| `data`     | `map[string]any` | yes      | —       | —           |

## Returns

`(map[string]any, error)`

## Source

[`pkg/rest/namespaces/video.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/rest/namespaces/video.go)

Line 151.
