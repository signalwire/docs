---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/video-namespace"
title: "VideoNamespace"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "class"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/rest/namespaces.VideoNamespace"
  parent: "github.com/signalwire/signalwire-go/pkg/rest/namespaces"
  module: "github.com.signalwire.signalwire-go.pkg.rest.namespaces"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/rest/namespaces/video.go"
---
# `VideoNamespace`

VideoNamespace groups all Video API resources.

## Signature

```go
type VideoNamespace struct
```

## Properties

| Name               | Type                                      | Required | Default | Description |
| ------------------ | ----------------------------------------- | -------- | ------- | ----------- |
| `Conferences`      | `Conferences *VideoConferences`           | yes      | —       | —           |
| `ConferenceTokens` | `ConferenceTokens *VideoConferenceTokens` | yes      | —       | —           |
| `RoomRecordings`   | `RoomRecordings *VideoRoomRecordings`     | yes      | —       | —           |
| `Rooms`            | `Rooms *VideoRooms`                       | yes      | —       | —           |
| `RoomSessions`     | `RoomSessions *VideoRoomSessions`         | yes      | —       | —           |
| `RoomTokens`       | `RoomTokens *VideoRoomTokens`             | yes      | —       | —           |
| `Streams`          | `Streams *VideoStreams`                   | yes      | —       | —           |

## Source

[`pkg/rest/namespaces/video.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/rest/namespaces/video.go)

Line 164.
