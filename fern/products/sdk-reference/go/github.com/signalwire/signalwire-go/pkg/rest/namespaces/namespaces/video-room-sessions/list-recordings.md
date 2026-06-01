---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/video-room-sessions/list-recordings"
title: "ListRecordings"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "method"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/rest/namespaces.VideoRoomSessions.ListRecordings"
  parent: "github.com/signalwire/signalwire-go/pkg/rest/namespaces.VideoRoomSessions"
  module: "github.com.signalwire.signalwire-go.pkg.rest.namespaces"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/rest/namespaces/video.go"
---
# `ListRecordings`

ListRecordings lists recordings for a room session.

## Signature

```go
func (*VideoRoomSessions) ListRecordings(sessionID string, params map[string]string) (map[string]any, error)
```

## Parameters

| Name        | Type                | Required | Default | Description |
| ----------- | ------------------- | -------- | ------- | ----------- |
| `sessionID` | `string`            | yes      | —       | —           |
| `params`    | `map[string]string` | yes      | —       | —           |

## Returns

`(map[string]any, error)`

## Source

[`pkg/rest/namespaces/video.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/rest/namespaces/video.go)

Line 67.
