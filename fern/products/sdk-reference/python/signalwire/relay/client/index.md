---
slug: "/reference/python/signalwire/relay/client"
title: "client"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "module"
  language: "python"
  qualified_name: "signalwire.relay.client"
  parent: "signalwire.relay"
  module: "signalwire.relay"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/relay/client.py"
---
# `client`

RelayClient — WebSocket + JSON-RPC 2.0 protocol + event dispatch.

One instance = one persistent WebSocket connection to SignalWire RELAY.

Architecture notes (mirrors the JS SDK):

- JSON-RPC requests are tracked by `id` in `_pending`; responses resolve
  the corresponding Future.
- `signalwire.event` messages are acknowledged back to the server (event ACK)
  and then dispatched by `event_type` → Call object → Action object.
- Each Action registers with a `control_id` and listens for its own
  event\_type (e.g. `calling.call.play`).  Actions filter events by
  `control_id` so multiple concurrent actions on the same call work.
- Result code checking accepts any 2xx (matching the JS SDK regex /^2\[0-9]\[0-9]$/).
  `signalwire.connect` responses skip code checking entirely.
- Execute has a configurable timeout (default 10s) to detect half-open connections.
- Requests made while disconnected are queued and flushed after re-auth.
- Server pings are tracked; if no ping arrives within the check interval the
  connection is assumed half-open and force-closed for reconnect.

## Signature

```python
module client
```

## Properties

| Name             | Type             | Required | Default | Description |
| ---------------- | ---------------- | -------- | ------- | ----------- |
| `CallHandler`    | `CallHandler`    | yes      | —       | —           |
| `logger`         | `logger`         | yes      | —       | —           |
| `MessageHandler` | `MessageHandler` | yes      | —       | —           |

## Classes

- [`RelayClient`](/reference/python/signalwire/relay/client/relay-client) — Manages a WebSocket connection to SignalWire RELAY.
- [`RelayError`](/reference/python/signalwire/relay/client/relay-error) — Error returned by the RELAY server.

## Source

[`/src/signalwire/signalwire/relay/client.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/relay/client.py)
