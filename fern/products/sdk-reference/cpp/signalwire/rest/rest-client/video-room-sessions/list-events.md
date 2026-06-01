---
slug: "/reference/cpp/signalwire/rest/rest-client/video-room-sessions/list-events"
title: "list_events"
sdk_label: "C++ SDK"
icon: "cpp"
lustri:
  auto_generated: true
  kind: "method"
  language: "cpp"
  qualified_name: "signalwire::rest::RestClient::VideoRoomSessions::list_events"
  parent: "signalwire::rest::RestClient::VideoRoomSessions"
  module: "signalwire.rest.RestClient"
  source_url: "https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/rest/rest_client.hpp"
  visibility: "public"
---
# `list_events`

**Modifiers:** `const` `inline`

## Signature

```cpp
json list_events(
    const std::string & session_id,
    const std::map< std::string, std::string > & params = {}
) const
```

## Parameters

| Name         | Type                                           | Required | Default | Description |
| ------------ | ---------------------------------------------- | -------- | ------- | ----------- |
| `session_id` | `const std::string &`                          | yes      | —       | —           |
| `params`     | `const std::map< std::string, std::string > &` | no       | `{}`    | —           |

## Returns

`json`

## Source

[`include/signalwire/rest/rest_client.hpp`](https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/rest/rest_client.hpp)

Line 690.
