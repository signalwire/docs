---
slug: "/reference/cpp/signalwire/rest/rest-client/queues-namespace/get-member"
title: "get_member"
sdk_label: "C++ SDK"
icon: "cpp"
lustri:
  auto_generated: true
  kind: "method"
  language: "cpp"
  qualified_name: "signalwire::rest::RestClient::QueuesNamespace::get_member"
  parent: "signalwire::rest::RestClient::QueuesNamespace"
  module: "signalwire.rest.RestClient"
  source_url: "https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/rest/rest_client.hpp"
  visibility: "public"
---
# `get_member`

**Modifiers:** `const` `inline`

## Signature

```cpp
json get_member(
    const std::string & queue_id,
    const std::string & member_id
) const
```

## Parameters

| Name        | Type                  | Required | Default | Description |
| ----------- | --------------------- | -------- | ------- | ----------- |
| `queue_id`  | `const std::string &` | yes      | —       | —           |
| `member_id` | `const std::string &` | yes      | —       | —           |

## Returns

`json`

## Source

[`include/signalwire/rest/rest_client.hpp`](https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/rest/rest_client.hpp)

Line 1164.
