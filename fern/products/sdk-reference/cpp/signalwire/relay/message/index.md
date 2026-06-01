---
slug: "/reference/cpp/signalwire/relay/message"
title: "Message"
sdk_label: "C++ SDK"
icon: "cpp"
lustri:
  auto_generated: true
  kind: "class"
  language: "cpp"
  qualified_name: "signalwire::relay::Message"
  parent: "signalwire::relay"
  module: "signalwire.relay"
  source_url: "https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/relay/message.hpp"
  visibility: "public"
---
# `Message`

Represents an SMS/MMS message tracked through delivery states. States: "queued", "initiated", "sent", "delivered", "undelivered", "failed" Uses shared internal state so the object can be copied/returned by value — copies of a Message observe the same state updates as the underlying instance the registry tracks.

## Signature

```cpp
struct signalwire::relay::Message
```

## Properties

| Name         | Type                               | Required | Default | Description |
| ------------ | ---------------------------------- | -------- | ------- | ----------- |
| `body`       | `std::string body`                 | yes      | —       | —           |
| `direction`  | `std::string direction`            | yes      | —       | —           |
| `from`       | `std::string from`                 | yes      | —       | —           |
| `media`      | `std::vector< std::string > media` | yes      | —       | —           |
| `message_id` | `std::string message_id`           | yes      | —       | —           |
| `region`     | `std::string region`               | yes      | —       | —           |
| `tags`       | `std::vector< std::string > tags`  | yes      | —       | —           |
| `to`         | `std::string to`                   | yes      | —       | —           |

## Methods

- [`~Message`](/reference/cpp/signalwire/relay/message/message__2)
- [`from_params`](/reference/cpp/signalwire/relay/message/from-params) — Parse from a RELAY event params object.
- [`is_delivered`](/reference/cpp/signalwire/relay/message/is-delivered)
- [`is_failed`](/reference/cpp/signalwire/relay/message/is-failed)
- [`is_terminal`](/reference/cpp/signalwire/relay/message/is-terminal)
- [`Message`](/reference/cpp/signalwire/relay/message/message)
- [`on_completed`](/reference/cpp/signalwire/relay/message/on-completed) — Set callback for when message reaches terminal state. If the message is already terminal the callback fires immediately.
- [`operator=`](/reference/cpp/signalwire/relay/message/operator)
- [`reason`](/reference/cpp/signalwire/relay/message/reason)
- [`set_reason`](/reference/cpp/signalwire/relay/message/set-reason)
- [`set_state`](/reference/cpp/signalwire/relay/message/set-state)
- [`state`](/reference/cpp/signalwire/relay/message/state)
- [`update_state`](/reference/cpp/signalwire/relay/message/update-state) — Update state from a messaging.state event. Notifies waiters / callbacks when the state is terminal.
- [`wait`](/reference/cpp/signalwire/relay/message/wait) — Block until message reaches a terminal state. Returns true if terminal, false on timeout.

## Type Aliases

- [`CompletedCallback`](/reference/cpp/signalwire/relay/message/completed-callback)

## Source

[`include/signalwire/relay/message.hpp`](https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/relay/message.hpp)

Line 24.
