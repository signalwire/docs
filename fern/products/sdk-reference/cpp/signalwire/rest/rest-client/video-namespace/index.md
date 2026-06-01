---
slug: "/reference/cpp/signalwire/rest/rest-client/video-namespace"
title: "VideoNamespace"
sdk_label: "C++ SDK"
icon: "cpp"
lustri:
  auto_generated: true
  kind: "class"
  language: "cpp"
  qualified_name: "signalwire::rest::RestClient::VideoNamespace"
  parent: "signalwire::rest::RestClient"
  module: "signalwire.rest.RestClient"
  source_url: "https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/rest/rest_client.hpp"
  visibility: "public"
---
# `VideoNamespace`

## Signature

```cpp
struct signalwire::rest::RestClient::VideoNamespace
```

## Properties

| Name                | Type                                      | Required | Default | Description |
| ------------------- | ----------------------------------------- | -------- | ------- | ----------- |
| `conference_tokens` | `VideoConferenceTokens conference_tokens` | yes      | —       | —           |
| `conferences`       | `VideoConferences conferences`            | yes      | —       | —           |
| `recordings`        | `CrudResource recordings`                 | yes      | —       | —           |
| `room_recordings`   | `VideoRoomRecordings room_recordings`     | yes      | —       | —           |
| `room_sessions`     | `VideoRoomSessions room_sessions`         | yes      | —       | —           |
| `room_tokens`       | `VideoRoomTokens room_tokens`             | yes      | —       | —           |
| `rooms`             | `VideoRooms rooms`                        | yes      | —       | —           |
| `streams`           | `VideoStreams streams`                    | yes      | —       | —           |

## Methods

- [`VideoNamespace`](/reference/cpp/signalwire/rest/rest-client/video-namespace/video-namespace)

## Source

[`include/signalwire/rest/rest_client.hpp`](https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/rest/rest_client.hpp)

Line 771.
