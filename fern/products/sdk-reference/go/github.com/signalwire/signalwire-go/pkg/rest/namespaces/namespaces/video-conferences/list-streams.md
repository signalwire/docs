---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/video-conferences/list-streams"
title: "ListStreams"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "method"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/rest/namespaces.VideoConferences.ListStreams"
  parent: "github.com/signalwire/signalwire-go/pkg/rest/namespaces.VideoConferences"
  module: "github.com.signalwire.signalwire-go.pkg.rest.namespaces"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/rest/namespaces/video.go"
---
# `ListStreams`

ListStreams lists streams for a conference.

## Signature

```go
func (*VideoConferences) ListStreams(conferenceID string, params map[string]string) (map[string]any, error)
```

## Parameters

| Name           | Type                | Required | Default | Description |
| -------------- | ------------------- | -------- | ------- | ----------- |
| `conferenceID` | `string`            | yes      | —       | —           |
| `params`       | `map[string]string` | yes      | —       | —           |

## Returns

`(map[string]any, error)`

## Source

[`pkg/rest/namespaces/video.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/rest/namespaces/video.go)

Line 112.
