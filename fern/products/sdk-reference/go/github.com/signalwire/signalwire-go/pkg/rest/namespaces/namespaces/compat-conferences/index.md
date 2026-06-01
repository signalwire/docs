---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/compat-conferences"
title: "CompatConferences"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "class"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/rest/namespaces.CompatConferences"
  parent: "github.com/signalwire/signalwire-go/pkg/rest/namespaces"
  module: "github.com.signalwire.signalwire-go.pkg.rest.namespaces"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/rest/namespaces/compat.go"
---
# `CompatConferences`

CompatConferences provides compat conference management with participants, recordings, and streams.

## Signature

```go
type CompatConferences struct
```

## Properties

| Name       | Type       | Required | Default | Description |
| ---------- | ---------- | -------- | ------- | ----------- |
| `Resource` | `Resource` | yes      | —       | —           |

## Methods

- [`DeleteRecording`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/compat-conferences/delete-recording) — DeleteRecording deletes a recording from a conference.
- [`Get`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/compat-conferences/get) — Get retrieves a conference by SID.
- [`GetParticipant`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/compat-conferences/get-participant) — GetParticipant retrieves a participant from a conference.
- [`GetRecording`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/compat-conferences/get-recording) — GetRecording retrieves a recording from a conference.
- [`List`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/compat-conferences/list) — List lists all conferences.
- [`ListParticipants`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/compat-conferences/list-participants) — ListParticipants lists participants in a conference.
- [`ListRecordings`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/compat-conferences/list-recordings) — ListRecordings lists recordings for a conference.
- [`RemoveParticipant`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/compat-conferences/remove-participant) — RemoveParticipant removes a participant from a conference.
- [`StartStream`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/compat-conferences/start-stream) — StartStream starts a stream on a conference.
- [`StopStream`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/compat-conferences/stop-stream) — StopStream stops a stream on a conference.
- [`Update`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/compat-conferences/update) — Update updates a conference.
- [`UpdateParticipant`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/compat-conferences/update-participant) — UpdateParticipant updates a participant in a conference.
- [`UpdateRecording`](/reference/go/github.com/signalwire/signalwire-go/pkg/rest/namespaces/namespaces/compat-conferences/update-recording) — UpdateRecording updates a recording in a conference.

## Source

[`pkg/rest/namespaces/compat.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/rest/namespaces/compat.go)

Line 129.
