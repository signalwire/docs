---
slug: "/reference/cpp/signalwire/relay/web-socket-client/close"
title: "close"
sdk_label: "C++ SDK"
icon: "cpp"
lustri:
  auto_generated: true
  kind: "method"
  language: "cpp"
  qualified_name: "signalwire::relay::WebSocketClient::close"
  parent: "signalwire::relay::WebSocketClient"
  module: "signalwire.relay"
  source_url: "https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/relay/websocket.hpp"
  visibility: "public"
---
# `close`

Close the WebSocket connection gracefully.

## Signature

```cpp
void close(int code = 1000, const std::string & reason = "")
```

## Parameters

| Name     | Type                  | Required | Default | Description |
| -------- | --------------------- | -------- | ------- | ----------- |
| `code`   | `int`                 | no       | `1000`  | —           |
| `reason` | `const std::string &` | no       | `""`    | —           |

## Source

[`include/signalwire/relay/websocket.hpp`](https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/relay/websocket.hpp)

Line 39.
