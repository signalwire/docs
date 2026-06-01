---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/video-room-sessions/list-events"
title: "ListEvents"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "method"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/rest/namespaces.VideoRoomSessions.ListEvents"
  parent: "github.com/signalwire/signalwire-go/pkg/rest/namespaces.VideoRoomSessions"
  module: "github.com.signalwire.signalwire-go.pkg.rest.namespaces"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/rest/namespaces/video.go"
---
# `ListEvents`

ListEvents lists events for a room session.

## Signature

```go
func (*VideoRoomSessions) ListEvents(sessionID string, params map[string]string) (map[string]any, error)
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

Line 57.
