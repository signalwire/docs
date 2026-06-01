---
slug: "/reference/cpp/signalwire/rest/rest-client/compat-queues/dequeue-member"
title: "dequeue_member"
sdk_label: "C++ SDK"
icon: "cpp"
lustri:
  auto_generated: true
  kind: "method"
  language: "cpp"
  qualified_name: "signalwire::rest::RestClient::CompatQueues::dequeue_member"
  parent: "signalwire::rest::RestClient::CompatQueues"
  module: "signalwire.rest.RestClient"
  source_url: "https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/rest/rest_client.hpp"
  visibility: "public"
---
# `dequeue_member`

**Modifiers:** `const` `inline`

## Signature

```cpp
json dequeue_member(
    const std::string & queue_sid,
    const std::string & call_sid,
    const json & data
) const
```

## Parameters

| Name        | Type                  | Required | Default | Description |
| ----------- | --------------------- | -------- | ------- | ----------- |
| `queue_sid` | `const std::string &` | yes      | —       | —           |
| `call_sid`  | `const std::string &` | yes      | —       | —           |
| `data`      | `const json &`        | yes      | —       | —           |

## Returns

`json`

## Source

[`include/signalwire/rest/rest_client.hpp`](https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/rest/rest_client.hpp)

Line 1039.
