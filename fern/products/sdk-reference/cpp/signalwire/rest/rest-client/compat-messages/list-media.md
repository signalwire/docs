---
slug: "/reference/cpp/signalwire/rest/rest-client/compat-messages/list-media"
title: "list_media"
sdk_label: "C++ SDK"
icon: "cpp"
lustri:
  auto_generated: true
  kind: "method"
  language: "cpp"
  qualified_name: "signalwire::rest::RestClient::CompatMessages::list_media"
  parent: "signalwire::rest::RestClient::CompatMessages"
  module: "signalwire.rest.RestClient"
  source_url: "https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/rest/rest_client.hpp"
  visibility: "public"
---
# `list_media`

**Modifiers:** `const` `inline`

## Signature

```cpp
json list_media(
    const std::string & message_sid,
    const std::map< std::string, std::string > & params = {}
) const
```

## Parameters

| Name          | Type                                           | Required | Default | Description |
| ------------- | ---------------------------------------------- | -------- | ------- | ----------- |
| `message_sid` | `const std::string &`                          | yes      | —       | —           |
| `params`      | `const std::map< std::string, std::string > &` | no       | `{}`    | —           |

## Returns

`json`

## Source

[`include/signalwire/rest/rest_client.hpp`](https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/rest/rest_client.hpp)

Line 840.
