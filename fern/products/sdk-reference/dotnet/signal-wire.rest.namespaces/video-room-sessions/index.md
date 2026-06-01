---
slug: "/reference/dotnet/signal-wire.rest.namespaces/video-room-sessions"
title: "VideoRoomSessions"
sdk_label: ".NET SDK"
icon: "dotnet"
lustri:
  auto_generated: true
  kind: "class"
  language: "dotnet"
  qualified_name: "SignalWire.REST.Namespaces.VideoRoomSessions"
  parent: "SignalWire.REST.Namespaces"
  module: "SignalWire.REST.Namespaces"
  visibility: "public"
---
# `VideoRoomSessions`

Video room sessions: list, get, list\_events/\_members/\_recordings.

## Signature

```dotnet
public class VideoRoomSessions
```

## Properties

| Name       | Type                              | Required | Default | Description |
| ---------- | --------------------------------- | -------- | ------- | ----------- |
| `BasePath` | `public string BasePath { get; }` | yes      | —       | —           |

## Methods

- [`GetAsync(string)`](/reference/dotnet/signal-wire.rest.namespaces/video-room-sessions/get-async-string)
- [`ListAsync(Dictionary<string, string>?)`](/reference/dotnet/signal-wire.rest.namespaces/video-room-sessions/list-async-dictionary-string-string)
- [`ListEventsAsync(string, Dictionary<string, string>?)`](/reference/dotnet/signal-wire.rest.namespaces/video-room-sessions/list-events-async-string-dictionary-string-string)
- [`ListMembersAsync(string, Dictionary<string, string>?)`](/reference/dotnet/signal-wire.rest.namespaces/video-room-sessions/list-members-async-string-dictionary-string-string)
- [`ListRecordingsAsync(string, Dictionary<string, string>?)`](/reference/dotnet/signal-wire.rest.namespaces/video-room-sessions/list-recordings-async-string-dictionary-string-string)
- [`VideoRoomSessions(HttpClient, string)`](/reference/dotnet/signal-wire.rest.namespaces/video-room-sessions/video-room-sessions-http-client-string)
