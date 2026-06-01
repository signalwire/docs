---
slug: "/reference/cpp/signalwire/relay/web-socket-client"
title: "WebSocketClient"
sdk_label: "C++ SDK"
icon: "cpp"
lustri:
  auto_generated: true
  kind: "class"
  language: "cpp"
  qualified_name: "signalwire::relay::WebSocketClient"
  parent: "signalwire::relay"
  module: "signalwire.relay"
  source_url: "https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/relay/websocket.hpp"
  visibility: "public"
---
# `WebSocketClient`

Minimal WebSocket client using raw TCP sockets + OpenSSL TLS. Implements RFC 6455 text frame encoding/decoding for JSON-RPC transport.

## Signature

```cpp
class signalwire::relay::WebSocketClient
```

## Methods

- [`~WebSocketClient`](/reference/cpp/signalwire/relay/web-socket-client/web-socket-client__2)
- [`close`](/reference/cpp/signalwire/relay/web-socket-client/close) — Close the WebSocket connection gracefully.
- [`connect`](/reference/cpp/signalwire/relay/web-socket-client/connect) — Connect to wss://host:port/ with TLS.
- [`connect_plain`](/reference/cpp/signalwire/relay/web-socket-client/connect-plain) — Connect to ws://host:port/ without TLS (plain TCP). Used by audit fixtures and local dev servers that don't speak TLS. Production always uses TLS via the connect() overload above.
- [`is_connected`](/reference/cpp/signalwire/relay/web-socket-client/is-connected) — Check if connected.
- [`on_close`](/reference/cpp/signalwire/relay/web-socket-client/on-close) — Set callback for connection close.
- [`on_error`](/reference/cpp/signalwire/relay/web-socket-client/on-error) — Set callback for errors.
- [`on_message`](/reference/cpp/signalwire/relay/web-socket-client/on-message) — Set callback for received text messages.
- [`operator=`](/reference/cpp/signalwire/relay/web-socket-client/operator)
- [`send`](/reference/cpp/signalwire/relay/web-socket-client/send) — Send a text frame.
- [`WebSocketClient`](/reference/cpp/signalwire/relay/web-socket-client/web-socket-client)

## Type Aliases

- [`CloseCallback`](/reference/cpp/signalwire/relay/web-socket-client/close-callback)
- [`ErrorCallback`](/reference/cpp/signalwire/relay/web-socket-client/error-callback)
- [`MessageCallback`](/reference/cpp/signalwire/relay/web-socket-client/message-callback)

## Source

[`include/signalwire/relay/websocket.hpp`](https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/relay/websocket.hpp)

Line 18.
