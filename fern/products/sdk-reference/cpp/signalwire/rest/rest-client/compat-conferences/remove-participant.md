---
slug: "/reference/cpp/signalwire/rest/rest-client/compat-conferences/remove-participant"
title: "remove_participant"
sdk_label: "C++ SDK"
icon: "cpp"
lustri:
  auto_generated: true
  kind: "method"
  language: "cpp"
  qualified_name: "signalwire::rest::RestClient::CompatConferences::remove_participant"
  parent: "signalwire::rest::RestClient::CompatConferences"
  module: "signalwire.rest.RestClient"
  source_url: "https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/rest/rest_client.hpp"
  visibility: "public"
---
# `remove_participant`

**Modifiers:** `const` `inline`

## Signature

```cpp
json remove_participant(
    const std::string & conference_sid,
    const std::string & call_sid
) const
```

## Parameters

| Name             | Type                  | Required | Default | Description |
| ---------------- | --------------------- | -------- | ------- | ----------- |
| `conference_sid` | `const std::string &` | yes      | —       | —           |
| `call_sid`       | `const std::string &` | yes      | —       | —           |

## Returns

`json`

## Source

[`include/signalwire/rest/rest_client.hpp`](https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/rest/rest_client.hpp)

Line 990.
