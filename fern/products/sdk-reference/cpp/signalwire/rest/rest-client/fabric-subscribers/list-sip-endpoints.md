---
slug: "/reference/cpp/signalwire/rest/rest-client/fabric-subscribers/list-sip-endpoints"
title: "list_sip_endpoints"
sdk_label: "C++ SDK"
icon: "cpp"
lustri:
  auto_generated: true
  kind: "method"
  language: "cpp"
  qualified_name: "signalwire::rest::RestClient::FabricSubscribers::list_sip_endpoints"
  parent: "signalwire::rest::RestClient::FabricSubscribers"
  module: "signalwire.rest.RestClient"
  source_url: "https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/rest/rest_client.hpp"
  visibility: "public"
---
# `list_sip_endpoints`

**Modifiers:** `const` `inline`

## Signature

```cpp
json list_sip_endpoints(
    const std::string & subscriber_id,
    const std::map< std::string, std::string > & params = {}
) const
```

## Parameters

| Name            | Type                                           | Required | Default | Description |
| --------------- | ---------------------------------------------- | -------- | ------- | ----------- |
| `subscriber_id` | `const std::string &`                          | yes      | —       | —           |
| `params`        | `const std::map< std::string, std::string > &` | no       | `{}`    | —           |

## Returns

`json`

## Source

[`include/signalwire/rest/rest_client.hpp`](https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/rest/rest_client.hpp)

Line 115.
