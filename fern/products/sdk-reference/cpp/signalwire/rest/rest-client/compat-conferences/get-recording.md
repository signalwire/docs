---
slug: "/reference/cpp/signalwire/rest/rest-client/compat-conferences/get-recording"
title: "get_recording"
sdk_label: "C++ SDK"
icon: "cpp"
lustri:
  auto_generated: true
  kind: "method"
  language: "cpp"
  qualified_name: "signalwire::rest::RestClient::CompatConferences::get_recording"
  parent: "signalwire::rest::RestClient::CompatConferences"
  module: "signalwire.rest.RestClient"
  source_url: "https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/rest/rest_client.hpp"
  visibility: "public"
---
# `get_recording`

**Modifiers:** `const` `inline`

## Signature

```cpp
json get_recording(
    const std::string & conference_sid,
    const std::string & recording_sid
) const
```

## Parameters

| Name             | Type                  | Required | Default | Description |
| ---------------- | --------------------- | -------- | ------- | ----------- |
| `conference_sid` | `const std::string &` | yes      | —       | —           |
| `recording_sid`  | `const std::string &` | yes      | —       | —           |

## Returns

`json`

## Source

[`include/signalwire/rest/rest_client.hpp`](https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/rest/rest_client.hpp)

Line 1000.
