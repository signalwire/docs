---
slug: "/reference/cpp/signalwire/relay/tcp-connect"
title: "tcp_connect"
sdk_label: "C++ SDK"
icon: "cpp"
lustri:
  auto_generated: true
  kind: "function"
  language: "cpp"
  qualified_name: "signalwire::relay::tcp_connect"
  parent: "signalwire::relay"
  module: "signalwire"
  source_url: "https://github.com/signalwire/signalwire-cpp/blob/main/src/relay/websocket.cpp"
  visibility: "public"
---
# `tcp_connect`

**Modifiers:** `static`

## Signature

```cpp
bool tcp_connect(
    int & sock_fd,
    const std::string & host,
    int port,
    WebSocketClient::ErrorCallback & on_error
)
```

## Parameters

| Name       | Type                               | Required | Default | Description |
| ---------- | ---------------------------------- | -------- | ------- | ----------- |
| `sock_fd`  | `int &`                            | yes      | —       | —           |
| `host`     | `const std::string &`              | yes      | —       | —           |
| `port`     | `int`                              | yes      | —       | —           |
| `on_error` | `WebSocketClient::ErrorCallback &` | yes      | —       | —           |

## Returns

`bool`

## Source

[`src/relay/websocket.cpp`](https://github.com/signalwire/signalwire-cpp/blob/main/src/relay/websocket.cpp)

Line 81.
