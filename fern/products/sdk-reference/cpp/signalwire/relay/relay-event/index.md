---
slug: "/reference/cpp/signalwire/relay/relay-event"
title: "RelayEvent"
sdk_label: "C++ SDK"
icon: "cpp"
lustri:
  auto_generated: true
  kind: "class"
  language: "cpp"
  qualified_name: "signalwire::relay::RelayEvent"
  parent: "signalwire::relay"
  module: "signalwire.relay"
  source_url: "https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/relay/relay_event.hpp"
  visibility: "public"
---
# `RelayEvent`

Base class for all RELAY events parsed from signalwire.event JSON-RPC messages.

## Signature

```cpp
struct signalwire::relay::RelayEvent
```

## Properties

| Name            | Type                                              | Required | Default | Description |
| --------------- | ------------------------------------------------- | -------- | ------- | ----------- |
| `event_channel` | `std::string event_channel`                       | yes      | —       | —           |
| `event_type`    | `std::string event_type`                          | yes      | —       | —           |
| `params`        | `json params`                                     | yes      | —       | —           |
| `timestamp`     | `std::chrono::system_clock::time_point timestamp` | yes      | —       | —           |

## Methods

- [`from_json`](/reference/cpp/signalwire/relay/relay-event/from-json) — Parse from a signalwire.event params JSON. The outer params contains event\_type and the inner params with event-specific data.
- [`RelayEvent`](/reference/cpp/signalwire/relay/relay-event/relay-event)

## Source

[`include/signalwire/relay/relay_event.hpp`](https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/relay/relay_event.hpp)

Line 16.
