---
slug: "/reference/dotnet/signal-wire.rest.namespaces/video"
title: "Video"
sdk_label: ".NET SDK"
icon: "dotnet"
lustri:
  auto_generated: true
  kind: "class"
  language: "dotnet"
  qualified_name: "SignalWire.REST.Namespaces.Video"
  parent: "SignalWire.REST.Namespaces"
  module: "SignalWire.REST.Namespaces"
  visibility: "public"
---
# `Video`

Video API namespace.

Mirrors Python `signalwire.rest.namespaces.video.VideoNamespace` —
rooms, room sessions, room recordings, conferences, conference tokens,
streams.

<p>The legacy ``client.Video.List() / Create / Get / Delete`` surface
(which targeted ``/api/video/rooms``) is preserved by inheriting from
<xref href="SignalWire.REST.CrudResource" data-throw-if-not-resolved="false"></xref>.</p>

## Signature

```dotnet
public class Video : CrudResource
```

## Inheritance

**Extends:** [SignalWire.REST.CrudResource](/reference/dotnet/signal-wire.rest/crud-resource)

## Properties

| Name               | Type                                                     | Required | Default | Description |
| ------------------ | -------------------------------------------------------- | -------- | ------- | ----------- |
| `Conferences`      | `public VideoConferences Conferences { get; }`           | yes      | —       | —           |
| `ConferenceTokens` | `public VideoConferenceTokens ConferenceTokens { get; }` | yes      | —       | —           |
| `RoomRecordings`   | `public VideoRoomRecordings RoomRecordings { get; }`     | yes      | —       | —           |
| `Rooms`            | `public VideoRooms Rooms { get; }`                       | yes      | —       | —           |
| `RoomSessions`     | `public VideoRoomSessions RoomSessions { get; }`         | yes      | —       | —           |
| `RoomTokens`       | `public VideoRoomTokens RoomTokens { get; }`             | yes      | —       | —           |
| `Streams`          | `public VideoStreams Streams { get; }`                   | yes      | —       | —           |

## Methods

- [`Video(HttpClient)`](/reference/dotnet/signal-wire.rest.namespaces/video/video-http-client)
