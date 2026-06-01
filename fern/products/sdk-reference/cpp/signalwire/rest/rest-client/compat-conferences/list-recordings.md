---
slug: "/reference/cpp/signalwire/rest/rest-client/compat-conferences/list-recordings"
title: "list_recordings"
sdk_label: "C++ SDK"
icon: "cpp"
lustri:
  auto_generated: true
  kind: "method"
  language: "cpp"
  qualified_name: "signalwire::rest::RestClient::CompatConferences::list_recordings"
  parent: "signalwire::rest::RestClient::CompatConferences"
  module: "signalwire.rest.RestClient"
  source_url: "https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/rest/rest_client.hpp"
  visibility: "public"
---
# `list_recordings`

**Modifiers:** `const` `inline`

## Signature

```cpp
json list_recordings(
    const std::string & conference_sid,
    const std::map< std::string, std::string > & params = {}
) const
```

## Parameters

| Name             | Type                                           | Required | Default | Description |
| ---------------- | ---------------------------------------------- | -------- | ------- | ----------- |
| `conference_sid` | `const std::string &`                          | yes      | —       | —           |
| `params`         | `const std::map< std::string, std::string > &` | no       | `{}`    | —           |

## Returns

`json`

## Source

[`include/signalwire/rest/rest_client.hpp`](https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/rest/rest_client.hpp)

Line 996.
