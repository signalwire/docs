---
slug: "/reference/cpp/signalwire/rest/rest-client/video-rooms/list-streams"
title: "list_streams"
sdk_label: "C++ SDK"
icon: "cpp"
lustri:
  auto_generated: true
  kind: "method"
  language: "cpp"
  qualified_name: "signalwire::rest::RestClient::VideoRooms::list_streams"
  parent: "signalwire::rest::RestClient::VideoRooms"
  module: "signalwire.rest.RestClient"
  source_url: "https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/rest/rest_client.hpp"
  visibility: "public"
---
# `list_streams`

**Modifiers:** `const` `inline`

## Signature

```cpp
json list_streams(
    const std::string & room_id,
    const std::map< std::string, std::string > & params = {}
) const
```

## Parameters

| Name      | Type                                           | Required | Default | Description |
| --------- | ---------------------------------------------- | -------- | ------- | ----------- |
| `room_id` | `const std::string &`                          | yes      | —       | —           |
| `params`  | `const std::map< std::string, std::string > &` | no       | `{}`    | —           |

## Returns

`json`

## Source

[`include/signalwire/rest/rest_client.hpp`](https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/rest/rest_client.hpp)

Line 664.
