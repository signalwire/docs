---
slug: "/reference/cpp/signalwire/relay/message-event"
title: "MessageEvent"
sdk_label: "C++ SDK"
icon: "cpp"
lustri:
  auto_generated: true
  kind: "class"
  language: "cpp"
  qualified_name: "signalwire::relay::MessageEvent"
  parent: "signalwire::relay"
  module: "signalwire.relay"
  source_url: "https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/relay/relay_event.hpp"
  visibility: "public"
---
# `MessageEvent`

Messaging event for SMS/MMS state changes and inbound messages.

## Signature

```cpp
struct signalwire::relay::MessageEvent : signalwire::relay::RelayEvent
```

## Inheritance

**Extends:** [signalwire::relay::RelayEvent](/reference/cpp/signalwire/relay/relay-event)

## Properties

| Name            | Type                        | Required | Default | Description |
| --------------- | --------------------------- | -------- | ------- | ----------- |
| `body`          | `std::string body`          | yes      | —       | —           |
| `from`          | `std::string from`          | yes      | —       | —           |
| `message_id`    | `std::string message_id`    | yes      | —       | —           |
| `message_state` | `std::string message_state` | yes      | —       | —           |
| `to`            | `std::string to`            | yes      | —       | —           |

## Methods

- [`from_relay_event`](/reference/cpp/signalwire/relay/message-event/from-relay-event)

## Source

[`include/signalwire/relay/relay_event.hpp`](https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/relay/relay_event.hpp)

Line 85.
