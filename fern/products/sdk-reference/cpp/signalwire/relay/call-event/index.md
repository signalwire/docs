---
slug: "/reference/cpp/signalwire/relay/call-event"
title: "CallEvent"
sdk_label: "C++ SDK"
icon: "cpp"
lustri:
  auto_generated: true
  kind: "class"
  language: "cpp"
  qualified_name: "signalwire::relay::CallEvent"
  parent: "signalwire::relay"
  module: "signalwire.relay"
  source_url: "https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/relay/relay_event.hpp"
  visibility: "public"
---
# `CallEvent`

Call-specific event parsed from calling.call.state and other call events.

## Signature

```cpp
struct signalwire::relay::CallEvent : signalwire::relay::RelayEvent
```

## Inheritance

**Extends:** [signalwire::relay::RelayEvent](/reference/cpp/signalwire/relay/relay-event)

## Properties

| Name           | Type                                        | Required | Default | Description |
| -------------- | ------------------------------------------- | -------- | ------- | ----------- |
| `call_id`      | `std::string call_id`                       | yes      | —       | —           |
| `call_state`   | `std::string call_state`                    | yes      | —       | —           |
| `node_id`      | `std::string node_id`                       | yes      | —       | —           |
| `peer_call_id` | `std::optional< std::string > peer_call_id` | yes      | —       | —           |
| `tag`          | `std::string tag`                           | yes      | —       | —           |

## Methods

- [`from_relay_event`](/reference/cpp/signalwire/relay/call-event/from-relay-event)

## Source

[`include/signalwire/relay/relay_event.hpp`](https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/relay/relay_event.hpp)

Line 38.
