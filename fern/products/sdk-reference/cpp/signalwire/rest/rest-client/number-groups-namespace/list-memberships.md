---
slug: "/reference/cpp/signalwire/rest/rest-client/number-groups-namespace/list-memberships"
title: "list_memberships"
sdk_label: "C++ SDK"
icon: "cpp"
lustri:
  auto_generated: true
  kind: "method"
  language: "cpp"
  qualified_name: "signalwire::rest::RestClient::NumberGroupsNamespace::list_memberships"
  parent: "signalwire::rest::RestClient::NumberGroupsNamespace"
  module: "signalwire.rest.RestClient"
  source_url: "https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/rest/rest_client.hpp"
  visibility: "public"
---
# `list_memberships`

**Modifiers:** `const` `inline`

## Signature

```cpp
json list_memberships(
    const std::string & group_id,
    const std::map< std::string, std::string > & params = {}
) const
```

## Parameters

| Name       | Type                                           | Required | Default | Description |
| ---------- | ---------------------------------------------- | -------- | ------- | ----------- |
| `group_id` | `const std::string &`                          | yes      | —       | —           |
| `params`   | `const std::map< std::string, std::string > &` | no       | `{}`    | —           |

## Returns

`json`

## Source

[`include/signalwire/rest/rest_client.hpp`](https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/rest/rest_client.hpp)

Line 1182.
