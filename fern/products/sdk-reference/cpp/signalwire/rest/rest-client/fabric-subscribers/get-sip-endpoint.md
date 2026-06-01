---
slug: "/reference/cpp/signalwire/rest/rest-client/fabric-subscribers/get-sip-endpoint"
title: "get_sip_endpoint"
sdk_label: "C++ SDK"
icon: "cpp"
lustri:
  auto_generated: true
  kind: "method"
  language: "cpp"
  qualified_name: "signalwire::rest::RestClient::FabricSubscribers::get_sip_endpoint"
  parent: "signalwire::rest::RestClient::FabricSubscribers"
  module: "signalwire.rest.RestClient"
  source_url: "https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/rest/rest_client.hpp"
  visibility: "public"
---
# `get_sip_endpoint`

**Modifiers:** `const` `inline`

## Signature

```cpp
json get_sip_endpoint(
    const std::string & subscriber_id,
    const std::string & endpoint_id
) const
```

## Parameters

| Name            | Type                  | Required | Default | Description |
| --------------- | --------------------- | -------- | ------- | ----------- |
| `subscriber_id` | `const std::string &` | yes      | —       | —           |
| `endpoint_id`   | `const std::string &` | yes      | —       | —           |

## Returns

`json`

## Source

[`include/signalwire/rest/rest_client.hpp`](https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/rest/rest_client.hpp)

Line 122.
