---
slug: "/reference/cpp/signalwire/rest/rest-client/fabric-conference-rooms/list-addresses"
title: "list_addresses"
sdk_label: "C++ SDK"
icon: "cpp"
lustri:
  auto_generated: true
  kind: "method"
  language: "cpp"
  qualified_name: "signalwire::rest::RestClient::FabricConferenceRooms::list_addresses"
  parent: "signalwire::rest::RestClient::FabricConferenceRooms"
  module: "signalwire.rest.RestClient"
  source_url: "https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/rest/rest_client.hpp"
  visibility: "public"
---
# `list_addresses`

**Modifiers:** `const` `inline`

## Signature

```cpp
json list_addresses(
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

Line 105.
