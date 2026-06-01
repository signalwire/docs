---
slug: "/reference/ruby/signal-wire/relay/client"
title: "Client"
sdk_label: "Ruby SDK"
icon: "ruby"
lustri:
  auto_generated: true
  kind: "class"
  language: "ruby"
  qualified_name: "SignalWire::Relay::Client"
  parent: "SignalWire::Relay"
  module: "SignalWire.Relay"
  source_url: "https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/relay/client.rb"
  visibility: "public"
---
# `Client`

RelayClient -- WebSocket + JSON-RPC 2.0 protocol + event dispatch.

One instance = one persistent WebSocket connection to SignalWire RELAY.

Implements the 4 correlation mechanisms:

1. JSON-RPC id -> pending hash with ConditionVariable
2. call\_id -> Call routing
3. control\_id -> Action tracking per Call
4. tag -> dial correlation

## Signature

```ruby
class Client < Object
```

## Inheritance

**Extends:** `Object`

## Methods

- [`_authorization_state`](/reference/ruby/signal-wire/relay/client/authorization-state) — Return the SDK's tracked authorization-state blob (Python parity: +RelayClient.\_authorization\_state+). Captured from +signalwire.authorization.state+ events for use on reconnect.
- [`_calls_snapshot`](/reference/ruby/signal-wire/relay/client/calls-snapshot) — Return the current call\_id -> Call registry (a snapshot copy). Test/audit-only surface for asserting on internal routing state; the Python reference exposes the same via +RelayClient.\_calls+.
- [`_connected?`](/reference/ruby/signal-wire/relay/client/connected) — True when the client believes the WebSocket is open. Exposed for tests that need to assert the recv loop is still alive after an injected error / handler exception.
- [`_set_protocol`](/reference/ruby/signal-wire/relay/client/set-protocol) — Test/reconnect surface: stamp a previously issued protocol string before calling +run+ so the next signalwire.connect frame carries it (the production server replies with +session\_restored: true+). Mirrors Python's +RelayClient.\_relay\_protocol = ...+.
- [`dial`](/reference/ruby/signal-wire/relay/client/dial) — Dial outbound call(s). Returns a Call object.
- [`execute`](/reference/ruby/signal-wire/relay/client/execute) — Send a JSON-RPC request and wait for the response. Returns the result hash. Raises RelayError on error.
- [`host`](/reference/ruby/signal-wire/relay/client/host) — Returns the value of attribute host.
- [`initialize`](/reference/ruby/signal-wire/relay/client/initialize) — Python parity: `RelayClient(project=None, token=None, jwt_token=None, host=None, contexts=None, max_active_calls=None)`. Ruby v1 accepted `space:` for the same purpose; both keyword names are honoured for backwards compat. `host` is the canonical Python name and now drives the WebSocket endpoint.
- [`max_active_calls`](/reference/ruby/signal-wire/relay/client/max-active-calls) — Returns the value of attribute max\_active\_calls.
- [`on_call`](/reference/ruby/signal-wire/relay/client/on-call) — Register inbound call handler.
- [`on_event`](/reference/ruby/signal-wire/relay/client/on-event) — Register a generic inbound-event handler. Called for every +signalwire.event+ frame BEFORE the type-specific handlers (call/message/dial) run. Used by integration probes (e.g. the audit harness) that need to react to raw events.
- [`on_message`](/reference/ruby/signal-wire/relay/client/on-message) — Register inbound message handler.
- [`project_id`](/reference/ruby/signal-wire/relay/client/project-id) — Returns the value of attribute project\_id.
- [`protocol`](/reference/ruby/signal-wire/relay/client/protocol) — Returns the value of attribute protocol.
- [`receive`](/reference/ruby/signal-wire/relay/client/receive) — ------------------------------------------------------------------ Dynamic context subscription ------------------------------------------------------------------
- [`run`](/reference/ruby/signal-wire/relay/client/run) — Connect, authenticate, subscribe, and enter the read loop. Blocks until stop is called.
- [`send_json`](/reference/ruby/signal-wire/relay/client/send-json) — Send an arbitrary JSON-RPC frame to the server. Public surface for tests, the audit harness, and one-off RELAY methods that don't have a high-level wrapper. Returns nothing; outbound failures are silently ignored (matching +\_send\_json+ semantics).
- [`send_message`](/reference/ruby/signal-wire/relay/client/send-message) — Send an SMS/MMS message. Returns a Message object.
- [`stop`](/reference/ruby/signal-wire/relay/client/stop) — Graceful shutdown.
- [`unreceive`](/reference/ruby/signal-wire/relay/client/unreceive)

## Source

[`lib/signalwire/relay/client.rb`](https://github.com/signalwire/signalwire-ruby/blob/main/lib/signalwire/relay/client.rb)

Line 35.
