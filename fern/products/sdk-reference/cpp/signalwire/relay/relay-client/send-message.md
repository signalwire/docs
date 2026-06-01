---
slug: "/reference/cpp/signalwire/relay/relay-client/send-message"
title: "send_message"
sdk_label: "C++ SDK"
icon: "cpp"
lustri:
  auto_generated: true
  kind: "method"
  language: "cpp"
  qualified_name: "signalwire::relay::RelayClient::send_message"
  parent: "signalwire::relay::RelayClient"
  module: "signalwire.relay"
  source_url: "https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/relay/client.hpp"
  visibility: "public"
---
# `send_message`

Send an SMS/MMS message via messaging.send. Returns a Message tracker whose state advances as the server pushes messaging.state events. Use Message::wait() to block until the terminal state (delivered / undelivered / failed).

## Signature

```cpp
Message send_message(
    const std::string & from,
    const std::string & to,
    const std::string & body,
    const std::vector< std::string > & media = {},
    const std::vector< std::string > & tags = {},
    const std::string & region = "",
    const std::string & context = ""
)
```

## Parameters

| Name      | Type                                 | Required | Default | Description |
| --------- | ------------------------------------ | -------- | ------- | ----------- |
| `from`    | `const std::string &`                | yes      | —       | —           |
| `to`      | `const std::string &`                | yes      | —       | —           |
| `body`    | `const std::string &`                | yes      | —       | —           |
| `media`   | `const std::vector< std::string > &` | no       | `{}`    | —           |
| `tags`    | `const std::vector< std::string > &` | no       | `{}`    | —           |
| `region`  | `const std::string &`                | no       | `""`    | —           |
| `context` | `const std::string &`                | no       | `""`    | —           |

## Returns

`Message`

## Source

[`include/signalwire/relay/client.hpp`](https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/relay/client.hpp)

Line 120.
