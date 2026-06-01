---
slug: "/reference/cpp/signalwire/rest/rest-client/compat-calls/start-stream"
title: "start_stream"
sdk_label: "C++ SDK"
icon: "cpp"
lustri:
  auto_generated: true
  kind: "method"
  language: "cpp"
  qualified_name: "signalwire::rest::RestClient::CompatCalls::start_stream"
  parent: "signalwire::rest::RestClient::CompatCalls"
  module: "signalwire.rest.RestClient"
  source_url: "https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/rest/rest_client.hpp"
  visibility: "public"
---
# `start_stream`

**Modifiers:** `const` `inline`

## Signature

```cpp
json start_stream(const std::string & call_sid, const json & data) const
```

## Parameters

| Name       | Type                  | Required | Default | Description |
| ---------- | --------------------- | -------- | ------- | ----------- |
| `call_sid` | `const std::string &` | yes      | —       | —           |
| `data`     | `const json &`        | yes      | —       | —           |

## Returns

`json`

## Source

[`include/signalwire/rest/rest_client.hpp`](https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/rest/rest_client.hpp)

Line 822.
