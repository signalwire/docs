---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/video-room-recordings/list-events"
title: "ListEvents"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "method"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/rest/namespaces.VideoRoomRecordings.ListEvents"
  parent: "github.com/signalwire/signalwire-go/pkg/rest/namespaces.VideoRoomRecordings"
  module: "github.com.signalwire.signalwire-go.pkg.rest.namespaces"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/rest/namespaces/video.go"
---
# `ListEvents`

ListEvents lists events for a room recording.

## Signature

```go
func (*VideoRoomRecordings) ListEvents(recordingID string, params map[string]string) (map[string]any, error)
```

## Parameters

| Name          | Type                | Required | Default | Description |
| ------------- | ------------------- | -------- | ------- | ----------- |
| `recordingID` | `string`            | yes      | —       | —           |
| `params`      | `map[string]string` | yes      | —       | —           |

## Returns

`(map[string]any, error)`

## Source

[`pkg/rest/namespaces/video.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/rest/namespaces/video.go)

Line 95.
