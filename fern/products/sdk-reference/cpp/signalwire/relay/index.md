---
slug: "/reference/cpp/signalwire/relay"
title: "relay"
sdk_label: "C++ SDK"
icon: "cpp"
lustri:
  auto_generated: true
  kind: "module"
  language: "cpp"
  qualified_name: "signalwire::relay"
  parent: "signalwire"
  module: "signalwire"
  source_url: "https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/relay/action.hpp"
---
# `relay`

## Signature

```cpp
namespace signalwire::relay
```

## Constants

| Name                         | Type                                      | Required | Default | Description |
| ---------------------------- | ----------------------------------------- | -------- | ------- | ----------- |
| `AGENT_STRING`               | `const char * AGENT_STRING`               | yes      | —       | —           |
| `CALL_STATE_ANSWERED`        | `const char * CALL_STATE_ANSWERED`        | yes      | —       | —           |
| `CALL_STATE_CREATED`         | `const char * CALL_STATE_CREATED`         | yes      | —       | —           |
| `CALL_STATE_ENDED`           | `const char * CALL_STATE_ENDED`           | yes      | —       | —           |
| `CALL_STATE_ENDING`          | `const char * CALL_STATE_ENDING`          | yes      | —       | —           |
| `CALL_STATE_RINGING`         | `const char * CALL_STATE_RINGING`         | yes      | —       | —           |
| `COMPONENT_STATE_ERROR`      | `const char * COMPONENT_STATE_ERROR`      | yes      | —       | —           |
| `COMPONENT_STATE_FINISHED`   | `const char * COMPONENT_STATE_FINISHED`   | yes      | —       | —           |
| `COMPONENT_STATE_NO_INPUT`   | `const char * COMPONENT_STATE_NO_INPUT`   | yes      | —       | —           |
| `COMPONENT_STATE_PLAYING`    | `const char * COMPONENT_STATE_PLAYING`    | yes      | —       | —           |
| `COMPONENT_STATE_RECORDING`  | `const char * COMPONENT_STATE_RECORDING`  | yes      | —       | —           |
| `CONNECT_STATE_CONNECTED`    | `const char * CONNECT_STATE_CONNECTED`    | yes      | —       | —           |
| `CONNECT_STATE_CONNECTING`   | `const char * CONNECT_STATE_CONNECTING`   | yes      | —       | —           |
| `CONNECT_STATE_DISCONNECTED` | `const char * CONNECT_STATE_DISCONNECTED` | yes      | —       | —           |
| `CONNECT_STATE_FAILED`       | `const char * CONNECT_STATE_FAILED`       | yes      | —       | —           |
| `DEFAULT_HOST`               | `const char * DEFAULT_HOST`               | yes      | —       | —           |
| `DEFAULT_MAX_ACTIVE_CALLS`   | `int DEFAULT_MAX_ACTIVE_CALLS`            | yes      | —       | —           |
| `DEFAULT_MAX_CONNECTIONS`    | `int DEFAULT_MAX_CONNECTIONS`             | yes      | —       | —           |
| `DEFAULT_PORT`               | `int DEFAULT_PORT`                        | yes      | —       | —           |
| `EVENT_CALL_COLLECT`         | `const char * EVENT_CALL_COLLECT`         | yes      | —       | —           |
| `EVENT_CALL_CONNECT`         | `const char * EVENT_CALL_CONNECT`         | yes      | —       | —           |
| `EVENT_CALL_DETECT`          | `const char * EVENT_CALL_DETECT`          | yes      | —       | —           |
| `EVENT_CALL_FAX`             | `const char * EVENT_CALL_FAX`             | yes      | —       | —           |
| `EVENT_CALL_PLAY`            | `const char * EVENT_CALL_PLAY`            | yes      | —       | —           |
| `EVENT_CALL_RECEIVED`        | `const char * EVENT_CALL_RECEIVED`        | yes      | —       | —           |
| `EVENT_CALL_RECORD`          | `const char * EVENT_CALL_RECORD`          | yes      | —       | —           |
| `EVENT_CALL_SEND_DIGITS`     | `const char * EVENT_CALL_SEND_DIGITS`     | yes      | —       | —           |
| `EVENT_CALL_STATE`           | `const char * EVENT_CALL_STATE`           | yes      | —       | —           |
| `EVENT_CALL_TAP`             | `const char * EVENT_CALL_TAP`             | yes      | —       | —           |
| `EVENT_MESSAGING_RECEIVE`    | `const char * EVENT_MESSAGING_RECEIVE`    | yes      | —       | —           |
| `EVENT_MESSAGING_STATE`      | `const char * EVENT_MESSAGING_STATE`      | yes      | —       | —           |
| `MAX_RECONNECT_ATTEMPTS`     | `int MAX_RECONNECT_ATTEMPTS`              | yes      | —       | —           |
| `PROTOCOL_PREFIX`            | `const char * PROTOCOL_PREFIX`            | yes      | —       | —           |
| `RECONNECT_BACKOFF_FACTOR`   | `double RECONNECT_BACKOFF_FACTOR`         | yes      | —       | —           |
| `RECONNECT_BASE_DELAY_MS`    | `int RECONNECT_BASE_DELAY_MS`             | yes      | —       | —           |
| `RECONNECT_MAX_DELAY_MS`     | `int RECONNECT_MAX_DELAY_MS`              | yes      | —       | —           |

## Functions

- [`base64_encode`](/reference/cpp/signalwire/relay/base64-encode)
- [`tcp_connect`](/reference/cpp/signalwire/relay/tcp-connect)

## Type Aliases

- [`CallEventHandler`](/reference/cpp/signalwire/relay/call-event-handler) — Callback for call events.
- [`EventHandler`](/reference/cpp/signalwire/relay/event-handler) — Generic callback for any inbound signalwire.event. Fired in addition to the typed handlers (on\_call, on\_message, action callbacks). Useful for tracing and for tests/audits that need to assert event delivery.
- [`InboundCallHandler`](/reference/cpp/signalwire/relay/inbound-call-handler) — Callback for inbound calls.
- [`InboundMessageHandler`](/reference/cpp/signalwire/relay/inbound-message-handler) — Callback for inbound messages.
- [`json`](/reference/cpp/signalwire/relay/json)

## Classes

- [`Action`](/reference/cpp/signalwire/relay/action) — Represents a controllable in-progress operation (play, record, collect, etc.) Uses shared internal state so the object can be copied/moved freely while maintaining a single underlying condition\_variable for synchronization.
- [`Call`](/reference/cpp/signalwire/relay/call) — Represents a live call with methods for call control. Uses shared internal state so the object can be copied/returned by value. All command methods send JSON-RPC requests through the RelayClient.
- [`CallEvent`](/reference/cpp/signalwire/relay/call-event) — Call-specific event parsed from calling.call.state and other call events.
- [`ComponentEvent`](/reference/cpp/signalwire/relay/component-event) — Play/Record/Collect component event with control\_id for action routing.
- [`DialEvent`](/reference/cpp/signalwire/relay/dial-event) — Dial-specific event with nested call info and tag-based correlation.
- [`Message`](/reference/cpp/signalwire/relay/message) — Represents an SMS/MMS message tracked through delivery states. States: "queued", "initiated", "sent", "delivered", "undelivered", "failed" Uses shared internal state so the object can be copied/returned by value — copies of a Message observe the same state updates as the underlying instance the registry tracks.
- [`MessageEvent`](/reference/cpp/signalwire/relay/message-event) — Messaging event for SMS/MMS state changes and inbound messages.
- [`RelayClient`](/reference/cpp/signalwire/relay/relay-client) — Real-time call control and messaging client over WebSocket. Implements the full JSON-RPC 2.0 protocol with four correlation mechanisms: JSON-RPC id -> pending map for RPC response matching call\_id -> Call object map for event routing control\_id -> Action per Call for action event routing tag -> pending dials map for dial event matching
- [`RelayConfig`](/reference/cpp/signalwire/relay/relay-config) — Configuration for the RELAY client.
- [`RelayEvent`](/reference/cpp/signalwire/relay/relay-event) — Base class for all RELAY events parsed from signalwire.event JSON-RPC messages.
- [`WebSocketClient`](/reference/cpp/signalwire/relay/web-socket-client) — Minimal WebSocket client using raw TCP sockets + OpenSSL TLS. Implements RFC 6455 text frame encoding/decoding for JSON-RPC transport.

## Source

[`include/signalwire/relay/action.hpp`](https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/relay/action.hpp)

Line 14.
