---
slug: "/reference/cpp/signalwire/relay/relay-client/send-raw-request"
title: "send_raw_request"
sdk_label: "C++ SDK"
icon: "cpp"
lustri:
  auto_generated: true
  kind: "method"
  language: "cpp"
  qualified_name: "signalwire::relay::RelayClient::send_raw_request"
  parent: "signalwire::relay::RelayClient"
  module: "signalwire.relay"
  source_url: "https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/relay/client.hpp"
  visibility: "public"
---
# `send_raw_request`

Send a JSON-RPC request to the server. Public so harnesses and tests can drive arbitrary methods (e.g. an explicit signalwire.subscribe ack frame for the audit fixture).

## Signature

```cpp
json send_raw_request(const std::string & method, const json & params)
```

## Parameters

| Name     | Type                  | Required | Default | Description |
| -------- | --------------------- | -------- | ------- | ----------- |
| `method` | `const std::string &` | yes      | —       | —           |
| `params` | `const json &`        | yes      | —       | —           |

## Returns

`json`

## Source

[`include/signalwire/relay/client.hpp`](https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/relay/client.hpp)

Line 111.
