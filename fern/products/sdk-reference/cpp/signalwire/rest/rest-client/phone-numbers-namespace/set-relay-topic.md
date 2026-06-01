---
slug: "/reference/cpp/signalwire/rest/rest-client/phone-numbers-namespace/set-relay-topic"
title: "set_relay_topic"
sdk_label: "C++ SDK"
icon: "cpp"
lustri:
  auto_generated: true
  kind: "method"
  language: "cpp"
  qualified_name: "signalwire::rest::RestClient::PhoneNumbersNamespace::set_relay_topic"
  parent: "signalwire::rest::RestClient::PhoneNumbersNamespace"
  module: "signalwire.rest.RestClient"
  source_url: "https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/rest/rest_client.hpp"
  visibility: "public"
---
# `set_relay_topic`

Route inbound calls to a RELAY topic (client subscription).

**Modifiers:** `const` `inline`

## Signature

```cpp
json set_relay_topic(
    const std::string & resource_id,
    const std::string & topic,
    const RelayTopicOptions & opts = {}
) const
```

## Parameters

| Name          | Type                        | Required | Default | Description |
| ------------- | --------------------------- | -------- | ------- | ----------- |
| `resource_id` | `const std::string &`       | yes      | —       | —           |
| `topic`       | `const std::string &`       | yes      | —       | —           |
| `opts`        | `const RelayTopicOptions &` | no       | `{}`    | —           |

## Returns

`json`

## Source

[`include/signalwire/rest/rest_client.hpp`](https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/rest/rest_client.hpp)

Line 597.
