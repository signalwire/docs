---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/video-room-recordings/list"
title: "List"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "method"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/rest/namespaces.VideoRoomRecordings.List"
  parent: "github.com/signalwire/signalwire-go/pkg/rest/namespaces.VideoRoomRecordings"
  module: "github.com.signalwire.signalwire-go.pkg.rest.namespaces"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/rest/namespaces/video.go"
---
# `List`

List lists all room recordings.

## Signature

```go
func (*VideoRoomRecordings) List(params map[string]string) (map[string]any, error)
```

## Parameters

| Name     | Type                | Required | Default | Description |
| -------- | ------------------- | -------- | ------- | ----------- |
| `params` | `map[string]string` | yes      | —       | —           |

## Returns

`(map[string]any, error)`

## Source

[`pkg/rest/namespaces/video.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/rest/namespaces/video.go)

Line 79.
