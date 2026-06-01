---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/video-room-recordings"
title: "VideoRoomRecordings"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "class"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/rest/namespaces.VideoRoomRecordings"
  parent: "github.com/signalwire/signalwire-go/pkg/rest/namespaces"
  module: "github.com.signalwire.signalwire-go.pkg.rest.namespaces"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/rest/namespaces/video.go"
---
# `VideoRoomRecordings`

VideoRoomRecordings provides video room recording management.

## Signature

```go
type VideoRoomRecordings struct
```

## Properties

| Name       | Type       | Required | Default | Description |
| ---------- | ---------- | -------- | ------- | ----------- |
| `Resource` | `Resource` | yes      | —       | —           |

## Methods

- [`Delete`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/video-room-recordings/delete) — Delete removes a room recording. It returns the parsed response body (or an empty map for 204 No Content) and any error.
- [`Get`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/video-room-recordings/get) — Get retrieves a specific room recording.
- [`List`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/video-room-recordings/list) — List lists all room recordings.
- [`ListEvents`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/video-room-recordings/list-events) — ListEvents lists events for a room recording.

## Source

[`pkg/rest/namespaces/video.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/rest/namespaces/video.go)

Line 74.
