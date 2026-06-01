---
slug: "/reference/cpp/signalwire/relay/component-event"
title: "ComponentEvent"
sdk_label: "C++ SDK"
icon: "cpp"
lustri:
  auto_generated: true
  kind: "class"
  language: "cpp"
  qualified_name: "signalwire::relay::ComponentEvent"
  parent: "signalwire::relay"
  module: "signalwire.relay"
  source_url: "https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/relay/relay_event.hpp"
  visibility: "public"
---
# `ComponentEvent`

Play/Record/Collect component event with control\_id for action routing.

## Signature

```cpp
struct signalwire::relay::ComponentEvent : signalwire::relay::RelayEvent
```

## Inheritance

**Extends:** [signalwire::relay::RelayEvent](/reference/cpp/signalwire/relay/relay-event)

## Properties

| Name         | Type                     | Required | Default | Description |
| ------------ | ------------------------ | -------- | ------- | ----------- |
| `call_id`    | `std::string call_id`    | yes      | —       | —           |
| `control_id` | `std::string control_id` | yes      | —       | —           |
| `state`      | `std::string state`      | yes      | —       | —           |

## Methods

- [`from_relay_event`](/reference/cpp/signalwire/relay/component-event/from-relay-event)

## Source

[`include/signalwire/relay/relay_event.hpp`](https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/relay/relay_event.hpp)

Line 66.
