---
slug: "/reference/cpp/signalwire/relay/relay-client"
title: "RelayClient"
sdk_label: "C++ SDK"
icon: "cpp"
lustri:
  auto_generated: true
  kind: "class"
  language: "cpp"
  qualified_name: "signalwire::relay::RelayClient"
  parent: "signalwire::relay"
  module: "signalwire.relay"
  source_url: "https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/relay/client.hpp"
  visibility: "public"
---
# `RelayClient`

Real-time call control and messaging client over WebSocket. Implements the full JSON-RPC 2.0 protocol with four correlation mechanisms:
JSON-RPC id -> pending map for RPC response matching
call\_id -> Call object map for event routing
control\_id -> Action per Call for action event routing
tag -> pending dials map for dial event matching

## Signature

```cpp
class signalwire::relay::RelayClient
```

## Methods

- [`~RelayClient`](/reference/cpp/signalwire/relay/relay-client/relay-client__2)
- [`config`](/reference/cpp/signalwire/relay/relay-client/config)
- [`connect`](/reference/cpp/signalwire/relay/relay-client/connect)
- [`dial`](/reference/cpp/signalwire/relay/relay-client/dial) — Dial outbound. The devices argument is the nested "device-of-leg-of-leg" array used by the Python SDK (\[\[{type:phone,...}]]). Returns a Call once the server emits calling.call.dial(answered) for the dial's tag, or an empty Call on timeout / failure. tag lets callers pin an explicit dial tag for journal-based assertions; if blank, a UUID is generated. dial\_timeout\_ms caps how long dial() blocks waiting for the server's terminal dial event. max\_duration (seconds) is forwarded into the calling.dial frame when non-zero.
- [`disconnect`](/reference/cpp/signalwire/relay/relay-client/disconnect)
- [`execute`](/reference/cpp/signalwire/relay/relay-client/execute)
- [`find_call`](/reference/cpp/signalwire/relay/relay-client/find-call)
- [`from_env`](/reference/cpp/signalwire/relay/relay-client/from-env) — Construct from environment variables: SIGNALWIRE\_PROJECT\_ID, SIGNALWIRE\_API\_TOKEN, SIGNALWIRE\_SPACE
- [`is_connected`](/reference/cpp/signalwire/relay/relay-client/is-connected)
- [`on_call`](/reference/cpp/signalwire/relay/relay-client/on-call)
- [`on_event`](/reference/cpp/signalwire/relay/relay-client/on-event) — Register a generic event observer. Called for every dispatched signalwire.event after typed routing (on\_call/on\_message/action callbacks) has run. Multiple registrations are NOT supported — the most-recent registration wins.
- [`on_message`](/reference/cpp/signalwire/relay/relay-client/on-message)
- [`operator=`](/reference/cpp/signalwire/relay/relay-client/operator)
- [`register_call`](/reference/cpp/signalwire/relay/relay-client/register-call)
- [`relay_protocol`](/reference/cpp/signalwire/relay/relay-client/relay-protocol)
- [`RelayClient`](/reference/cpp/signalwire/relay/relay-client/relay-client) — Construct from explicit configuration.
- [`run`](/reference/cpp/signalwire/relay/relay-client/run)
- [`send_message`](/reference/cpp/signalwire/relay/relay-client/send-message) — Send an SMS/MMS message via messaging.send. Returns a Message tracker whose state advances as the server pushes messaging.state events. Use Message::wait() to block until the terminal state (delivered / undelivered / failed).
- [`send_raw_request`](/reference/cpp/signalwire/relay/relay-client/send-raw-request) — Send a JSON-RPC request to the server. Public so harnesses and tests can drive arbitrary methods (e.g. an explicit signalwire.subscribe ack frame for the audit fixture).
- [`subscribe`](/reference/cpp/signalwire/relay/relay-client/subscribe)
- [`unregister_call`](/reference/cpp/signalwire/relay/relay-client/unregister-call)
- [`unsubscribe`](/reference/cpp/signalwire/relay/relay-client/unsubscribe)

## Source

[`include/signalwire/relay/client.hpp`](https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/relay/client.hpp)

Line 56.
