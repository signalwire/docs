---
slug: "/reference/cpp/signalwire/rest/rest-client/compat-queues/get-member"
title: "get_member"
sdk_label: "C++ SDK"
icon: "cpp"
lustri:
  auto_generated: true
  kind: "method"
  language: "cpp"
  qualified_name: "signalwire::rest::RestClient::CompatQueues::get_member"
  parent: "signalwire::rest::RestClient::CompatQueues"
  module: "signalwire.rest.RestClient"
  source_url: "https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/rest/rest_client.hpp"
  visibility: "public"
---
# `get_member`

**Modifiers:** `const` `inline`

## Signature

```cpp
json get_member(
    const std::string & queue_sid,
    const std::string & call_sid
) const
```

## Parameters

| Name        | Type                  | Required | Default | Description |
| ----------- | --------------------- | -------- | ------- | ----------- |
| `queue_sid` | `const std::string &` | yes      | —       | —           |
| `call_sid`  | `const std::string &` | yes      | —       | —           |

## Returns

`json`

## Source

[`include/signalwire/rest/rest_client.hpp`](https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/rest/rest_client.hpp)

Line 1035.
