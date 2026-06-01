---
slug: "/reference/cpp/signalwire/relay/relay-config"
title: "RelayConfig"
sdk_label: "C++ SDK"
icon: "cpp"
lustri:
  auto_generated: true
  kind: "class"
  language: "cpp"
  qualified_name: "signalwire::relay::RelayConfig"
  parent: "signalwire::relay"
  module: "signalwire.relay"
  source_url: "https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/relay/client.hpp"
  visibility: "public"
---
# `RelayConfig`

Configuration for the RELAY client.

## Signature

```cpp
struct signalwire::relay::RelayConfig
```

## Properties

| Name               | Type                                  | Required | Default | Description |
| ------------------ | ------------------------------------- | -------- | ------- | ----------- |
| `contexts`         | `std::vector< std::string > contexts` | yes      | —       | —           |
| `host`             | `std::string host`                    | yes      | —       | —           |
| `max_active_calls` | `int max_active_calls`                | yes      | —       | —           |
| `max_connections`  | `int max_connections`                 | yes      | —       | —           |
| `port`             | `int port`                            | yes      | —       | —           |
| `project`          | `std::string project`                 | yes      | —       | —           |
| `token`            | `std::string token`                   | yes      | —       | —           |

## Source

[`include/signalwire/relay/client.hpp`](https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/relay/client.hpp)

Line 40.
