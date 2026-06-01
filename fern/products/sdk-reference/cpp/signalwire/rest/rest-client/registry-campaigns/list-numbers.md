---
slug: "/reference/cpp/signalwire/rest/rest-client/registry-campaigns/list-numbers"
title: "list_numbers"
sdk_label: "C++ SDK"
icon: "cpp"
lustri:
  auto_generated: true
  kind: "method"
  language: "cpp"
  qualified_name: "signalwire::rest::RestClient::RegistryCampaigns::list_numbers"
  parent: "signalwire::rest::RestClient::RegistryCampaigns"
  module: "signalwire.rest.RestClient"
  source_url: "https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/rest/rest_client.hpp"
  visibility: "public"
---
# `list_numbers`

**Modifiers:** `const` `inline`

## Signature

```cpp
json list_numbers(
    const std::string & campaign_id,
    const std::map< std::string, std::string > & params = {}
) const
```

## Parameters

| Name          | Type                                           | Required | Default | Description |
| ------------- | ---------------------------------------------- | -------- | ------- | ----------- |
| `campaign_id` | `const std::string &`                          | yes      | —       | —           |
| `params`      | `const std::map< std::string, std::string > &` | no       | `{}`    | —           |

## Returns

`json`

## Source

[`include/signalwire/rest/rest_client.hpp`](https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/rest/rest_client.hpp)

Line 1285.
