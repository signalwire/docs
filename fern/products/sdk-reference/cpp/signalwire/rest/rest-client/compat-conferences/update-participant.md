---
slug: "/reference/cpp/signalwire/rest/rest-client/compat-conferences/update-participant"
title: "update_participant"
sdk_label: "C++ SDK"
icon: "cpp"
lustri:
  auto_generated: true
  kind: "method"
  language: "cpp"
  qualified_name: "signalwire::rest::RestClient::CompatConferences::update_participant"
  parent: "signalwire::rest::RestClient::CompatConferences"
  module: "signalwire.rest.RestClient"
  source_url: "https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/rest/rest_client.hpp"
  visibility: "public"
---
# `update_participant`

**Modifiers:** `const` `inline`

## Signature

```cpp
json update_participant(
    const std::string & conference_sid,
    const std::string & call_sid,
    const json & data
) const
```

## Parameters

| Name             | Type                  | Required | Default | Description |
| ---------------- | --------------------- | -------- | ------- | ----------- |
| `conference_sid` | `const std::string &` | yes      | —       | —           |
| `call_sid`       | `const std::string &` | yes      | —       | —           |
| `data`           | `const json &`        | yes      | —       | —           |

## Returns

`json`

## Source

[`include/signalwire/rest/rest_client.hpp`](https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/rest/rest_client.hpp)

Line 985.
