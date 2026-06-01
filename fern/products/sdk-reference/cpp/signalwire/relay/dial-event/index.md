---
slug: "/reference/cpp/signalwire/relay/dial-event"
title: "DialEvent"
sdk_label: "C++ SDK"
icon: "cpp"
lustri:
  auto_generated: true
  kind: "class"
  language: "cpp"
  qualified_name: "signalwire::relay::DialEvent"
  parent: "signalwire::relay"
  module: "signalwire.relay"
  source_url: "https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/relay/relay_event.hpp"
  visibility: "public"
---
# `DialEvent`

Dial-specific event with nested call info and tag-based correlation.

## Signature

```cpp
struct signalwire::relay::DialEvent : signalwire::relay::RelayEvent
```

## Inheritance

**Extends:** [signalwire::relay::RelayEvent](/reference/cpp/signalwire/relay/relay-event)

## Properties

| Name         | Type                     | Required | Default | Description |
| ------------ | ------------------------ | -------- | ------- | ----------- |
| `call_info`  | `json call_info`         | yes      | —       | —           |
| `dial_state` | `std::string dial_state` | yes      | —       | —           |
| `tag`        | `std::string tag`        | yes      | —       | —           |

## Methods

- [`from_relay_event`](/reference/cpp/signalwire/relay/dial-event/from-relay-event)

## Source

[`include/signalwire/relay/relay_event.hpp`](https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/relay/relay_event.hpp)

Line 108.
